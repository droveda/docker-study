# Useful commands and instructions

## Configure vm using vagrant
* vagrant init ubuntu/bionic64
* edit the Vagrantfile following the example
* vagrant up

## Install Docker
* sudo apt-get remove docker docker-engine docker.io
* sudo apt-get update
* curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
* sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
* sudo apt-get update
* sudo apt-get install docker-ce
* sudo docker version
* docker without sudo
    * sudo groupadd docker
    * sudo usermod -aG docker $USER
* another way to install docker
    * apt-get update && apt-get install -y docker.io

---

## General Docker commands
* A simple hello world to test docker installation
    * sudo docker run hello-world
* docker ps -a
* docker run ubuntu
* docker run ubuntu echo "Hello World"
* docker run -it ubuntu
* docker start 3b690381c9fe
* docker stop 3b690381c9fe
* docker start -a -i 3b690381c9fe (attach/interactive)
* docker rm cd56b4b79b0d (remove a container)
* docker container prune (remove all the inactive containers)
* docker images (show docker images)
* docker rim hello-world (remove the image)
* docker run -d dockersamples/static-site
* docker run -d -P --name my-site dockersamples/static-site (maps the port of the host with the container)
* docker port 8499c53c5a23 (List port mappings or a specific mapping for the container)
* docker run -d -p 12345:80 --name my-site dockersamples/static-site (maps the port 12345 of the host to the port 80 of the container)
* docker run -d -p 12345:80 -e AUTHOR="dRoveda" --name my-site dockersamples/static-site (maps the port 12345 of the host to the port 80 of the container)
* docker stop $(docker ps -q) (stop all the containers)
* docker exec -it container1 ping container2


### Working with volumes
* docker run -it -v "/home/vagrant/my_volume:/var/www" ubuntu 
* docker inspect d628
* docker run -d -p 8080:3000 -v "/vagrant/volume-exemplo:/var/www" -w "/var/www" node npm start

### Working with Dockerfile
* first create a Dockerfile following the example
* docker build -f Dockerfile -t droveda/node .
* docker run -d -p 8080:3000 droveda/node

### Using docker hub
* create an account on docker hub
* docker login
* docker push {image name} (send the image)
* docker pull {image name} (download the image)

### Other general linux util commands
* netstat -atunp
* apt-get update && apt-get install -y iputils-ping

### Docker working with network
* hostname -i (shows ip, works only inside a container)
* docker network create --driver bridge my-network (create a network)
* docker network ls (list networks)
* docker run -it --name my-container --network my-network ubuntu
* ping my-container (this way you can use the container name to ping another container)
* docker network inspect my-network


### Install docker compose on linux
* (execute the following to install) sudo curl -L https://github.com/docker/compose/releases/download/1.15.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
* (make docker compose executable) sudo chmod +x /usr/local/bin/docker-compose

### Docker compose
* docker-compose build (this command will build the images that a docker-compose file needs)
* docker-compose up
* docker-compose up -d
* docker-compose ps
* docker-compose down
* docker-compose restart
