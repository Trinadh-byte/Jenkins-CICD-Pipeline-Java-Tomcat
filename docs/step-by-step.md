# Step-by-Step Setup Guide

## 1. Install & Configure Jenkins
- Install Jenkins on EC2.
- Install required plugins:  SonarQube Scanner, Nexus Artifact Uploader, Deploy to Container.

## 2. Configure SonarQube
- Install SonarQube server on EC2.
- Add Jenkins → SonarQube integration.

## 3. Configure Nexus
- Create a maven2 hosted repository for releases.
- Add credentials in Jenkins.

## 4. Setup Tomcat
- Deploy Tomcat on Dev/Test/Prod EC2 servers.
- Enable manager access.

## 5. Create Jenkins Pipeline
- Add Jenkinsfile.

- Please refer the 1) Jenkins CI CD Project.pdf file for full step by step execution steps with screenshots
- Run pipeline and verify.

