## Fixing Amplify SSM secrets setup failure

Problem: Amplify Console build logs show `Failed to set up process.env.secrets` and a path like `/amplify/<appId>/main/`. This means the Amplify build role couldn't retrieve Parameter Store values at that path (missing params or insufficient IAM permissions).

Quick fixes (pick one):

- Create the missing SSM parameters under the exact path shown in the logs. Example:

```bash
aws ssm put-parameter \
  --name "/amplify/d2f9styaxorwz0/main/MY_SECRET" \
  --value "my-value" \
  --type SecureString \
  --overwrite
```

- Or remove the App secrets configuration in the Amplify Console (App settings → Environment variables / secrets) if you don't need them.

- If parameters exist, ensure the Amplify build role has these permissions (SSM + KMS if SecureString with KMS):

Example minimal IAM policy (see `scripts/iam-policy-amplify-ssm.json`):

```json
{
  "Effect": "Allow",
  "Action": [
    "ssm:GetParametersByPath",
    "ssm:GetParameters",
    "ssm:GetParameter"
  ],
  "Resource": "arn:aws:ssm:REGION:ACCOUNT_ID:parameter/amplify/*"
}
```

How to apply:

1. Find Amplify App ID from Amplify Console (or logs path: `/amplify/<appId>/main/`).
2. Run the `aws ssm put-parameter` commands for each required secret.
3. Attach the IAM policy to the Amplify Console build role (IAM → Roles → search role named like `amplify-<appname>-<env>-<id>-service-role`).

If you want, run the helper script `scripts/create-amplify-ssm-params.sh` locally (requires AWS CLI configured) to create a sample parameter.
