#!/bin/bash

SOURCE_DIR="/home/ubuntu/backup-folder"
S3_BUCKET="my-cloud-backup-bucket"
DYNAMODB_TABLE="FileBackupMetadata"
SQS_QUEUE_URL="https://sqs.ap-south-1.amazonaws.com/174936584790/UploadLogs"

for file in "$SOURCE_DIR"/*; do
    if [ -f "$file" ]; then
        filename=$(basename "$file")
        filesize=$(stat -c%s "$file")
        timestamp=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

        # Upload to S3
        aws s3 cp "$file" "s3://$S3_BUCKET/$filename"

        # Insert metadata into DynamoDB
        aws dynamodb put-item \
            --table-name "$DYNAMODB_TABLE" \
            --item "{
                \"filename\": {\"S\": \"$filename\"},
                \"size\": {\"N\": \"$filesize\"},
                \"timestamp\": {\"S\": \"$timestamp\"}
            }"

        # Send message to SQS
        aws sqs send-message \
            --queue-url "$SQS_QUEUE_URL" \
            --message-body "Uploaded $filename of size $filesize bytes at $timestamp"
    fi
done
