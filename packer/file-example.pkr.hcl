source "file" "basic-example" {
  content = "I'm a lumberjack and I'm ok\n"
  target = "file-example.txt"
}

build {
  sources = ["sources.file.basic-example"]
}
