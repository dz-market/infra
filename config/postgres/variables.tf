variable "auth_database" {
  type = string
}

variable "auth_username" {
  type = string
}

variable "auth_password" {
  type      = string
  sensitive = true
  ephemeral = true
}

variable "user_database" {
  type = string
}

variable "user_username" {
  type = string
}

variable "user_password" {
  type      = string
  sensitive = true
  ephemeral = true
}
