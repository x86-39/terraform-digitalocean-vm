output "id" {
  description = "The ID of the Droplet"
  value       = digitalocean_droplet.vm.id
}

output "urn" {
  description = "The uniform resource name of the Droplet"
  value       = digitalocean_droplet.vm.urn
}

output "name" {
  description = "name of the Droplet"
  value       = digitalocean_droplet.vm.name
}

output "domain" {
  description = "The domain of the Droplet"
  value       = var.domain
}

output "region" {
  description = "The region of the Droplet"
  value       = digitalocean_droplet.vm.region
}

output "image" {
  description = "The image of the Droplet"
  value       = digitalocean_droplet.vm.image
}

output "ipv6" {
  description = "Is IPv6 enabled"
  value       = digitalocean_droplet.vm.ipv6
}

output "ipv6_address" {
  description = "The IPv6 address"
  value       = digitalocean_droplet.vm.ipv6_address
}

output "ipv4_address" {
  description = "The IPv4 address"
  value       = digitalocean_droplet.vm.ipv4_address
}

output "ipv4_address_private" {
  description = "The private networking IPv4 address"
  value       = digitalocean_droplet.vm.ipv4_address_private
}

output "locked" {
  description = "Is the Droplet locked"
  value       = digitalocean_droplet.vm.locked
}

output "price_hourly" {
  description = "Droplet hourly price"
  value       = digitalocean_droplet.vm.price_hourly
}

output "price_monthly" {
  description = "Droplet monthly price"
  value       = digitalocean_droplet.vm.price_monthly
}

output "size" {
  description = "The instance size"
  value       = digitalocean_droplet.vm.size
}

output "disk" {
  description = "The size of the instance's disk in GB"
  value       = digitalocean_droplet.vm.disk
}

output "vcpus" {
  description = "The number of the instance's virtual CPUs"
  value       = digitalocean_droplet.vm.vcpus
}

output "status" {
  description = "The status of the Droplet"
  value       = digitalocean_droplet.vm.status
}

output "tags" {
  description = "The tags associated with the Droplet"
  value       = digitalocean_droplet.vm.tags
}

output "volume_ids" {
  description = "A list of the attached block storage volumes"
  value       = digitalocean_droplet.vm.volume_ids
}

output "ansible_host" {
  description = "The ansible host"
  value       = ansible_host.vm.name
}

output "ansible_groups" {
  description = "The ansible groups"
  value       = ansible_host.vm.groups
}

output "ansible_user" {
  description = "The ansible user"
  value       = var.ansible_user
}

output "ansible_ssh_pass" {
  description = "The ansible ssh password"
  value       = var.ansible_ssh_pass
}

output "ansible_ssh_private_key_file" {
  description = "The SSH private key file"
  value       = var.ansible_ssh_private_key_file
}