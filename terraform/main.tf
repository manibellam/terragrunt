provider "null" {}

resource "null_resource" "test" {
  provisioner "local-exec" {
    command = "echo 'This is a test resource in the ${path.module} directory'"
  }

  # Using a trigger to ensure the resource is recreated on each plan/apply
  triggers = {
    always_run = "${timestamp()}"
  }
}

output "test_output" {
  value = "This is a test output for ${path.module}"
}