
# 📁 Automated File Backup and Archival System (AWS-Based)

This project automatically backs up files from a directory on an EC2 instance to AWS S3, logs metadata into DynamoDB, and sends a confirmation message to an SQS queue.

---

## 🚀 Project Overview

This system ensures important files on your EC2 instance are automatically:

- ✅ Uploaded to Amazon S3  
- ✅ Logged in DynamoDB with metadata (file name, size, timestamp)  
- ✅ Confirmed via SQS messages for tracking/logging  

---

## 📦 AWS Services Used

| Service   | Purpose                                  |
|-----------|------------------------------------------|
| EC2       | Hosts and runs the backup automation     |
| S3        | Stores the uploaded backup files         |
| DynamoDB  | Stores file metadata like size and name  |
| SQS       | Logs upload confirmations as messages    |

---

## 📁 Folder Structure

- `backup_and_log.sh` – The main automation script for uploading files to S3, logging metadata in DynamoDB, and sending messages to SQS  
- `README.md` – Project documentation with setup, explanation, and usage instructions  

---

## ✅ Prerequisites

- AWS account  
- A Linux-based EC2 instance (Ubuntu preferred)  
- AWS CLI installed and configured on EC2  
- An existing:  
  - S3 bucket (e.g., `my-backup-bucket`)  
  - DynamoDB table (e.g., `BackupMetadata`)  
  - SQS queue (e.g., `UploadLogs`)  
- IAM Role attached to EC2 with access to S3, DynamoDB, and SQS  

---

## 👤 Author

**Manan Garg**
