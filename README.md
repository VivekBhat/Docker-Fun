# Docker-Fun
This repo just has some docker coding to practice docker and see its functioning

Verifying we can run docker:
```
docker run hello-world
```
**Output:** 

![helloworld](https://github.com/VivekBhat/Docker-Fun/blob/master/resources/hello%20world.png)

### Creating docker image

Build a docker environment for running build.  Create a "Dockerfile" and place this content inside:

**Output:** 

![dockerfile](https://github.com/VivekBhat/Docker-Fun/blob/master/resources/dockerfile.png)


* Build the the docker image
```
sudo docker build -t ncsu/buildserver .
```

**Output:** 

![dockerbuild](https://github.com/VivekBhat/Docker-Fun/blob/master/resources/dockerbuild.png)

 
* See what images are current available on the machine.
```
sudo docker images
```

**Output:** 

![dockerbuild](https://github.com/VivekBhat/Docker-Fun/blob/master/resources/dockerimages.png)


* Verify image works and can run a maven command.
```
sudo docker run -it ncsu/buildserver mvn --version
```

**Output:** 

![dockerbuild](https://github.com/VivekBhat/Docker-Fun/blob/master/resources/dockermvnversion.png)

### Fun Stuff 
##### Containers

* Let's look at all the containers we have created by running commands above.

    sudo docker ps -a 

**Output:** 

![containersadded](https://github.com/VivekBhat/Docker-Fun/blob/master/resources/createdcontainers.png)


* We're going to need a container, with a process *still* running in it, meaning we need the `-d` arg.
```
sudo docker run -it -d ncsu/buildserver
```

**Output:** 

![running container](https://github.com/VivekBhat/Docker-Fun/blob/master/resources/runningcontainer.png)

* This will show you last container id created.    
```
sudo docker ps -l
```

**Output:** 

![id container](https://github.com/VivekBhat/Docker-Fun/blob/master/resources/containerid.png)

* Let's take last container, and update it.
```
sudo docker exec -it 6195dba8e712 script /dev/null -c "echo 'Hello' > foo.txt"
```

* Make sure we can see change:
```
docker exec -it 6195dba8e712 ls
```

**Output:** 
 
 * As we can see foo.txt is added
![foo txt](https://github.com/VivekBhat/Docker-Fun/blob/master/resources/fooadded.png)
