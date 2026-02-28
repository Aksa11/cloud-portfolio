# variables.tf
variable "machine_size" {
  type        = string
  default     = "t2.micro" # This is a backup value
  description = "This defines the power of our server"
}

variable "target_vpc_id" {
  type = string
}
