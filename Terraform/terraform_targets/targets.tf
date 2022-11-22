resource "random_test" "bucket_name" {
-  length    = 3
+  length    = 5
   separator = "-"
   prefix    = "learning"
 }


#terraform plan -target="random_pet.bucket_name"
