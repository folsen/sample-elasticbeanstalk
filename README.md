# How to set up this project
1. Create your Elastic Beanstalk application through the [web
	 console](https://console.aws.amazon.com/elasticbeanstalk/home). This is
	 necessary to create the default service and instance roles that we need to
	 configure later (`aws-elasticbeanstalk-ec2-role`). It's fine to launch
	 your environment with the sample application to start.
1. Replace `<account-id>`, `<region>`, `<repo>` and `<project>` in all
	 the files with your AWS account id, the region you want to run in,
	 what you want to name your ECR repo and what you named your project.
	 This would perhaps be suitable to put into a cookiecutter template or
	 such, but I felt that was a bit overkill.
1. Run `setup.sh`
1. Add CircleCI integration to your Git repository and under project
	 settings on CircleCI, configure the AWS Permissions to what was
	 generated into the `ci-access-key.json` file.
1. Run a CircleCI build and watch it build, test and deploy your
	 application.
