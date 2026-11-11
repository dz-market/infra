resource "vault_mount" "transit" {
  path = "transit"
  type = "transit"

  lifecycle {
    prevent_destroy = true
  }
}

resource "vault_transit_secret_backend_key" "access_token" {
  backend    = vault_mount.transit.path
  name       = "access-token"
  type       = "rsa-2048"
  exportable = true

  lifecycle {
    prevent_destroy = true
  }
}

resource "vault_policy" "token_signer" {
  name   = "token-signer"
  policy = file("${path.module}/policies/token-signer.hcl")
}

resource "vault_policy" "infra_config" {
  name   = "infra-config"
  policy = file("${path.module}/../policies/configurator.hcl")
}

resource "vault_auth_backend" "approle" {
  type = "approle"
}

locals {
  roles = {
    infra-config = [
      vault_policy.infra_config.name
    ]

    svc-auth = [
      vault_policy.token_signer.name,
    ]
  }
}

resource "vault_approle_auth_backend_role" "role" {
  for_each = local.roles

  backend        = vault_auth_backend.approle.path
  role_name      = each.key
  token_policies = each.value

  token_ttl     = 3600
  token_max_ttl = 86400

  secret_id_ttl      = 0
  secret_id_num_uses = 0
}
