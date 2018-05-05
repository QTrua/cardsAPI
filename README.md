# cardsAPI

The Jenkins Continuous Integration and Delivery server with SoapUI based REST API tests demonstrated on Deck of Cards API (https://deckofcardsapi.com/)

# Usage

```
./start_jenkins.sh
```

NOTE: this guide assumes the following environment: Ubuntu 16.04 LTS 

This will store the workspace in /var/jenkins_home. All Jenkins data lives in there - including plugins and configuration.
If needed, explicit volumes for storing your data can be defined in jenkins.yml file.

# Setting the environment

Login to your machine as root user. All scripts below asume that you're executing them as root user.

Checkout this repo to your local folder. Then execute:

`./install_script.sh`

Install script will download and install docker and other necessary packages. It will also initiate the docker swarm.

After this, you're ready to build a docker container by executing the following command:

`./build_docker.sh`

NOTE: docker image will be pushed to Docker Hub. Login data for the account used in in the final documentation. Before executing, you might have to login to docker hub using the docker login command.

All the necessary plugins, configuration and other tools are already built into the container. You just need to run it to be able to use it. After the docker container has been built, you can run it using the following command:

`./start_jenkins.sh`

Few moments later, your Jenkins container will be up and running. Example server where everything is deployed is located at http://172.104.236.223:8080/. Login data can be found in the final documentation.

Job executing the SoapUI tests is located in the Jenkinsfile. You should create a Pipeline job in your instance and reference this file in the configuration to be able to execute it (option Pipeline script from SCM).

Jenkins containter can be stopped by executing the following command:

`./stop_jenkins.sh`

## Backing up data

If your volume is inside a container - you can use ```docker cp $ID:/var/jenkins_home``` command to extract the data, or other options to find where the volume data is.
Note that some symlinks on some OSes may be converted to copies (this can confuse jenkins with lastStableBuild links etc)

For more info check Docker docs section on [Managing data in containers](https://docs.docker.com/engine/tutorials/dockervolumes/)
