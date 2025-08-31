# Jenkins-CICD-Pipeline-Java-Tomcat

🚀 Automated CI/CD Pipeline with Jenkins, Maven, SonarQube, Nexus, and Tomcat

This project demonstrates a complete end-to-end CI/CD pipeline built using Jenkins, Maven, SonarQube, Nexus, and Tomcat.
It automates the process of building, testing, analyzing, storing, and deploying a Java web application across multiple environments (Dev → Test → Prod) with rollback support and role-based access control.

🔑 Key Features

✅ Source Code Management – GitHub integrated with Jenkins
✅ Automated Build – Maven compiles and packages WAR files
✅ Code Quality Gate – SonarQube scans for bugs, vulnerabilities & code smells
✅ Artifact Repository – Nexus stores versioned artifacts with rollback ability
✅ Multi-Stage Deployment – Jenkins pipeline deploys sequentially (Dev → Test → Prod)
✅ Rollback Support – Redeploy older artifacts from Nexus on failure
✅ Role-Based Access – Separate Dev, Test, Prod users with restricted permissions
✅ Master-Slave Setup – Jenkins distributed builds using nodes/agents

🏗️ Architecture Diagram

**Pipeline Flow:

GitHub → Jenkins → Maven → SonarQube → Nexus → Tomcat (Dev → Test → Prod)


**📋 Workflow

Checkout Code – Jenkins pulls source code from GitHub

Build Stage – Maven builds the project and creates a WAR file

SonarQube Scan – Analyzes code quality and applies quality gates

Upload Artifact to Nexus – WAR file stored in Nexus repository

Deploy to Dev – Jenkins deploys to Tomcat (Dev environment)

Manual Approval – Promotes build to Test → Prod environments

Rollback Support – Previous artifacts can be redeployed from Nexus if deployment fails

📄 [Detailed Project Report (PDF)](docs/1) JENKINS CI CD PROJECT.pdf)



