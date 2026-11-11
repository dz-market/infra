resource "vault_mount" "transit" {
  path = "transit"
  type = "transit"

  lifecycle {
    prevent_destroy = true
  }
}

resource "vault_transit_secret_backend_key" "autounseal" {
  backend = vault_mount.transit.path
  name    = "autounseal"
  type    = "aes256-gcm96"

  lifecycle {
    prevent_destroy = true
  }
}

resource "vault_policy" "autounseal" {
  name   = "autounseal"
  policy = file("${path.module}/policies/autounseal.hcl")
}


resource "vault_auth_backend" "approle" {
  type = "approle"
}

resource "vault_policy" "transit_config" {
  name = "transit-config"

  policy = join("\n", [
    file("${path.module}/../policies/configurator.hcl"),
    file("${path.module}/policies/token-issuer.hcl"),
  ])
}

resource "vault_approle_auth_backend_role" "config" {
  backend   = vault_auth_backend.approle.path
  role_name = "transit-config"

  token_policies = [vault_policy.transit_config.name]
  token_ttl      = 3600
  token_max_ttl  = 86400

  secret_id_ttl      = 0
  secret_id_num_uses = 0
}

resource "vault_token_auth_backend_role" "autounseal" {
  role_name        = "autounseal"
  allowed_policies = [vault_policy.autounseal.name]

  orphan                 = true
  renewable              = true
  token_period           = 2592000
  token_explicit_max_ttl = 0
}
