locals {
  services = {
    auth = {
      database = var.auth_database
      username = var.auth_username
    }

    user = {
      database = var.user_database
      username = var.user_username
    }
  }

  passwords = {
    auth = var.auth_password
    user = var.user_password
  }
}

resource "postgresql_role" "service" {
  for_each = local.services

  name            = each.value.username
  login           = true
  superuser       = false
  create_database = false
  create_role     = false

  password_wo         = local.passwords[each.key]
  password_wo_version = "1"
}

resource "postgresql_database" "service" {
  for_each = local.services

  name  = each.value.database
  owner = postgresql_role.service[each.key].name

  lifecycle {
    prevent_destroy = true
  }
}

resource "postgresql_grant" "revoke_public_database_access" {
  for_each = local.services

  database    = postgresql_database.service[each.key].name
  role        = "public"
  object_type = "database"
  privileges  = []
}
