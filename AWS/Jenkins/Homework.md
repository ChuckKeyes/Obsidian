HW: successfully deploy a jenkins pipeline build using a GitHub repo in your account. Jenkinsfile must have the terraform validate, format, and destroy stages added. Show screenshots of both the successful build and the Jenkinsfile with the additional stages.

Be a Man: modify the startup script to include terraform, AWS, and Python, update the java version used to either Java 21 or 25, and upload a screenshot of all 4 versions (terraform, AWS, Python, Java) after connecting to the server's/container's command line. show evidence via screenshots.

Be a Man 2: create an IAM user with least privilege to deploy infrastructure on the pipeline. Do your best to restrict access, list out the and write out your methodology behind doing so.

Be a Man 3: write out and define what each of the pipeline triggers does in Jenkins. Which trigger(s) would be used when a GitHub repo is updated? What would be good for testing environments? What works better within production?


Mandatory plugins: 
- AWS Credentials
- Pipeline: AWS steps
- Terraform
- Snyk
- Pipeline: GCP steps
- Google Cloud Platform SDK::Auth
- Github integration
- Github Authentication
- Pipeline: Github
