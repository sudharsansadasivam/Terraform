
resource "aws_iam_role" "glue_role" {
  name = var.glue_role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "glue.amazonaws.com"
        }
      },
    ]
  })
}

### ATTACH AWS MANAGED GLUESERVICEROLE ###
resource "aws_iam_role_policy_attachment" "glue_service" {
    role = "${aws_iam_role.glue_role.id}"
    policy_arn = "arn:aws:iam::aws:policy/service-role/AWSGlueServiceRole"
}

### S3 BUCKET POLICY ###
resource "aws_iam_role_policy" "sourcedata_bucket" {
  name = "SourceS3_put_get_list_delete"
  role = "${aws_iam_role.glue_role.id}"
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "s3:PutObject",
        "s3:GetObject",
        "s3:ListBucket",
        "s3:DeleteObject"
      ],
      "Resource": [
        "arn:aws:s3:::${var.projectname}-${var.source_bucketname}",
        "arn:aws:s3:::${var.projectname}-${var.source_bucketname}/*",
        "arn:aws:s3:::${var.projectname}-${var.glue_scripts_bucketname}",
        "arn:aws:s3:::${var.projectname}-${var.glue_scripts_bucketname}/*"
      ]
    }
  ]
}
EOF
}