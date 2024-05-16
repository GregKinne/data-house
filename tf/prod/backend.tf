terraform {
  backend "gcs" {
    bucket  = "prod-bucket-tfstate-treetop-423020"
    prefix  = "terraform/state"
  }
}
