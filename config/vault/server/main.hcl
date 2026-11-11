ui            = true
disable_mlock = true

api_addr     = "http://vault:8200"
cluster_addr = "http://vault:8201"

listener "tcp" {
  address     = "0.0.0.0:8200"
  tls_disable = true
}

storage "raft" {
  path    = "/vault/file"
  node_id = "vault-main"
}

seal "transit" {
  address         = "http://vault-unseal:8200"
  token           = "file:///run/secrets/transit/token"
  key_name        = "autounseal"
  mount_path      = "transit/"
  disable_renewal = false
}