
# Terraform Backend Configuration

TF State Locka nd TF State Storage


1.	Create 2 Projects , Project-1 and Project-2
2.	Create the tf files required in both the projects including the providers block
3.	Create the S3 Bucket in UI or use terragrunt wrapper on top of Terraform
4.	Open 2 Terminals and run the below command.
5.	Run the Below Command for both the terraform init

## TF Init

#### Terraform Initalization for inital time using parameters

```http
 terraform init -backend-config="access_key=<YOUR_ACCESS_KEY>" -backend-config="secret_key=<YOUR_SECRET_ACCESS_KEY>"
 
 
 ## Authors

- [@sudharsansadasivam](https://www.github.com/sudharsansadasivam)
```

