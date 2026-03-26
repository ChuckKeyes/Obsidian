

AWS CLI → controls AWS  
gcloud → controls GCP  
jenkins-cli → controls Jenkins

Instead of clicking around the UI, you can **control Jenkins from the terminal**.

---

# What `jenkins-cli.jar` actually is

- A **Java program** provided by Jenkins
    
- Connects to your Jenkins server (HTTP/HTTPS)
    
- Lets you run commands remotely
    

It lives here:

http://YOUR_JENKINS_URL/jnlpJars/jenkins-cli.jar

Example for you:

wget http://18.237.1.144:8080/jnlpJars/jenkins-cli.jar

---

# Basic command structure

java -jar jenkins-cli.jar -s http://SERVER:PORT COMMAND

Example:

java -jar jenkins-cli.jar -s http://localhost:8080 list-plugins

---

# Common commands you will use

## 1. List plugins

java -jar jenkins-cli.jar -s http://localhost:8080 list-plugins

---

## 2. Install plugins (🔥 very important for your lab)

java -jar jenkins-cli.jar -s http://localhost:8080 install-plugin terraform

Multiple plugins:

java -jar jenkins-cli.jar -s http://localhost:8080 install-plugin aws-credentials pipeline-aws github

---

## 3. Restart Jenkins

java -jar jenkins-cli.jar -s http://localhost:8080 safe-restart

---

## 4. Create a job from file

java -jar jenkins-cli.jar -s http://localhost:8080 create-job my-job < job.xml

---

## 5. Trigger a job

java -jar jenkins-cli.jar -s http://localhost:8080 build my-job

---

# Authentication (important)

Most commands require login.

Use:

java -jar jenkins-cli.jar -s http://localhost:8080 -auth USER:API_TOKEN list-plugins

Example:

java -jar jenkins-cli.jar -s http://localhost:8080 -auth chuck:YOUR_API_TOKEN list-plugins

👉 Get API token from:

Jenkins → User → Security → API Token

---

# Why this matters (real world)

This is how DevOps engineers:

- Automate Jenkins setup
    
- Install plugins in scripts
    
- Build CI/CD pipelines without UI
    
- Rebuild Jenkins servers quickly
    

---

# For YOUR Terraform lab

You can turn your Jenkins VM into a **fully automated DevOps server** like this:

# install plugins automatically  
java -jar jenkins-cli.jar -s http://localhost:8080 install-plugin \  
aws-credentials pipeline-aws terraform github pipeline-github  
  
# restart Jenkins  
java -jar jenkins-cli.jar -s http://localhost:8080 safe-restart

---

# Simple mental model

Terraform → builds Jenkins VM  
Jenkins CLI → configures Jenkins  
Pipelines → deploy infrastructure