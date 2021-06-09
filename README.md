node-docker is a simple dockerized nodejs app


This is a based on the following articles:
https://sommershurbaji.medium.com/deploying-a-docker-container-to-aws-with-elastic-beanstalk-28adfd6e7e95

https://sommershurbaji.medium.com/continuous-delivery-with-aws-elastic-beanstalk-and-travis-ci-2dd54754965f

https://medium.com/swlh/continous-integration-using-travis-nodejs-8c608662a0cd

https://docs.travis-ci.com/user/docker/

https://docs.docker.com/language/nodejs/


with the following added CI Flow:

When a version is pushed to GitHub -> Travis-CI runs:
- Test
- Package as a Docker container and push to DockerHub,
- AWS pulls package from DockerHub and deploys to a Elastic Beanstalk environment.

Below are the instructions for running the whole process:

1. Create an AWS user with programmatic access to Elastic beanstalk using the procedure in this article: https://medium.com/@andrew.bestbier/how-to-create-an-aws-user-for-a-ci-cd-service-to-use-when-deploying-to-elastic-beanstalk-a9dd0877fd6f

2. Use this guide to create an Elastic Beanstalk Application and Docker enabled environment to deploy the project into: https://medium.com/@andrew.bestbier/how-to-create-an-elastic-beanstalk-application-8431e7960bad.


3. Use this guide to create a Docker Hub repository: https://medium.com/@andrew.bestbier/how-to-create-a-docker-hub-repository-f07d1e0ddf5e

4. Commit project files and Push to GitHub

5. Sign with your GitHub account into https://travis-ci.com/

6. Add a new project and choose 'settings' next to the node-docker repository.

7. Add the following environment variables:
AWS_ACCESS_KEY_ID -> your access ID
AWS_SECRET_ACCESS_KEY -> your secret key
DOCKER_ID -> your Docker hub username
DOCKER_PASS -> password for your Docker hub

Edit the .travis.yml file in the project root folder and change the region, app, env, bucket_name and bucket_path with your relevant details as created in step 2.

change the docker build and docker push with your Docker hub details in step 3.

Edit Dockerrun.aws.json with your DockerHub details.

Commit the changes and push to Github. when everything is ok, you should see your pipline run and node-docker deployed to your Elastic Beantstalk environment.
