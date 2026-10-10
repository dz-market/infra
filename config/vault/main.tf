resource "vault_mount" "transit" {
  path = "transit"
  type = "transit"
}

resource "vault_transit_secret_backend_key" "access_token" {
  backend    = vault_mount.transit.path
  name       = "access-token"
  type       = "rsa-2048"
  exportable = true
}

resource "vault_policy" "token_signer" {
  name   = "token-signer"
  policy = file("${path.module}/policies/token-signer.hcl")
}

resource "vault_policy" "token_verifier" {
  name   = "token-verifier"
  policy = file("${path.module}/policies/token-verifier.hcl")
}

resource "vault_auth_backend" "approle" {
  type = "approle"
}

locals {
  services = {
    svc-auth = [vault_policy.token_signer.name, vault_policy.token_verifier.name]
    svc-user = [vault_policy.token_verifier.name]
  }
}

resource "vault_approle_auth_backend_role" "service" {
  for_each = local.services

  backend        = vault_auth_backend.approle.path
  role_name      = each.key
  token_policies = each.value
  token_ttl      = 3600
  token_max_ttl  = 86400
}

resource "vault_approle_auth_backend_role_secret_id" "service" {
  for_each = local.services

  backend   = vault_auth_backend.approle.path
  role_name = vault_approle_auth_backend_role.service[each.key].role_name
}

resource "local_file" "role_id" {
  for_each = local.services

  filename        = "/approle/${each.key}/role_id"
  content         = vault_approle_auth_backend_role.service[each.key].role_id
  file_permission = "0644"
}

resource "local_sensitive_file" "secret_id" {
  for_each = local.services

  filename        = "/approle/${each.key}/secret_id"
  content         = vault_approle_auth_backend_role_secret_id.service[each.key].secret_id
  file_permission = "0644"
}