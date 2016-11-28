# Docker-Fun
This repo just has some docker coding to practice docker and see its functioning

###To create a new file in docker
   
  sudo docker exec -it 674183b76a10 script /dev/null -c "echo 'Hello' > foo.txt"


Verifying we can run docker:
```
docker run hello-world
```
Output: 

![helloworld](https://github.com/VivekBhat/Docker-Fun/blob/master/resources/hello%20world.png)
