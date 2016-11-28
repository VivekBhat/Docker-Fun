# Docker-Fun
This repo just has some docker coding to practice docker and see its functioning

Verifying we can run docker:
```
docker run hello-world
```
Output: 

![helloworld](https://github.com/VivekBhat/Docker-Fun/blob/master/resources/hello%20world.png)

### Creating docker image

Build a docker environment for running build.  Create a "Dockerfile" and place this content inside:

Output: 

![helloworld](https://github.com/VivekBhat/Docker-Fun/blob/master/resources/hello%20world.png)


Building the  the docker image

    sudo docker build -t ncsu/buildserver .
    
See what images are current available on the machine.

    sudo docker images

Verify image works and can run a maven command.

    sudo docker run -it ncsu/buildserver mvn --version
