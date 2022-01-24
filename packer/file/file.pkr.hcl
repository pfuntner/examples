variables {
  foo = "file.pkr.hcl"
}

source "file" "source1" {
  content = join("\n", [
    "foo: ${var.foo}",
    false ? "True" : "False",
    ""
  ])
  target = "file.txt"
}

build {
  sources = ["sources.file.source1"]
}
