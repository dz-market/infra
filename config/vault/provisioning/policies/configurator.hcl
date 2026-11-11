path "sys/mounts" {
  capabilities = ["read"]
}

path "sys/mounts/transit" {
  capabilities = ["create", "read", "update", "delete", "sudo"]
}

path "sys/mounts/transit/*" {
  capabilities = ["read", "update"]
}

path "sys/mounts/auth/approle" {
  capabilities = ["read"]
}

path "sys/mounts/auth/approle/*" {
  capabilities = ["read", "update"]
}

path "sys/auth" {
  capabilities = ["read"]
}

path "sys/auth/approle" {
  capabilities = ["create", "read", "update", "delete", "sudo"]
}

path "sys/auth/approle/*" {
  capabilities = ["read", "update"]
}

path "sys/policies/acl/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}

path "auth/approle/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}

path "auth/token/create" {
  capabilities = ["update"]
}

path "transit/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}