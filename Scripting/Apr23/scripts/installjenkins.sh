#!/bin/bash
distribution=$(. /etc/os-release && echo $ID)
echo $distribution
# for ubuntu 
if  [[ $distribution == "ubuntu" ]]
then
    apt update 
    apt install openjdk-17-jdk -y
    curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
    /usr/share/keyrings/jenkins-keyring.asc > /dev/null
    echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
    https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
    /etc/apt/sources.list.d/jenkins.list > /dev/null
    apt-get update
    apt-get install jenkins -y
elif [[ $distribution == "rhel" ]]
then
    sudo yum install wget -y
    sudo wget -O /etc/yum.repos.d/jenkins.repo \
        https://pkg.jenkins.io/redhat-stable/jenkins.repo
    sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
    sudo yum upgrade
    # Add required dependencies for the jenkins package
    sudo yum install java-11-openjdk
    sudo yum install jenkins
    sudo systemctl daemon-reload
else
    echo "This script runs only on ubuntu and redhat"
fi