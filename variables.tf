variable "image" {
  description = "The Droplet image ID or slug."
  type        = string
  default     = "ubuntu-22-04-x64"
  nullable = false
}

variable "name" {
  description = "The Droplet name."
  type        = string
}

variable "domain" {
  type    = string
  default = null
  nullable = true
}

variable "region" {
  description = "The region to start in."
  type        = string
  default     = "ams3"
  nullable    = false
}

variable "size" {
  description = "The unique slug that indentifies the type of Droplet. You can find a list of available slugs on DigitalOcean API documentation."
  type        = string
  default     = "s-1vcpu-1gb"
  nullable    = false
}

variable "backups" {
  description = "Boolean controlling if backups are made. Defaults to false."
  type        = bool
  default     = false
  nullable    = false
}

variable "monitoring" {
  description = "Boolean controlling whether monitoring agent is installed. Defaults to false."
  type        = bool
  default     = false
  nullable    = false
}

variable "ipv6" {
  description = "Boolean controlling if IPv6 is enabled. Defaults to false."
  type        = bool
  default     = false
  nullable    = false
}

variable "vpc_uuid" {
  description = "The ID of the VPC where the Droplet will be located."
  type        = string
  default     = null
  nullable = true
}

variable "existing_ssh_keys" {
  description = "Enable existing SSH keys"
  type        = bool
  default     = true
  nullable = false
}

variable "new_ssh_keys" {
  description = "A dict of name=pubkey of new SSH keys to add to the Droplet."
  type        = map(string)
  default     = {}
  nullable = false
}

variable "resize_disk" {
  description = "Boolean controlling whether to increase the disk size when resizing a Droplet. It defaults to true. When set to false, only the Droplet's RAM and CPU will be resized. Increasing a Droplet's disk size is a permanent change. Increasing only RAM and CPU is reversible."
  type        = bool
  default     = true
  nullable    = false
}

variable "tags" {
  description = "A list of the tags to be applied to this Droplet."
  type        = list(string)
  default     = []
  nullable = false
}

variable "user_data" {
  description = "A string of the desired User Data for the Droplet."
  type        = string
  default     = null
  nullable = true
}

variable "volume_ids" {
  description = "A list of the IDs of each block storage volume to be attached to the Droplet."
  type        = list(string)
  default     = []
  nullable = false
}

variable "project" {
  description = "A string of the desired project for the resources."
  type        = string
  default     = null
  nullable = true
}

variable "ansible_name" {
  type        = string
  description = "Defaults to the droplet name."
  default     = ""
  nullable = false
}

variable "ansible_host" {
  type        = string
  description = "Defaults to the droplet ipv4 address, ipv6 address or record name."
  default     = ""
  nullable = false
}

variable "ansible_groups" {
  type        = list(string)
  description = "Defaults to the tags."
  default     = []
  nullable    = false
}

variable "ansible_user" {
  type        = string
  description = "Defaults to root."
  default     = "root"
  nullable    = false
}

variable "ansible_ssh_pass" {
  type        = string
  description = "Defaults to null."
  default     = ""
  nullable = false
}

variable "ansible_ssh_private_key_file" {
  type        = string
  description = "Defaults to null."
  default     = ""
  nullable = false
}
