terraform {
  backend "s3" {
  bucket = "techy-remote-state"
  key    = "cdn"
  region = "us-east-1"
  dynamodynamodb_table = "techy-locking"  
  }
}