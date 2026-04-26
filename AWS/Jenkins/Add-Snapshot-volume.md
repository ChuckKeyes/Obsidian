
[ec2-user@ip-172-31-41-171 ~]$ lsblk
NAME          MAJ:MIN RM SIZE RO TYPE MOUNTPOINTS
nvme0n1       259:0    0  20G  0 disk 
├─nvme0n1p1   259:1    0  20G  0 part /
├─nvme0n1p127 259:2    0   1M  0 part 
└─nvme0n1p128 259:3    0  10M  0 part /boot/efi
nvme1n1       259:4    0  20G  0 disk 
├─nvme1n1p1   259:5    0  20G  0 part 
├─nvme1n1p127 259:6    0   1M  0 part 
└─nvme1n1p128 259:7    0  10M  0 part





# Mount the snapshot volume

sudo mkdir /jenkins-old
sudo mount /dev/nvme1n1p1 /jenkins-old

# Verify data is there

ls -la /jenkins-old

total 32
dr-xr-xr-x. 18 root root   237 Mar 27 21:54 .
dr-xr-xr-x. 19 root root   256 Apr  7 13:14 ..
lrwxrwxrwx.  1 root root     7 Jan 30  2023 bin -> usr/bin
dr-xr-xr-x.  5 root root 16384 Mar 27 21:57 boot
drwxr-xr-x.  3 root root   136 Mar 27 21:58 dev
drwxr-xr-x. 82 root root 16384 Apr  5 15:35 etc
drwxr-xr-x.  3 root root    22 Apr  5 15:34 home
lrwxrwxrwx.  1 root root     7 Jan 30  2023 lib -> usr/lib
lrwxrwxrwx.  1 root root     9 Jan 30  2023 lib64 -> usr/lib64
drwxr-xr-x.  2 root root     6 Mar 27 21:52 local
drwxr-xr-x.  2 root root     6 Jan 30  2023 media
drwxr-xr-x.  2 root root     6 Jan 30  2023 mnt
drwxr-xr-x.  3 root root    17 Mar 27 21:56 opt
drwxr-xr-x.  2 root root     6 Mar 27 21:52 proc
dr-xr-x---.  3 root root   121 Apr  5 15:34 root
drwxr-xr-x.  2 root root     6 Mar 27 21:58 run
lrwxrwxrwx.  1 root root     8 Jan 30  2023 sbin -> usr/sbin
drwxr-xr-x.  2 root root     6 Jan 30  2023 srv
drwxr-xr-x.  2 root root     6 Mar 27 21:52 sys
drwxrwxrwt.  2 root root     6 Mar 27 21:52 tmp
drwxr-xr-x. 12 root root   144 Mar 27 21:54 usr
drwxr-xr-x. 19 root root   266 Apr  5 15:34 var

################################################################

[ec2-user@ip-172-31-41-171 ~]$ ls -la /jenkins-old/var/lib/jenkins
total 224
drwxr-xr-x.  16 jenkins jenkins 16384 Apr  6 17:42 .
drwxr-xr-x.  27 root    root    16384 Apr  5 15:35 ..
drwxr-xr-x.   3 jenkins jenkins    17 Apr  5 15:35 .cache
drwxr-xr-x.   3 jenkins jenkins    18 Apr  6 17:24 .config
drwxr-xr-x.   3 jenkins jenkins    20 Apr  5 16:05 .groovy
drwxr-xr-x.   3 jenkins jenkins    19 Apr  5 15:35 .java
-rw-r--r--.   1 jenkins jenkins     0 Apr  5 17:55 .lastStarted
-rw-r--r--.   1 jenkins jenkins     4 Apr  6 20:01 .owner
drwxr-xr-x.   5 jenkins jenkins   118 Apr  6 17:42 caches
-rw-r--r--.   1 jenkins jenkins  1829 Apr  6 01:07 config.xml
-rw-r--r--.   1 jenkins jenkins  2942 Apr  6 16:08 credentials.xml
drwxr-xr-x.   5 jenkins jenkins    36 Apr  6 17:42 fingerprints
-rw-r--r--.   1 jenkins jenkins   156 Apr  5 17:55 hudson.model.UpdateCenter.xml
-rw-r--r--.   1 jenkins jenkins   218 Apr  5 17:29 hudson.plugins.copyartifact.CopyArtifactConfiguration.xml
-rw-r--r--.   1 jenkins jenkins   370 Apr  6 01:07 hudson.plugins.git.GitTool.xml
-rw-r--r--.   1 jenkins jenkins   192 Apr  6 01:07 hudson.plugins.gradle.Gradle.xml
-rw-r--r--.   1 jenkins jenkins   277 Apr  6 01:07 hudson.plugins.sonar.MsBuildSQRunnerInstallation.xml
-rw-r--r--.   1 jenkins jenkins   313 Apr  5 17:37 hudson.plugins.sonar.SonarGlobalConfiguration.xml
-rw-r--r--.   1 jenkins jenkins   206 Apr  6 01:07 hudson.plugins.sonar.SonarRunnerInstallation.xml
-rw-r--r--.   1 jenkins jenkins   161 Apr  6 01:07 hudson.tasks.Ant.xml
-rw-r--r--.   1 jenkins jenkins   132 Apr  6 01:07 hudson.tasks.Maven.xml
-rw-------.   1 jenkins jenkins  1680 Apr  5 16:05 identity.key.enc
-rw-r--r--.   1 jenkins jenkins  1372 Apr  6 01:07 io.snyk.jenkins.SnykStepBuilder.xml
-rw-r--r--.   1 jenkins jenkins     7 Apr  5 17:55 jenkins.install.InstallUtil.lastExecVersion
-rw-r--r--.   1 jenkins jenkins     7 Apr  5 16:09 jenkins.install.UpgradeWizard.state
-rw-r--r--.   1 jenkins jenkins   197 Apr  5 16:09 jenkins.model.JenkinsLocationConfiguration.xml
-rw-r--r--.   1 jenkins jenkins   247 Apr  6 01:07 jenkins.mvn.GlobalMavenConfig.xml
-rw-r--r--.   1 jenkins jenkins   171 Apr  5 15:35 jenkins.telemetry.Correlator.xml
drwxr-xr-x.   3 jenkins jenkins    27 Apr  6 17:13 jobs
drwxr-xr-x.   3 jenkins jenkins    45 Apr  6 12:42 logs
-rw-r--r--.   1 jenkins jenkins  1037 Apr  5 17:55 nodeMonitors.xml
-rw-r--r--.   1 jenkins jenkins   255 Apr  6 01:07 org.jenkinsci.plugins.gitclient.JGitApacheTool.xml
-rw-r--r--.   1 jenkins jenkins   243 Apr  6 01:07 org.jenkinsci.plugins.gitclient.JGitTool.xml
-rw-r--r--.   1 jenkins jenkins   876 Apr  6 01:07 org.jenkinsci.plugins.pipeline.maven.GlobalPipelineMavenConfig.xml
-rw-r--r--.   1 jenkins jenkins   228 Apr  6 01:07 org.jenkinsci.plugins.terraform.TerraformBuildWrapper.xml
-rw-r--r--.   1 jenkins jenkins    46 Apr  6 17:42 org.jenkinsci.plugins.workflow.flow.FlowExecutionList.xml
drwxr-xr-x. 191 jenkins jenkins 32768 Apr  5 17:37 plugins
-rw-r--r--.   1 jenkins jenkins   258 Apr  6 17:42 queue.xml
-rw-r--r--.   1 jenkins jenkins   258 Apr  5 17:54 queue.xml.bak
-rw-r--r--.   1 jenkins jenkins    64 Apr  5 15:35 secret.key
-rw-r--r--.   1 jenkins jenkins     0 Apr  5 15:35 secret.key.not-so-secret
drwx------.   2 jenkins jenkins 16384 Apr  6 17:24 secrets
drwxr-xr-x.   2 jenkins jenkins 16384 Apr  6 17:55 updates
drwxr-xr-x.   2 jenkins jenkins    24 Apr  5 15:35 userContent
drwxr-xr-x.   3 jenkins jenkins    84 Apr  5 16:09 users
drwxr-xr-x.   4 jenkins jenkins    52 Apr  6 17:42 workspace

# Stop Jenkins

sudo systemctl stop jenkins

# Replace current Jenkins data

sudo rm -rf /var/lib/jenkins/*
sudo cp -r /jenkins-old/var/lib/jenkins/* /var/lib/jenkins/

# Fix permissions

sudo chown -R jenkins:jenkins /var/lib/jenkins

# Start Jenkins

sudo systemctl start jenkins

# Test in browser

http://<your-ip>:8080