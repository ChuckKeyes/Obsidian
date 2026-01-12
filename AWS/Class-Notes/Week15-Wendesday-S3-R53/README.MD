week15-modular-static-site/
├─ providers.tf
├─ variables.tf
├─ main.tf
├─ outputs.tf
└─ modules/
   ├─ s3_site/
   │  ├─ main.tf
   │  ├─ variables.tf
   │  └─ outputs.tf
   ├─ cloudfront/
   │  ├─ main.tf
   │  ├─ variables.tf
   │  └─ outputs.tf
   ├─ route53/
   │  ├─ main.tf
   │  ├─ variables.tf
   │  └─ outputs.tf
   └─ monitoring/
      ├─ main.tf
      ├─ variables.tf
      └─ outputs.tf


4) How to confirm caching is working

Run twice:

curl -I https://dds3z2zv8zp52.cloudfront.net/videos/waterfall.mp4


Look for:

First time: X-Cache: Miss from cloudfront

Second time: X-Cache: Hit from cloudfront

#################################################################################

1) CloudFront isn’t deployed yet (or you’re hitting an old distribution)

CloudFront updates can take 10–30 minutes to fully deploy globally. During that time you can see weird behavior: sometimes it works, sometimes it doesn’t.

✅ Test:

S3 website URL should stay stable:

http://kcs-yoga-site-001-chuck.s3-website-us-east-1.amazonaws.com

CloudFront URL may take time:

https://xxxxx.cloudfront.net

2) You’re running terraform destroy or re-applying in a new folder

If you apply in one folder, then later run another project that creates/destroys with the same bucket name or replaces resources, it can look like it “only lasted 10 minutes.”

✅ Check:

terraform state list


If it’s empty or different than before, you’re in a different Terraform “world.”

3) DNS caching / propagation

Route 53 changes + resolver caching can make it look like things “come and go.”

✅ Test direct S3 endpoint (bypasses DNS):

curl -I http://kcs-yoga-site-001-chuck.s3-website-us-east-1.amazonaws.com

4) Account-level S3 “Block Public Access” policy enforcement

If something (you, org policy, or security defaults) re-enables Block Public Policy, your bucket can become inaccessible even though it still exists.

✅ Check in console:
S3 → bucket → Permissions

Block public access

Bucket policy status

The fastest way to prove it’s NOT expiring

Run these two commands when it “stops working”:

aws s3api head-bucket --bucket kcs-yoga-site-001-chuck


If it returns success → bucket still exists.

If it returns NotFound → bucket was deleted (by Terraform destroy or manual delete).

If it returns Forbidden → bucket exists but access is blocked.

And:

curl -I http://kcs-yoga-site-001-chuck.s3-website-us-east-1.amazonaws.com


That tells us if the website endpoint is reachable.

Most likely in your case

Because you were building CloudFront + Route 53 + modules, what you’re feeling as “10 minutes” is usually:

CloudFront deployment time, or

DNS caching, or

a terraform destroy/replace happening from a different folder/state.

If you paste the output of these (just run them once when it “dies”):

aws s3api head-bucket --bucket kcs-yoga-site-001-chuck
curl -I http://kcs-yoga-site-001-chuck.s3-website-us-east-1.amazonaws.com

########################################################################################

1) Best habit: use destroy -target (delete only what you mean)

Example: destroy only CloudFront (keep the bucket/site):

terraform destroy -target=module.cloudfront


Destroy only the DNS records:

terraform destroy -target=module.route53


⚠️ Still be careful: targeted destroys can leave “drift,” but for labs they’re useful.

2) Protect important resources (recommended)

Add this inside your S3 bucket resource to prevent accidental destroys:

resource "aws_s3_bucket" "site" {
  bucket = var.bucket_name

  lifecycle {
    prevent_destroy = true
  }
}


Then if you run terraform destroy, Terraform will stop and refuse to delete the bucket.

You can also add it to CloudFront if you want.

3) Keep “long-lived” things in a separate Terraform project

Real-world pattern:

Project A (persistent): Route 53 zone + certs + base bucket (rarely destroyed)

Project B (deployments): CloudFront + records for test subdomains (can be destroyed)

That way a class “cleanup” doesn’t wipe your whole DNS setup.

#####################################################################################

Heredoc strings / “unterminated template string” (your <<-HTML … HTML blocks): Terraform “Strings and Templates” (heredoc syntax + rules). 
HashiCorp Developer

Modules (root module + child modules) and how to wire variables/outputs: Terraform “Use modules in your configuration” + “Module Composition”. 
HashiCorp Developer
+1

Outputs (how child modules pass values back to root): Terraform “Output Values”. 
HashiCorp Developer

Importing existing resources (so Terraform doesn’t try to recreate your bucket/records): Terraform “Import existing resources” + command reference. 
HashiCorp Developer
+1

CloudFront + custom domain (CNAME/alternate domain) + HTTPS requirements: AWS CloudFront docs explain that you need an SSL/TLS cert for alternate domain names. 
AWS Documentation
+2
AWS Documentation
+2

Why ACM must be in us-east-1 for CloudFront: AWS CloudFront HTTPS requirements spell this out explicitly. 
AWS Documentation
+1

If you want a “single reading path” for your exact build, read in this order:

Terraform Strings/Heredoc 
HashiCorp Developer

Terraform Modules + Outputs 
HashiCorp Developer
+1

Terraform Import 
HashiCorp Developer
+1

CloudFront Alternate Domains + ACM region requirement 
AWS Documentation
+1

And whenever something is AWS-specific (Route 53 alias records, CloudFrond

site_dns_name = waterfall.keyescloudsolutions.com
Your friendly DNS name (Route 53 record exists).

cloudfront_domain_name = d3cu88lir0529b.cloudfront.net
CloudFront distribution is created and gives you the global edge endpoint.

cloudfront_status = Deployed
CloudFront finished deploying (not “InProgress”). This is your proof it’s live.

s3_website_url = kcs-yoga-site-001-chuck.s3-website-us-east-1.amazonaws.com
S3 static website origin is up and reachable (origin is in us-east-1).

monitoring_dashboard_name = kcs-waterfall-keyescloudsolutions-com-dashboard
Monitoring module succeeded — CloudWatch dashboard exists.

chuck@LAPTOP-1B94MM1R:/d/New Obsidian/New Obsidian/AWS/Class-Notes/Week15-Wendesday-S3-R53$ curl -I https://waterfall.keyescloudsolutions.com | egrep -i "x-amz-cf-pop|x-cache|via|server"
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed  
  0  2200    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
Server: AmazonS3
X-Cache: Miss from cloudfront
Via: 1.1 e763a229a66d7c303966816658a2f986.cloudfront.net (CloudFront)
X-Amz-Cf-Pop: MIA3-P8
chuck@LAPTOP-1B94MM1R:/d/New Obsidian/New Obsidian/AWS/Class-Notes/Week15-Wendesday-S3-R53$ aws cloudwatch list-dashboards --region us-east-1 --query "DashboardEntries[?contains(DashboardName,'kcs-waterfall')].DashboardName" --output text
kcs-waterfall-keyescloudsolutions-com-dashboard

https://github.com/Prof-Cloud/Static-Website-with-AWS-S3-Route-53-and-CloudFront

https://www.amazon.com/gp/product/173643974X?smid=A2KAV6VHYNSZ1O&psc=1
