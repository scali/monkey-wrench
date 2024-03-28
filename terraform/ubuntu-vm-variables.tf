variable "vm_root_password" {
  description = "VM root password"
  type        = string
  sensitive   = true
}

# variable "access_token" {
#     type = string
#     default = <access_token>
# }
# variable "email" {
#     type = string
#     default = <client_email>
# }
# variable "privatekeypath" {
#     type = string
#     default = "~/.ssh/id_rsa"
# }
# variable "publickeypath" {
#     type = string
#     default = "~/.ssh/id_rsa.pub"
# }