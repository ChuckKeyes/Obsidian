
cd /tmp
curl -LO https://github.com/jenkinsci/plugin-installation-manager-tool/releases/latest/download/jenkins-plugin-manager-2.13.2.jar
ls -l /tmp/jenkins-plugin-manager-2.13.2.jar



####################################################

sudo java -jar jenkins-plugin-manager.jar \
--war /usr/share/java/jenkins.war \
--plugin-download-directory /var/lib/jenkins/plugins \
--plugins \
workflow-aggregator \
pipeline-stage-view \
blueocean \
git \
github \
credentials \
credentials-binding \
ssh-credentials \
plain-credentials \
scm-api \
aws-credentials \
pipeline-aws \
ec2 \
amazon-ecs \
aws-codedeploy \
aws-lambda \
aws-codebuild \
aws-codepipeline \
aws-secrets-manager-credentials-provider \
configuration-as-code-secret-ssm \
aws-cloudformation \
aws-sam \
s3 \
aws-java-sdk \
aws-java-sdk-s3 \
aws-java-sdk-ec2 \
terraform \
google-storage-plugin \
google-kubernetes-engine \
google-oauth-plugin \
google-auth-library-credentials \
kubernetes \
kubernetes-cli \
snyk-security-scanner \
dependency-check-jenkins-plugin \
aqua-securityscanner \
sonar \
github-branch-source \
pipeline-github-lib \
pipeline-githubnotify-step \
maven-plugin \
pipeline-maven \
publish-over-ssh
