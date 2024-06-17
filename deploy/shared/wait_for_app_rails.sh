#!/bin/bash

. ./deploy/shared/output_helper.sh
echo "------------------------------------------------------------------------------------\n"

max_attempts=60
attempts=0

echo "------------------------------------------------------------------------------------"

while true; do
  http_status=$(curl -s -o /dev/null -w "%{http_code}" -k https://0.0.0.0/test)

  if [ "$http_status" = "200" ]; then
    showSuccess "Rails application is up and running on port 3000."
    break
  else
    attempts=$((attempts + 1))
    if [ $attempts -eq $max_attempts ]; then
      showError "Timeout: The Rails application did not start on port 3000. \nPlease run 'docker ps -a' and 'docker logs <container_id>' to obtain more detailed information."
      exit 1
    fi
    echo "Waiting for Rails application to start (Attempt $attempts)..."
    sleep 5
  fi
done

echo "------------------------------------------------------------------------------------\n"
