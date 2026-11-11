output "approles" {
  value = {
    transit-config = {
      role_id = vault_approle_auth_backend_role.config.role_id
      backend = vault_auth_backend.approle.path
    }
  }
}
