terraform {
  backend "s3" {
    bucket  = "cicddemo-infinitelinux"
    key     = "terraform/state"
    region  = "us-west-2"   
    encrypt = true         
  }
}

