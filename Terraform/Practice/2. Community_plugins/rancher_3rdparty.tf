# Community Providers or 3 rd Party Providers #
# Configure the Rancher2 provider to bootstrap and admin
# Provider config for bootstrap
provider "rancher2" {
  alias = "bootstrap"

  api_url   = "https://rancher.my-domain.com"
  bootstrap = true
}

# Create a new rancher2_bootstrap using bootstrap provider config
resource "rancher2_bootstrap" "admin" {
  provider = "rancher2.bootstrap"

  password = "blahblah"
  telemetry = true
}

# Provider config for admin
provider "rancher2" {
  alias = "admin"

  api_url = rancher2_bootstrap.admin.url
  token_key = rancher2_bootstrap.admin.token
  insecure = true
}

# Create a new rancher2 resource using admin provider config
resource "rancher2_catalog" "foo" {
  provider = "rancher2.admin"

  name = "test"
  url = "http://foo.com:8080"
}
