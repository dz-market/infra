vault {}

auto_auth {
  method "approle" {
    mount_path = "auth/approle"

    config = {
      role_id_file_path                   = "/run/secrets/vault/role_id"
      secret_id_file_path                 = "/run/secrets/vault/secret_id"
      remove_secret_id_file_after_reading = false
    }
  }
}

api_proxy {
  use_auto_auth_token = "force"
}

listener "tcp" {
  address                = "0.0.0.0:8200"
  tls_disable            = true
  require_request_header = true
}