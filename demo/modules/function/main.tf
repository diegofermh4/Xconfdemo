# resource "google_project_service" "cloudresourcemanager_api" {
#   project = var.project_id
#   service = "cloudresourcemanager.googleapis.com"

#   disable_dependent_services = true
# }

# resource "google_project_service" "cloudfunctions_api" {
#   project = var.project_id
#   service = "cloudfunctions.googleapis.com"

#   disable_dependent_services = true
# }

# resource "google_project_service" "cloudbuild_api" {
#   project = var.project_id
#   service = "cloudbuild.googleapis.com"

#   disable_dependent_services = true
# }

resource "google_storage_bucket" "xconf_2020_bkt" {
  name = "xconf-2020"
}

resource "google_storage_bucket_object" "func_archive" {
  name   = "index.zip"
  bucket = google_storage_bucket.xconf_2020_bkt.name
  source = "${path.module}/function.zip"
}

resource "google_cloudfunctions_function" "xconf_hello" {
  name        = "xconf-hello"
  description = "Aj Cloud Function to say hello"
  runtime     = "nodejs10"

  available_memory_mb   = 128
  source_archive_bucket = google_storage_bucket.xconf_2020_bkt.name
  source_archive_object = google_storage_bucket_object.func_archive.name
  trigger_http          = true
  timeout               = 60
  entry_point           = "helloGET"
  labels = {
    scope = "xconf2020"
  }

  environment_variables = {
    DEFAULT_NAME = "XConf"
  }
}

# IAM entry for all users to invoke the function
resource "google_cloudfunctions_function_iam_member" "invoker" {
  project        = google_cloudfunctions_function.xconf_hello.project
  region         = google_cloudfunctions_function.xconf_hello.region
  cloud_function = google_cloudfunctions_function.xconf_hello.name

  role   = "roles/cloudfunctions.invoker"
  member = "allUsers"
}