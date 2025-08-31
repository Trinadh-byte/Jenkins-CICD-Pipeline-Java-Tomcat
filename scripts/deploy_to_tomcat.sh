#!/bin/bash
TOMCAT_URL=$1
WAR_FILE=$2

if [ -z "$TOMCAT_URL" ] || [ -z "$WAR_FILE" ]; then
  echo "Usage: $0 <tomcat_url> <war_file>"
  exit 1
fi

echo "Deploying $WAR_FILE to $TOMCAT_URL ..."
curl -u $TOMCAT_CREDENTIALS \
     --upload-file $WAR_FILE \
     "$TOMCAT_URL/deploy?path=/myapp&update=true"

echo "Deployment completed."

