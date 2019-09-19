#terraform {
#  backend "remote" {
#    organization = "<TERRAFORM CLOUD ORGANIZATION>"
#    workspaces {
#      name = "<TERRAFORM CLOUD WORKSPACE>"
#    }
#  }
#}

provider "aws" {
  version = "~> 2.17"
  region  = "us-west-2"
}

module "lambda" {
  source        = "spring-media/lambda/aws"
  version       = "4.0.1"
  filename      = "../_build/prod/rel/<%= app_name %>/lambda.prod.zip"
  function_name = "<%= app_name %>"
  handler       = "Elixir.<%= module %>:handler"
  runtime       = "provided"
  timeout       = 5
  memory_size   = 248


  // # configurable event trigger, see examples
  // event = {
  //   type                = "cloudwatch-scheduled-event"
  //   schedule_expression = "rate(1 minute)"
  // }

  // # optionally set environment configuration
  // environment = {
  //   variables {
  //     loglevel = "INFO"
  //   }
  // }

  // # optionally set tags
  // tags = {
  //   key = "value"
  // }

  // # optionally enable VPC access
  // vpc_config = {
  //   security_group_ids = ["sg-1"]
  //   subnet_ids         = ["subnet-1", "subnet-2"]
  // }

  // # optionally configure Parameter Store access with decryption
  // ssm_parameter_names = ["some/config/root/*"]
  // kms_key_arn         = "arn:aws:kms:eu-west-1:647379381847:key/f79f2b-04684-4ad9-f9de8a-79d72f"

  // # optionally create a log subscription for streaming log events from CloudWatch to ElasticSearch
  // logfilter_destination_arn = "arn:aws:lambda:eu-west-1:647379381847:function:cloudwatch_logs_to_es_production"
}
