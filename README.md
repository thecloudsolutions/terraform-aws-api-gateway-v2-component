<!-- markdownlint-disable -->
[![Release](https://img.shields.io/github/v/release/thecloudsolutions/terraform-aws-api-gateway-v2-component?style=for-the-badge&color=6150E8)](https://github.com/thecloudsolutions/terraform-aws-api-gateway-v2-component/releases)
[![Commit](https://img.shields.io/github/last-commit/thecloudsolutions/terraform-aws-api-gateway-v2-component?style=for-the-badge&color=FF9800)](https://github.com/thecloudsolutions/terraform-aws-api-gateway-v2-component/commits)
[![Issues](https://img.shields.io/github/issues/thecloudsolutions/terraform-aws-api-gateway-v2-component?style=for-the-badge&color=BB019E)](https://github.com/thecloudsolutions/terraform-aws-api-gateway-v2-component/issues)
[![Terraform](https://img.shields.io/badge/IaC-Terraform-009FD2?style=for-the-badge)](#requirements)
[![License](https://img.shields.io/github/license/thecloudsolutions/terraform-aws-api-gateway-v2-component?style=for-the-badge&color=3FB950)](https://github.com/thecloudsolutions/terraform-aws-api-gateway-v2-component/blob/main/LICENSE)

# terraform-aws-api-gateway-v2-component

[![Cloud Solutions Banner][banner]](https://thecloudsolutions.com/)

[![Sponsor Us](https://img.shields.io/badge/sponsor_us-FF9800?style=for-the-badge)](https://github.com/sponsors/thecloudsolutions)
[![Hire Us](https://img.shields.io/badge/hire_us-009FD2?style=for-the-badge)](https://thecloudsolutions.com/contact-us)
[![Maintained By](https://img.shields.io/badge/maintained_by-Cloud_Solutions-6150E8?style=for-the-badge)](https://thecloudsolutions.com/)

## Description

Terraform component that creates and manages Amazon API Gateway HTTP and WebSocket APIs, authorizers, VPC links, integrations, routes, deployments, stages, custom domains, and API mappings. Supports CORS, access logging, and mutual TLS authentication.

## Variable Naming

In all Cloud Solutions **components** and **modules**, we intentionally use the _map suffix for input variables that accept map(object(...)).

For example:
```hcl
variable "api_gateway_v2_map" {
  type        = map(object({ ... }))
  description = "Keyed collection of api_gateway_v2 definitions"
}
```
⚠️ This is a deliberate deviation from [Terraform Style Guide](https://developer.hashicorp.com/terraform/language/syntax/style).

We fully acknowledge that this naming convention does not follow the Terraform style guide, which recommends naming variables based on what they represent, not how they're implemented. We understand this, and want to emphasize:

1. This is a deliberate, informed decision, not an oversight.
2. Our primary goal is clarity and consistency for developers using our modules.
3. The intent is to give users immediate understanding of what kind of structure they're supplying.

### ✅ Why we made this decision (for our components and modules only)

This convention exists only within our components and modules structure. Here's why it works well for us:

1. Instant clarity for users - The _map suffix immediately signals that the variable supports multiple instances, each keyed by name. This avoids confusion around whether a variable is singular or plural.
2. Uniformity across all resources - Instead of struggling with awkward plurals (like kmses, rdses, vpcs, cloudfronts, account_managements) or inconsistent suffixes (_configs, _definitions, etc.), we use one simple, predictable pattern.
3. Avoids naming collisions - The _map suffix never conflicts with native Terraform or AWS resource types.
4. Future-proof for contributors - When contributors see _map, they can safely assume the structure is a map(object(...)) without checking variables.tf.

### 🙌 What this means for contributors

If you're contributing to Cloud Solutions components or modules, please:

1. Use the _map suffix when introducing a new map(object(...)) variable.
2. Follow the naming pattern consistently: rds_map, vpc_map, cloudfront_map, etc.
3. Don't apply this convention to Terraform projects outside components or modules - it's a local convention, not a global best practice.

If you have strong opinions or ideas for evolving this standard, you're welcome to open a discussion.

## Usage

```hcl
module "terraform-aws-api-gateway-v2-component" {
  source = "git::https://github.com/thecloudsolutions/terraform-aws-api-gateway-v2-component.git"
  # Cloud Solutions recommends to pin every module to a specific version
  # ?ref=x.x.x

  # Required variables
  api_gateway_v2_map = {
    key = <value>
  }
}
```

> [!IMPORTANT]
> In our examples we don't pin modules to specific versions to keep the documentation aligned with the latest releases.
> However, for your own projects, we recommend to pin each module to the exact version you're using. This approach helps maintain the stability of your infrastructure.
> Additionally, adopting a structured process for version updates will help prevent unexpected changes.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.15.8 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 6.60.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_api_gateway_v2"></a> [api\_gateway\_v2](#module\_api\_gateway\_v2) | ./module | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_api_gateway_v2_map"></a> [api\_gateway\_v2\_map](#input\_api\_gateway\_v2\_map) | Keyed collection of api\_gateway\_v2 definitions. Child api\_id fields default to the managed API; child regions default to that API region when api\_id is omitted. | <pre>map(object({<br/>    api = optional(object({<br/>      name                         = string<br/>      protocol_type                = string<br/>      region                       = optional(string)<br/>      api_key_selection_expression = optional(string)<br/>      body                         = optional(string)<br/>      # (Optional) OpenAPI JSON or YAML. Do not also manage the same routes and integrations through their maps.<br/>      cors_configuration = optional(object({<br/>        allow_credentials = optional(bool)<br/>        allow_headers     = optional(set(string))<br/>        allow_methods     = optional(set(string))<br/>        allow_origins     = optional(set(string))<br/>        expose_headers    = optional(set(string))<br/>        max_age           = optional(number)<br/>      }))<br/>      credentials_arn              = optional(string)<br/>      description                  = optional(string)<br/>      disable_execute_api_endpoint = optional(bool)<br/>      fail_on_warnings             = optional(bool)<br/>      ip_address_type              = optional(string)<br/>      route_key                    = optional(string)<br/>      route_selection_expression   = optional(string)<br/>      target                       = optional(string)<br/>      # (Optional) Quick-create target. AWS owns the generated integration, route and default stage.<br/>      api_gateway_version = optional(string)<br/>      tags                = optional(map(string))<br/>    }))<br/>    # (Optional) Omit api when managing children of an existing API through their explicit api_id fields.<br/><br/>    authorizers = optional(map(object({<br/>      api_id                            = optional(string)<br/>      region                            = optional(string)<br/>      name                              = string<br/>      authorizer_type                   = string<br/>      authorizer_credentials_arn        = optional(string)<br/>      authorizer_payload_format_version = optional(string)<br/>      authorizer_result_ttl_in_seconds  = optional(number)<br/>      authorizer_uri                    = optional(string)<br/>      enable_simple_responses           = optional(bool)<br/>      identity_sources                  = optional(set(string), [])<br/>      jwt_configuration = optional(object({<br/>        audience = optional(set(string))<br/>        issuer   = optional(string)<br/>      }))<br/>      timeouts = optional(object({<br/>        delete = optional(string)<br/>      }))<br/>    })), {})<br/><br/>    vpc_links = optional(map(object({<br/>      name               = string<br/>      region             = optional(string)<br/>      security_group_ids = set(string)<br/>      subnet_ids         = set(string)<br/>      tags               = optional(map(string))<br/>    })), {})<br/><br/>    integrations = optional(map(object({<br/>      api_id           = optional(string)<br/>      region           = optional(string)<br/>      integration_type = string<br/>      connection_id    = optional(string)<br/>      # (Optional) Explicit VPC link ID. Takes precedence over vpc_link_custom_name.<br/>      vpc_link_custom_name = optional(string)<br/>      # (Optional) Key in vpc_links. Set connection_type to VPC_LINK for a private integration.<br/>      connection_type           = optional(string)<br/>      content_handling_strategy = optional(string)<br/>      credentials_arn           = optional(string)<br/>      description               = optional(string)<br/>      integration_method        = optional(string)<br/>      integration_subtype       = optional(string)<br/>      integration_uri           = optional(string)<br/>      passthrough_behavior      = optional(string)<br/>      payload_format_version    = optional(string)<br/>      request_parameters        = optional(map(string))<br/>      request_templates         = optional(map(string))<br/>      response_parameters = optional(set(object({<br/>        status_code = string<br/>        mappings    = map(string)<br/>      })), [])<br/>      template_selection_expression = optional(string)<br/>      timeout_milliseconds          = optional(number)<br/>      tls_config = optional(object({<br/>        server_name_to_verify = optional(string)<br/>      }))<br/>    })), {})<br/><br/>    routes = optional(map(object({<br/>      api_id    = optional(string)<br/>      region    = optional(string)<br/>      route_key = string<br/>      target    = optional(string)<br/>      # (Optional) Native integrations/ID target. Takes precedence over integration_custom_name.<br/>      integration_custom_name = optional(string)<br/>      # (Optional) Key in integrations. Multiple routes can reference the same integration.<br/>      authorizer_id = optional(string)<br/>      # (Optional) Explicit authorizer ID. Takes precedence over authorizer_custom_name.<br/>      authorizer_custom_name = optional(string)<br/>      # (Optional) Key in authorizers. Set authorization_type to JWT or CUSTOM as appropriate.<br/>      authorization_type         = optional(string)<br/>      authorization_scopes       = optional(set(string), [])<br/>      api_key_required           = optional(bool)<br/>      model_selection_expression = optional(string)<br/>      operation_name             = optional(string)<br/>      request_models             = optional(map(string))<br/>      request_parameter = optional(set(object({<br/>        request_parameter_key = string<br/>        required              = bool<br/>      })), [])<br/>      route_response_selection_expression = optional(string)<br/>    })), {})<br/><br/>    deployments = optional(map(object({<br/>      api_id      = optional(string)<br/>      region      = optional(string)<br/>      description = optional(string)<br/>      triggers    = optional(map(string), {})<br/>      # (Optional) Additional redeployment triggers. The redeployment key is reserved for the managed API configuration hash.<br/>    })), {})<br/><br/>    stages = optional(map(object({<br/>      api_id      = optional(string)<br/>      region      = optional(string)<br/>      name        = string<br/>      auto_deploy = optional(bool)<br/>      # (Optional) Enable automatic HTTP API deployments. Do not combine with deployment_id or deployment_custom_name.<br/>      deployment_id = optional(string)<br/>      # (Optional) Explicit deployment ID. Takes precedence over deployment_custom_name.<br/>      deployment_custom_name = optional(string)<br/>      # (Optional) Key in deployments. Use for a stage without auto_deploy.<br/>      access_log_settings = optional(object({<br/>        destination_arn = string<br/>        format          = string<br/>      }))<br/>      client_certificate_id = optional(string)<br/>      default_route_settings = optional(object({<br/>        data_trace_enabled       = optional(bool)<br/>        detailed_metrics_enabled = optional(bool)<br/>        logging_level            = optional(string)<br/>        throttling_burst_limit   = optional(number)<br/>        throttling_rate_limit    = optional(number)<br/>      }))<br/>      description = optional(string)<br/>      route_settings = optional(set(object({<br/>        route_key                = string<br/>        data_trace_enabled       = optional(bool)<br/>        detailed_metrics_enabled = optional(bool)<br/>        logging_level            = optional(string)<br/>        throttling_burst_limit   = optional(number)<br/>        throttling_rate_limit    = optional(number)<br/>      })), [])<br/>      stage_variables = optional(map(string))<br/>      tags            = optional(map(string))<br/>    })), {})<br/><br/>    domain_names = optional(map(object({<br/>      domain_name = string<br/>      region      = optional(string)<br/>      domain_name_configuration = object({<br/>        certificate_arn                        = string<br/>        endpoint_type                          = string<br/>        security_policy                        = string<br/>        ip_address_type                        = optional(string)<br/>        ownership_verification_certificate_arn = optional(string)<br/>      })<br/>      mutual_tls_authentication = optional(object({<br/>        truststore_uri     = string<br/>        truststore_version = optional(string)<br/>      }))<br/>      routing_mode = optional(string)<br/>      timeouts = optional(object({<br/>        create = optional(string)<br/>        update = optional(string)<br/>      }))<br/>      tags = optional(map(string))<br/>    })), {})<br/><br/>    api_mappings = optional(map(object({<br/>      api_id      = optional(string)<br/>      region      = optional(string)<br/>      domain_name = optional(string)<br/>      # (Optional) Explicit domain name. Takes precedence over domain_name_custom_name.<br/>      domain_name_custom_name = optional(string)<br/>      # (Optional) Key in domain_names. Required when domain_name is omitted.<br/>      stage = optional(string)<br/>      # (Optional) Explicit stage name. Takes precedence over stage_custom_name.<br/>      stage_custom_name = optional(string)<br/>      # (Optional) Key in stages. Required when stage is omitted.<br/>      api_mapping_key = optional(string)<br/>    })), {})<br/>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_api_gateway_v2_api_ids"></a> [api\_gateway\_v2\_api\_ids](#output\_api\_gateway\_v2\_api\_ids) | API identifiers by API Gateway definition. |
| <a name="output_api_gateway_v2_api_endpoints"></a> [api\_gateway\_v2\_api\_endpoints](#output\_api\_gateway\_v2\_api\_endpoints) | API endpoints by API Gateway definition. |
| <a name="output_api_gateway_v2_api_arns"></a> [api\_gateway\_v2\_api\_arns](#output\_api\_gateway\_v2\_api\_arns) | API ARNs by API Gateway definition. |
| <a name="output_api_gateway_v2_api_execution_arns"></a> [api\_gateway\_v2\_api\_execution\_arns](#output\_api\_gateway\_v2\_api\_execution\_arns) | API execution ARN prefixes for invocation permissions. |
| <a name="output_api_gateway_v2_api_ip_address_types"></a> [api\_gateway\_v2\_api\_ip\_address\_types](#output\_api\_gateway\_v2\_api\_ip\_address\_types) | IP address types by API Gateway definition. |
| <a name="output_api_gateway_v2_api_tags_all"></a> [api\_gateway\_v2\_api\_tags\_all](#output\_api\_gateway\_v2\_api\_tags\_all) | API tags, including provider default tags. |
| <a name="output_api_gateway_v2_authorizer_ids"></a> [api\_gateway\_v2\_authorizer\_ids](#output\_api\_gateway\_v2\_authorizer\_ids) | Authorizer identifiers by API Gateway definition and logical name. |
| <a name="output_api_gateway_v2_vpc_link_ids"></a> [api\_gateway\_v2\_vpc\_link\_ids](#output\_api\_gateway\_v2\_vpc\_link\_ids) | VPC link identifiers by API Gateway definition and logical name. |
| <a name="output_api_gateway_v2_vpc_link_arns"></a> [api\_gateway\_v2\_vpc\_link\_arns](#output\_api\_gateway\_v2\_vpc\_link\_arns) | VPC link ARNs by API Gateway definition and logical name. |
| <a name="output_api_gateway_v2_vpc_link_tags_all"></a> [api\_gateway\_v2\_vpc\_link\_tags\_all](#output\_api\_gateway\_v2\_vpc\_link\_tags\_all) | VPC link tags, including provider default tags. |
| <a name="output_api_gateway_v2_integration_ids"></a> [api\_gateway\_v2\_integration\_ids](#output\_api\_gateway\_v2\_integration\_ids) | Integration identifiers by API Gateway definition and logical name. |
| <a name="output_api_gateway_v2_integration_response_selection_expressions"></a> [api\_gateway\_v2\_integration\_response\_selection\_expressions](#output\_api\_gateway\_v2\_integration\_response\_selection\_expressions) | Integration response selection expressions by API Gateway definition and logical name. |
| <a name="output_api_gateway_v2_route_ids"></a> [api\_gateway\_v2\_route\_ids](#output\_api\_gateway\_v2\_route\_ids) | Route identifiers by API Gateway definition and logical name. |
| <a name="output_api_gateway_v2_deployment_ids"></a> [api\_gateway\_v2\_deployment\_ids](#output\_api\_gateway\_v2\_deployment\_ids) | Deployment identifiers by API Gateway definition and logical name. |
| <a name="output_api_gateway_v2_deployment_auto_deployed"></a> [api\_gateway\_v2\_deployment\_auto\_deployed](#output\_api\_gateway\_v2\_deployment\_auto\_deployed) | Whether each deployment was automatically released. |
| <a name="output_api_gateway_v2_stage_ids"></a> [api\_gateway\_v2\_stage\_ids](#output\_api\_gateway\_v2\_stage\_ids) | Stage identifiers by API Gateway definition and logical name. |
| <a name="output_api_gateway_v2_stage_arns"></a> [api\_gateway\_v2\_stage\_arns](#output\_api\_gateway\_v2\_stage\_arns) | Stage ARNs by API Gateway definition and logical name. |
| <a name="output_api_gateway_v2_stage_execution_arns"></a> [api\_gateway\_v2\_stage\_execution\_arns](#output\_api\_gateway\_v2\_stage\_execution\_arns) | Stage execution ARN prefixes for invocation permissions. |
| <a name="output_api_gateway_v2_stage_invoke_urls"></a> [api\_gateway\_v2\_stage\_invoke\_urls](#output\_api\_gateway\_v2\_stage\_invoke\_urls) | Stage invocation URLs by API Gateway definition and logical name. |
| <a name="output_api_gateway_v2_stage_tags_all"></a> [api\_gateway\_v2\_stage\_tags\_all](#output\_api\_gateway\_v2\_stage\_tags\_all) | Stage tags, including provider default tags. |
| <a name="output_api_gateway_v2_domain_name_ids"></a> [api\_gateway\_v2\_domain\_name\_ids](#output\_api\_gateway\_v2\_domain\_name\_ids) | Custom domain names by API Gateway definition and logical name. |
| <a name="output_api_gateway_v2_domain_name_arns"></a> [api\_gateway\_v2\_domain\_name\_arns](#output\_api\_gateway\_v2\_domain\_name\_arns) | Custom domain ARNs by API Gateway definition and logical name. |
| <a name="output_api_gateway_v2_domain_name_configurations"></a> [api\_gateway\_v2\_domain\_name\_configurations](#output\_api\_gateway\_v2\_domain\_name\_configurations) | Custom domain configurations, including target domain names and hosted zone IDs. |
| <a name="output_api_gateway_v2_domain_name_api_mapping_selection_expressions"></a> [api\_gateway\_v2\_domain\_name\_api\_mapping\_selection\_expressions](#output\_api\_gateway\_v2\_domain\_name\_api\_mapping\_selection\_expressions) | API mapping selection expressions by custom domain. |
| <a name="output_api_gateway_v2_domain_name_routing_modes"></a> [api\_gateway\_v2\_domain\_name\_routing\_modes](#output\_api\_gateway\_v2\_domain\_name\_routing\_modes) | Routing modes by custom domain. |
| <a name="output_api_gateway_v2_domain_name_tags_all"></a> [api\_gateway\_v2\_domain\_name\_tags\_all](#output\_api\_gateway\_v2\_domain\_name\_tags\_all) | Custom domain tags, including provider default tags. |
| <a name="output_api_gateway_v2_api_mapping_ids"></a> [api\_gateway\_v2\_api\_mapping\_ids](#output\_api\_gateway\_v2\_api\_mapping\_ids) | API mapping identifiers by API Gateway definition and logical name. |

## Quick Start

The project is under active development, and we welcome all contributors! 🎉
  
Before you start, please review our [Contributor Guidelines](https://github.com/thecloudsolutions/.github/blob/main/CONTRIBUTING.md) to understand the expectations and processes.
  
Follow these steps to get started:
  
---
  
### 1. **Fork the Repository**
- Click the **"Fork"** button on the repository's GitHub page to create a copy under your GitHub account.

> [!TIP]
> If you're new to GitHub, check out the [GitHub Docs](https://docs.github.com/en/get-started) to familiarize yourself with key concepts like forking, branching, and pull requests.
  
### 2. **Clone the Fork**
- Clone your fork to your local machine using:
  ```bash
  git clone https://github.com/<your-username>/<repository-name>.git
  ```
  
### 3. **Create a Branch**
- Create a new branch for your contribution:
  ```bash
  git checkout -b your-feature-name
  ```
  
### 4. **Make Changes**
- Implement your changes in the codebase.
- Ensure you follow the project's style guide and standards.
  
> [!WARNING]
> Always adhere to the project's coding standards and best practices outlined in the [CONTRIBUTING.md](https://github.com/thecloudsolutions/.github/blob/main/CONTRIBUTING.md) file.
    
### 5. **Test Your Changes**
- Run tests to verify your changes locally.
- Follow any project-specific testing instructions.
    
### 6. **Commit Your Changes**
- Stage and commit your changes with a clear and concise message:
  ```bash
  git add .
  git commit -m "Add description of the change"
  ```

> [!NOTE]
> Use meaningful commit messages in the present tense (e.g., "Add feature X" instead of "Added feature X").
  
### 7. **Push Your Branch**
- Push your branch to your fork:
  ```bash
  git push origin your-feature-name
  ```
    
### 8. **Open a Pull Request (PR)**
- Navigate to the original repository and click the **"New Pull Request"** button.
- Select your branch and submit your PR following the [Pull Request template](https://github.com/thecloudsolutions/.github/blob/main/.github/PULL_REQUEST_TEMPLATE/pull_request_template.md).
- Use keywords like `Closes #123` to link your PR to a related issue.
  
### **🎉 Congratulations, you’ve made your first contribution! 🎉**  
We appreciate your effort and look forward to reviewing your work.

## About Us

**Cloud Solutions: Innovating Open Source for AWS & DevOps**

Cloud Solutions creates and maintains free, open-source tools to help startups thrive in the AWS Cloud and DevOps space. Our mission is to make advanced technology accessible to businesses of all sizes.

With years of experience and a commitment to innovation, we design solutions that simplify workflows, encourage collaboration, and drive growth - removing cost barriers along the way. Every contribution brings us closer to a future where technology empowers all.

Your support makes everything we do possible.

Thank you for being part of our journey to empower innovation and build a stronger Open Source future!

## Contributing

The project is under active development, and we welcome all contributors! 🎉 

Before you start, please review our [Contributor Guidelines](CONTRIBUTING.md) to understand the expectations and processes.

## Blog

Link to our [blog](https://thecloudsolutions.com/blog), where you can explore in-depth articles. Gain valuable insights and expert analysis on AWS cloud solution strategies and trends.

## License

The project is 100% Open Source and licensed under the [APACHE2](LICENSE).

## Trademarks

All other trademarks referenced herein are the property of their respective owners.

## Copyrights

Copyright © 2020-2026 [Cloud Solutions](https://thecloudsolutions.com)

[banner]: https://github.com/thecloudsolutions/.github/blob/main/profile/banner.png