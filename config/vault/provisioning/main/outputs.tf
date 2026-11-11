output "approles" {
  value = {
    for name, role in vault_approle_auth_backend_role.role :
    name => {
      role_id = role.role_id
      backend = role.backend
    }
  }
}
