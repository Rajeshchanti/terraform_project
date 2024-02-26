terraform {
  backend "s3" {
  bucket = "techy-remote-state"
  key    = "sg"
  region = "us-east-1"
  dynamodb_table = "techy-locking"  
  }
}