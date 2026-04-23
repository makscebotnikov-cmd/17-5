variable "task_ip" {
  type        = string
  description = "IPv4"
  default     = "1920.1680.0.1"
  #default     = "192.168.0.1"

  validation {
    condition     = can(regex("^((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$", var.task_ip))
    error_message = "Не угадал !!!"
  }
}

variable "task_ip_list" {
  type        = list(string)
  description = "List IPv4"
  default     = ["192.168.0.1", "1.1.1.1", "1270.0.0.1"]
  #default     = ["192.168.0.1", "1.1.1.1", "127.0.0.1"]

  validation {
    condition = alltrue([
      for ip in var.task_ip_list :
      can(regex("^((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$", ip))
    ])
    error_message = "Не угадал !!!"
  }
}
