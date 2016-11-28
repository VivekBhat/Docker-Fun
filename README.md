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

![dockerfile](https://github.com/VivekBhat/Docker-Fun/blob/master/resources/dockerfile.png)


Build the the docker image

    sudo docker build -t ncsu/buildserver .
  
 Output: 

![dockerbuild](https://github.com/VivekBhat/Docker-Fun/blob/master/resources/dockerbuild.png)

 
See what images are current available on the machine.

    sudo docker images

 Output: 

![dockerbuild](https://github.com/VivekBhat/Docker-Fun/blob/master/resources/dockerimages.png)


Verify image works and can run a maven command.

    sudo docker run -it ncsu/buildserver mvn --version

 Output: 

![dockerbuild](https://github.com/VivekBhat/Docker-Fun/blob/master/resources/dockermvnversion.png)
