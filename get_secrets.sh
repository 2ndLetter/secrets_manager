#!/bin/bash

RAW=$(aws secretsmanager get-secret-value --secret-id ProdAppPassword)

USERNAME=$(aws secretsmanager get-secret-value --secret-id ProdAppPassword | jq --raw-output .SecretString | jq -r ."username")

PASSWORD=$(aws secretsmanager get-secret-value --secret-id ProdAppPassword | jq --raw-output .SecretString | jq -r ."password")

echo "this is the \$USERNAME variable = $USERNAME"

echo "this is the \$PASSWORD variable = $PASSWORD"

echo -e "this is what the raw output looks like:\n $RAW"

#this is what the raw output looks like:
# {
#    "ARN": "arn:aws:secretsmanager:us-east-1:599702904325:secret:ProdAppPassword-4fC1vQ",
#    "Name": "ProdAppPassword",
#    "VersionId": "9190d130-1ac0-48a4-8185-05f46cbeefc6",
#    "SecretString": "{\"username\":\"cloud_user\",\"password\":\"+thiS-is-My_secret-pw\"}",
#    "VersionStages": [
#        "AWSCURRENT"
#    ],
#    "CreatedDate": "2021-10-05T19:38:07.014000-04:00"
#}
#
# See Secrets_Manager.PNG for AWS Console Screenshot