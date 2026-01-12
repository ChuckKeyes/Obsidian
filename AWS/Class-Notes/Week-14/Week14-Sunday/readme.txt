bucket-info = {

  "arn" = "arn:aws:s3:::lizzos-brunch-dinner-snack"

  "name" = "lizzos-brunch-dinner-snack"

}

policy-info = "{\"Statement\":[{\"Action\":\"s3:GetObject\",\"Effect\":\"Allow\",\"Principal\":\"*\",\"Resource\":\"arn:aws:s3:::lizzos-brunch-dinner-snack/*\",\"Sid\":\"PublicReadGetObject\"}],\"Version\":\"2012-10-17\"}"

website-url = "http://lizzos-brunch-dinner-snack.s3-website-us-west-1.amazonaws.com"



output "deployment_info" {

  value = join("\n", [

    "Bucket Name: ${aws_s3_bucket.website.id}",

    "Bucket ARN: ${aws_s3_bucket.website.arn}",

    "Website Endpoint: ${aws_s3_bucket_website_configuration.website.website_endpoint}"

  ])

}

https://en.wikipedia.org/wiki/String_interpolation

https://developer.hashicorp.com/terraform/language/expressions/strings

@Theo WAF - http://tiqs-static-site-bucket.s3-website-us-east-1.amazonaws.com/

#######################################################################################

policy = jsonencode({

    Version = "2012-10-17"

    Statement = [

      {

        Sid       = "Potato"

        Effect    = "Allow"

        Principal = "*"

        Action    = "s3:GetObject"

        Resource  = "${aws_s3_bucket.website.arn}/*"

      }

    ]

  })

  #############################################################################################

  