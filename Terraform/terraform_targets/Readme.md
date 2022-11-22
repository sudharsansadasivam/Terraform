# Foobar

Foobar is a Python library for dealing with word pluralization.

## Tip: 

To change the bucket's name, Terraform must replace the bucket. AWS does not support renaming buckets in place. The AWS provider understands this, and Terraform creates a plan that will replace or update your resources as needed.

Note: Terraform creates a dependency graph to determine the correct order in which to apply changes.

```bash
 terraform plan -target="random_test.bucket_name"
 terraform plan -target="module.s3_bucket"
```

## Contributing

Pull requests are welcome. For major changes, please open an issue first
to discuss what you would like to change.

Please make sure to update tests as appropriate.

