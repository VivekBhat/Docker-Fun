# Docker-Fun
This repo just has some docker coding that I did for practicing docker and to see its functioning and working.


## Preqs

1. VirtualBox
2. Vagrant
3. Docker

After The above prereqs are met:


### Verification of system

Verifying we can run docker:
```
docker run hello-world
```

**Output:** 

![helloworld](https://github.com/VivekBhat/Docker-Fun/blob/master/resources/hello%20world.png?raw=true)

<br>

----

### Creating docker image

* Build a docker environment for running build.  Create a "Dockerfile" and place this content inside:

**Output:** 

![dockerfile](https://github.com/VivekBhat/Docker-Fun/blob/master/resources/dockerfile.png?raw=true)


* Build the the docker image
```
sudo docker build -t ncsu/buildserver .
```

**Output:** 

![dockerbuild](https://github.com/VivekBhat/Docker-Fun/blob/master/resources/dockerbuild.png?raw=true)

 
* See what images are current available on the machine.
```
sudo docker images
```

**Output:** 

![dockerbuild](https://github.com/VivekBhat/Docker-Fun/blob/master/resources/dockerimages.png?raw=true)


* Verify image works and can run a maven command.
```
sudo docker run -it ncsu/buildserver mvn --version
```

**Output:** 

![dockerbuild](https://github.com/VivekBhat/Docker-Fun/blob/master/resources/dockermvnversion.png?raw=true)

----

### Fun Stuff 
##### Containers

* Let's look at all the containers we have created by running commands above.

    sudo docker ps -a 

**Output:** 

![containersadded](https://github.com/VivekBhat/Docker-Fun/blob/master/resources/createdcontainers.png?raw=true)


* We're going to need a container, with a process *still* running in it, meaning we need the `-d` arg.
```
sudo docker run -it -d ncsu/buildserver
```

**Output:** 

![running container](https://github.com/VivekBhat/Docker-Fun/blob/master/resources/runningcontainer.png?raw=true)

* This will show you last container id created.    
```
sudo docker ps -l
```

**Output:** 

![id container](https://github.com/VivekBhat/Docker-Fun/blob/master/resources/containerid.png?raw=true)

* Let's take last container, and update it.
```
sudo docker exec -it 6195dba8e712 script /dev/null -c "echo 'Hello' > foo.txt"
```

* Make sure we can see change:
```
docker exec -it 6195dba8e712 ls
```

**Output:** 
 
 As we can see foo.txt is added

![foo txt](https://github.com/VivekBhat/Docker-Fun/blob/master/resources/fooadded.png?raw=true)

* Now, let's commit this to our image.
```
docker commit 6195dba8e712 ncsu/buildserver
```
**Now, any new container created from this image will have the new chanage.**

### Building

* In your host VM, create 'build.sh' and place the following inside: 
```
git clone https://github.com/CSC-326/JSPDemo
cd JSPDemo
mvn compile -DskipTests -Dmaven.javadoc.skip=true
```


* Execute script
```
chmod +x build.sh
sudo docker run -v /home/<username>/:/vol ncsu/buildserver sh -c /vol/build.sh
```

**Output:** 
```
[INFO] Changes detected - recompiling the module!
[INFO] Compiling 5 source files to /JSPDemo/target/classes
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time: 29.075s
[INFO] Finished at: Mon Nov 28 21:36:19 UTC 2016
[INFO] Final Memory: 15M/37M
[INFO] ------------------------------------------------------------------------

```

![Building](https://github.com/VivekBhat/Docker-Fun/blob/master/resources/build.png?raw=true)



### Server

* We will create a simple server to trigger a build server.

**Install node (on the VM).**

```
curl https://raw.githubusercontent.com/creationix/nvm/v0.16.1/install.sh | sh
source ~/.profile
nvm install v0.11.13
nvm use 0.11.13
echo "nvm use 0.11.13" >> ~/.profile
```

* A simple http server in node.

```
cd BuildServer
node server.js
```

**Output:** 

![server](https://github.com/VivekBhat/Docker-Fun/blob/master/resources/server.png?raw=true)

