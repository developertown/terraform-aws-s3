# terraform-aws-s3
<!-- BEGIN_TF_DOCS -->
# terraform-aws-s3

This module manage the AWS S3 bucket.

## Usage

### Basic

```hcl
include {
  path = find_in_parent_folders()
}

terraform {
  source = "../../..//."
}

inputs = {
  enabled = true

  region      = "us-east-2"
  environment = "test"

  name = "dt-terraform-test"

  tags = {
    "Company" = "DeveloperTown"
  }
}
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.3 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.36.1 |

## Resources

| Name | Type |
|------|------|
| [aws_s3_bucket.bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_acl.bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_acl) | resource |
| [aws_s3_bucket_ownership_controls.s3_bucket_acl_ownership](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_ownership_controls) | resource |
| [aws_s3_bucket_public_access_block.bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket_acl"></a> [bucket\_acl](#input\_bucket\_acl) | The canned ACL to apply. Defaults to 'private'. | `string` | `"private"` | no |
| <a name="input_bucket_block_public_acls"></a> [bucket\_block\_public\_acls](#input\_bucket\_block\_public\_acls) | Whether Amazon S3 should block public ACLs for this bucket. Defaults to false. | `bool` | `true` | no |
| <a name="input_bucket_block_public_policy"></a> [bucket\_block\_public\_policy](#input\_bucket\_block\_public\_policy) | Whether Amazon S3 should block public bucket policies for this bucket. Defaults to false. | `bool` | `false` | no |
| <a name="input_bucket_ignore_public_acls"></a> [bucket\_ignore\_public\_acls](#input\_bucket\_ignore\_public\_acls) | Whether Amazon S3 should ignore public ACLs for this bucket. Defaults to false. | `bool` | `false` | no |
| <a name="input_bucket_restrict_public_buckets"></a> [bucket\_restrict\_public\_buckets](#input\_bucket\_restrict\_public\_buckets) | Whether Amazon S3 should restrict public bucket policies for this bucket. Defaults to true. | `bool` | `true` | no |
| <a name="input_create_authenticated_iam_user"></a> [create\_authenticated\_iam\_user](#input\_create\_authenticated\_iam\_user) | Create an IAM user with access to this bucket | `bool` | `false` | no |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Set to false to prevent the module from creating any resources | `bool` | `null` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | ID element. Usually used for region e.g. 'uw2', 'us-west-2', OR role 'prod', 'staging', 'dev', 'UAT' | `string` | `null` | no |
| <a name="input_force_destroy"></a> [force\_destroy](#input\_force\_destroy) | Destroy all objects in the bucket before destroying the bucket | `bool` | `true` | no |
| <a name="input_name"></a> [name](#input\_name) | ID element. Usually the component or solution name, e.g. 'app' or 'jenkins'.<br>This is the only ID element not also included as a `tag`.<br>The "name" tag is set to the full `id` string. There is no tag with the value of the `name` input. | `string` | `"ecs-cluster"` | no |
| <a name="input_region"></a> [region](#input\_region) | The region in which the resources will be created | `string` | `null` | no |
| <a name="input_suffix"></a> [suffix](#input\_suffix) | Suffix to be added to the name of each resource | `string` | `""` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Additional tags (e.g. `{'Unit': 'XYZ'}`).<br>Neither the tag keys nor the tag values will be modified by this module. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_bucket_arn"></a> [bucket\_arn](#output\_bucket\_arn) | n/a |
| <a name="output_bucket_id"></a> [bucket\_id](#output\_bucket\_id) | n/a |
| <a name="output_bucket_name"></a> [bucket\_name](#output\_bucket\_name) | n/a |
| <a name="output_bucket_region"></a> [bucket\_region](#output\_bucket\_region) | n/a |
| <a name="output_bucket_regional_domain_name"></a> [bucket\_regional\_domain\_name](#output\_bucket\_regional\_domain\_name) | n/a |
| <a name="output_iam_access_key_id"></a> [iam\_access\_key\_id](#output\_iam\_access\_key\_id) | Access Key ID |
| <a name="output_iam_secret_access_key"></a> [iam\_secret\_access\_key](#output\_iam\_secret\_access\_key) | Secret Access Key. This will be written to the state file in plain-text |
<!-- END_TF_DOCS -->