resource "google_storage_bucket" "default" {
  name          	= "prod-bucket-tfstate-treetop-development"
  requester_pays	= true
  force_destroy 	= false
  location      	= "US"
  storage_class 	= "STANDARD"
  versioning {
    enabled = true
  }
}
