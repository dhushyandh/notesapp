#!/usr/bin/env bash
# Usage: ./scripts/create-amplify-ssm-params.sh <appId> <env> <param-name> <param-value>
# Example: ./scripts/create-amplify-ssm-params.sh d2f9styaxorwz0 main MY_SECRET "supersecret"

set -euo pipefail

APP_ID="$1"
ENV_NAME="$2"
PARAM_NAME="$3"
PARAM_VALUE="$4"

if [ -z "$APP_ID" ] || [ -z "$ENV_NAME" ] || [ -z "$PARAM_NAME" ]; then
  echo "Usage: $0 <appId> <env> <param-name> <param-value>"
  exit 1
fi

FULL_PATH="/amplify/${APP_ID}/${ENV_NAME}/${PARAM_NAME}"

echo "Creating SSM parameter: $FULL_PATH"
aws ssm put-parameter --name "$FULL_PATH" --value "$PARAM_VALUE" --type SecureString --overwrite

echo "Done. Verify in AWS Console → Systems Manager → Parameter Store."
