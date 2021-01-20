# This file contains provider configuration for this example.
# If we change provider configuration, then we need to again run `terraform init` to download provider plugins again.
# A particular version of provider plugins can also be downloaded by mentioning `version` attribute in provider block.

provider "aws" {
  region = "ap-southeast-1"             # for Singapore region
  access_key = var.ACCESS_KEY_ID
  secret_key = var.SECRET_ACCESS_KEY
}
