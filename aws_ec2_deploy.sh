#!/bin/bash

# Configuración AWS (ajusta estos valores)
AWS_REGION="us-east-1"
INSTANCE_TYPE="t2.micro"
KEY_NAME="tu-keypair"
SECURITY_GROUP_ID="sg-xxxxxxxx"

# Crear instancia EC2 con user-data
aws ec2 run-instances \
  --region $AWS_REGION \
  --image-id ami-08c40ec9ead489470 \ # Ubuntu 20.04 LTS
  --instance-type $INSTANCE_TYPE \
  --key-name $KEY_NAME \
  --security-group-ids $SECURITY_GROUP_ID \
  --user-data file://scripts/ec2_user_data.sh \
  --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=UNIR-Tenis}]' \
  --count 1