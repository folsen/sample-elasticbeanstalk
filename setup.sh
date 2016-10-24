aws ecr create-repository <repo> --region <region>
aws s3 mb <project>-deploy-bucket --region <region>
aws elasticbeanstalk create-application --application-name <project> --region <region>
aws elasticbeanstalk create-environment --application-name <project> \
	--environment-name <project-env> \
	--solution-stack-name 64bit Amazon Linux 2016.03 v2.1.6 running Docker 1.11.2 \
	--region <region>

