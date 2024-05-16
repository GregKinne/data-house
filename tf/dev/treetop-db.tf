resource "google_sql_database_instance" "treetopdb_server" {
  name			        = "treetopdbserver"
  region		        = "us-east4"
  database_version	= "SQLSERVER_2019_EXPRESS"
  root_password		  = var.mssql_root_password
  settings {
    tier 		        = "db-custom-1-3840"
    disk_autoresize	= "false"
    disk_size	      = "10"

    ip_configuration {
      require_ssl	= "true"
    }
  }
}

resource "google_sql_database" "treetopdb" {
  instance      = google_sql_database_instance.treetopdb_server.name
  name          = "treetopdb"
}