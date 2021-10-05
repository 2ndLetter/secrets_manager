#!/bin/bash

RAW=$(aws secretsmanager get-secret-value --secret-id ProdAppPassword)

USERNAME=$(aws secretsmanager get-secret-value --secret-id ProdAppPassword | jq --raw-output .SecretString | jq -r ."username")

PASSWORD=$(aws secretsmanager get-secret-value --secret-id ProdAppPassword | jq --raw-output .SecretString | jq -r ."password")

echo "this is the \$USERNAME variable = $USERNAME"

echo "this is the \$PASSWORD variable = $PASSWORD"

echo -e "this is what the raw output looks like:\n $RAW"