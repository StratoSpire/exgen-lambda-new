# <%= module %>

**TODO: Add description**

## Getting Started

Get up and running:

  * Install dependencies with `mix deps.get`
  * Run tests with `mix test`
  * Prepare your function for release with `MIX_ENV=prod mix lambda.build`
  * Deploy your function with `cd terraform/ && terraform init && terraform apply`

Once created the function can be invoked from the console, the SDK, or the CLI.
Invoking from the CLI would look like this:

```sh
> aws lambda invoke \
    --function-name <%= app_name %> \
    --region us-west-2 \
    --log-type Tail \
    --payload '{"msg": "a fake request"}' \
    outputfile.txt
...

> cat outputfile.txt
ok
```

## Dependencies

This requires all of the following dependencies be available:
- [Elixir](https://elixir-lang.org/install.html) >= v1.9
- [Docker](https://docs.docker.com/install/)
- [Terraform](https://www.terraform.io/downloads.html) >= v0.12
