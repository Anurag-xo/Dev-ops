ap-south-1bin/bash 

########################
# Author: Anurag-xo
#  Date: 12/01/2025
#
#  Version: v1
#
#  This script will report the AWS resource usage
########################

set -x
# AWS S#
# AWS EC2
# AWS Lambda
# AWS IAM Users

# List s3 buckets
echo "Print List of S3 buckets"
aws s3 ls

# List EC2 instances
echo "Print List of EC2 instances"
aws ec2 describe-instances

# List Lambda
echo "Print List of lambda Funtions"
aws lambda list-functions

# List IAM users
echo "Print List of IAM Users"
aws iam list-users

