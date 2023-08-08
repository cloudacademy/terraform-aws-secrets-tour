variable "allocated_storage" {
  description = "The amount of storage to allocate"
  type        = number
  default     = 5
  
}

variable "engine" {
  description = "The database engine to use"
  type        = string
  default     = "mysql"
}

variable "engine_version" {
  description = "The engine version to use"
  type        = string
  default     = "5.7"
}

variable "instance_class" {
  description = "The instance class to use"
  type        = string
  default     = "db.t2.micro"
}

variable "secret_name" {
  description = "The name of the secret to create"
  type        = string
  default     = "lab/mysql/login"
}
