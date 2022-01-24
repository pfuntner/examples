variables {
  user = "root"
  group_string = "a,b,c"
  xgroup_string = "a,b,c"
}

locals {
  group_list = split(",", "${var.group_string}")
  # group_list = var.group_string == "" ? [] : split(",", var.group_string)
}

source "null" "example" {
    communicator = "none"
}

build {
  sources = [
    "source.null.example"
  ]
  provisioner "shell-local" {
    # inline  = ["echo Hello, $USER and $GROUPS"]
    # inline  = ["echo Hello, $USER and ${join(",", local.group_list)}"]
    inline  = ["echo Hello, $USER and ${length(local.group_list)}"]
    # environment_vars = ["USER=${var.user}", "GROUPS=${join(",", ["a", "b"])}"]
    # environment_vars = ["USER=${var.user}", "GROUPS=${join(",", local.group_list)}"]
    environment_vars = ["USER=${var.user}"]
  }
}
