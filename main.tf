module "api_gateway_v2" {
  source = "./module"

  for_each = var.api_gateway_v2_map

  api          = lookup(each.value, "api", null)
  authorizers  = lookup(each.value, "authorizers", {})
  vpc_links    = lookup(each.value, "vpc_links", {})
  integrations = lookup(each.value, "integrations", {})
  routes       = lookup(each.value, "routes", {})
  deployments  = lookup(each.value, "deployments", {})
  stages       = lookup(each.value, "stages", {})
  domain_names = lookup(each.value, "domain_names", {})
  api_mappings = lookup(each.value, "api_mappings", {})
}
