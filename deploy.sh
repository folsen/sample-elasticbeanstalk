# deploy.sh
#! /bin/bash

SHA1=$1

# Push image to ECR
$(aws ecr get-login --region <region>)
docker push <account-id>.dkr.ecr.<region>.amazonaws.com/<repo>:$SHA1

# Create new Elastic Beanstalk version
EB_BUCKET=<project>-deploy-bucket
DOCKERRUN_FILE=$SHA1-Dockerrun.aws.json
sed "s/<TAG>/$SHA1/" < Dockerrun.aws.json.template > $DOCKERRUN_FILE
aws s3 cp $DOCKERRUN_FILE s3://$EB_BUCKET/$DOCKERRUN_FILE --region <region>
aws elasticbeanstalk create-application-version --application-name <project> \
    --version-label $SHA1 --source-bundle S3Bucket=$EB_BUCKET,S3Key=$DOCKERRUN_FILE \
    --region <region>

# Update Elastic Beanstalk environment to new version
aws elasticbeanstalk update-environment --environment-name <project-env> \
    --version-label $SHA1 \
    --region <region>
