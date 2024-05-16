resource "google_storage_bucket" "default" {
  name          	= "prod-bucket-tfstate-treetop-423020"
  requester_pays	= true
  force_destroy 	= false
  location      	= "US"
  storage_class 	= "STANDARD"
  versioning {
    enabled = true
  }
}
