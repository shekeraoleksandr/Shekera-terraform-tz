#!/bin/bash

USER_NAME="shekera-tz"

aws iam create-user --user-name ${USER_NAME}

if [ $? -eq 0 ]; then
    echo "IAM user created successfully"
else
    echo "Failed to create IAM user"
    exit 1
fi

aws iam attach-user-policy --user-name ${USER_NAME} --policy-arn arn:aws:iam::aws:policy/AdministratorAccess

if [ $? -eq 0 ]; then
    echo "Policy attached successfully"
else
    echo "Failed to attach policy"
    exit 1
fi

aws iam create-access-key --user-name ${USER_NAME}

if [ $? -eq 0 ]; then
    echo "Key created successfully"
else
    echo "Failed to create a key"
    exit 1
fi