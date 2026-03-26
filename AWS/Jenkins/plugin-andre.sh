# Install requested AWS Plugins
# --------------------------------------
# This installs the plugins and all required dependencies automatically
java -jar jenkins-plugin-manager.jar --war /usr/share/java/jenkins.war --plugin-download-directory /var/lib/jenkins/plugins --plugins \
aws-credentials \
pipeline-aws \
ec2 \
amazon-ecs \
aws-codedeploy \
aws-lambda \
aws-codebuild \
s3 \
aws-secrets-manager-credentials-provider \
aws-codepipeline \
configuration-as-code-secret-ssm \
aws-cloudformation \
aws-sam \
terraform \
kubernetes \
google-storage-plugin \
google-kubernetes-engine \
google-auth-library--java-auth-plugin \
google-cloud-backup--restore \
snyk-security-scanner \
sonar \
aqua-securityscanner \
github-pullrequest \
github-oauth \
pipeline-github-notify-step \
maven-plugin \
pipeline-maven \
publish-over-ssh

# --------------------------------------
# Set correct permissions and Restart
# --------------------------------------
sudo chown -R jenkins:jenkins /var/lib/jenkins/plugins
sudo systemctl restart jenkins

# --------------------------------------
# Enable and Start jenkins
# --------------------------------------
sudo systemctl enable jenkins
sudo systemctl start Jenkins
sudo systemctl status jenkins --no-pager