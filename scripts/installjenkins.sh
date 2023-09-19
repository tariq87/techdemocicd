#!/bin/bash

sudo yum update -y

sudo yum install -y java-1.8.0-openjdk-devel

sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key

sudo yum install -y jenkins

sudo service jenkins start
sudo chkconfig jenkins on

echo "Initial Jenkins Unlock Key:"
sudo cat /var/lib/jenkins/secrets/initialAdminPassword

