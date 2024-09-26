resource "kubernetes_secret" "example" {
  metadata {
    name = "${var.project_name}-secret-database"
  }

  data = {
    password = var.db_password
  }

  type = "Opaque"
}