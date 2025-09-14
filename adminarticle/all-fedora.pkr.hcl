variable "docker_image" {
  type    = string
  default = "fedora:latest"
}

variable "fedora_version" {
  type    = string
  default = "fedora-latest"
}

packer {
  required_plugins {
    podman = {
      version = ">= 0.1.0"
      source  = "github.com/Polpetta/podman"
    }
    vagrant = {
      version = ">= 1.0.2"
      source  = "github.com/hashicorp/vagrant"
    }
  }
}

source "podman" "fedora" {
  image  = var.docker_image
  commit = true
}

source "vagrant" "fedora" {
  add_force    = true
  communicator = "ssh"
  provider     = "virtualbox"
  source_path  = "fedora/37-cloud-base"
}

build {
  name = "mrolli-packer"

  sources = [
    "source.podman.fedora",
    "source.vagrant.fedora"
  ]

  provisioner "shell" {
    script = "scripts/setup.sh"
  }

  post-processor "docker-tag" {
    repository = "mrolli-packer"
    tags       = [var.fedora_version]
    only       = ["docker.fedora"]
  }
}
