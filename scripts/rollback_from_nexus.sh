#!/bin/bash
NEXUS_URL="http://<nexus-server>:8081/repository/maven-releases/com/example/myapp"
VERSION=$1
TOMCAT_URL=$2

if [ -z "$VERSION" ] || [ -z "$TOMCAT_URL" ]; then
  echo "Usage: $0 <artifact_version> <tomcat_url>"
  exit 1
fi

ARTIFACT="myapp-${VERSION}.war"

echo "Fetching $ARTIFACT from Nexus..."
wget "$NEXUS_URL/$VERSION/$ARTIFACT" -O /tmp/$ARTIFACT

echo "Rolling back to version $VERSION ..."
curl -u $TOMCAT_CREDENTIALS \
     --upload-file /tmp/$ARTIFACT \
     "$TOMCAT_URL/deploy?path=/myapp&update=true"

echo "Rollback completed."

