path "auth/token/roles/autounseal" {
  capabilities = ["create", "read", "update", "delete", "sudo"]
}

path "auth/token/create/autounseal" {
  capabilities = ["update"]
}