# MuleSoft SMB Server and Salesforce Integration Flow
### Overview
This flow shows how to set up a MuleSoft flow that integrates with an SMB server, automates folder and file creation, and interacts with Salesforce. The flow allows the creation of base template folders based on job IDs in Salesforce, automating script execution, and offers a path to migrate from SMB to cloud services.

### Flow Components
Salesforce Integration: Triggers a workflow when a Job ID is added to an Opportunity object in Salesforce.
Java Connector: Executes shell commands remotely via SSH to create folders and templates.
SMB Protocol: Uses SMB to interact with a local drive and trigger scripts for folder creation.
Cloud Migration: Enables moving from a local SMB server to a cloud storage service.

### Connectors Used
- Salesforce Connector
- SMB Connector (for local drive access)
- Java Connector (for SSH commands)
- Powershell Connector
