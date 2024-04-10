data "digitalocean_project" "existing_project" {
  name = var.project
}

data "digitalocean_ssh_keys" "existing_ssh_keys" {
  count      = var.existing_ssh_keys ? 1 : 0
}

// Upload SSH keys in new_ssh_keys
resource "digitalocean_ssh_key" "new_ssh_keys" {
  for_each   = var.new_ssh_keys
  name       = var.domain != null && var.domain != "" ? "${each.key}-${var.name}.${var.domain}" : "${each.key}-${var.name}"
  public_key = each.value
}

# data "digitalocean_tags" "existing_tags" {
#   count      = length(var.tags) > 0 ? 1 : 0

#   filter {
#     key    = "name"
#     values = var.tags
#   }
# }

# resource "digitalocean_tag" "new_tags" {
#   // Only create tags that don't already exist
#   depends_on = [ data.digitalocean_tags.existing_tags ]
#   for_each = {
#     for tag in var.tags : tag => tag
#     if !contains(data.digitalocean_tags.existing_tags[0].tags.*.name, tag)
#   }
#   name     = each.value
# }

resource "digitalocean_droplet" "vm" {
  depends_on = [
    # digitalocean_tag.new_tags,
    digitalocean_ssh_key.new_ssh_keys,
    data.digitalocean_ssh_keys.existing_ssh_keys,
  ]

  image       = var.image
  name        = var.domain != null && var.domain != "" ? "${var.name}.${var.domain}" : var.name
  region      = var.region
  size        = var.size
  backups     = var.backups
  monitoring  = var.monitoring
  ipv6        = var.ipv6
  vpc_uuid    = var.vpc_uuid
  ssh_keys    = concat(try(data.digitalocean_ssh_keys.existing_ssh_keys[0].ssh_keys.*.id, []),
                       [for k, v in var.new_ssh_keys : digitalocean_ssh_key.new_ssh_keys[k].id])
  resize_disk = var.resize_disk
  tags        = var.tags
  user_data   = var.user_data
  volume_ids  = var.volume_ids
}

resource "digitalocean_project_resources" "vm" {
  project = data.digitalocean_project.existing_project.id
  resources = [
    digitalocean_droplet.vm.urn
  ]
}

resource "ansible_host" "vm" {
  name = coalesce(var.ansible_name, var.name)
  // Manually defined + tags
  groups = var.ansible_groups

  variables = {
    ansible_host = coalesce(var.ansible_host, digitalocean_droplet.vm.ipv4_address, digitalocean_droplet.vm.ipv6_address)

    ansible_user     = coalesce(var.ansible_user, "root")
    ansible_ssh_pass = coalesce(var.ansible_ssh_pass, "root")
    ansible_ssh_private_key_file = try(var.ansible_ssh_private_key_file, "")
  }
}

