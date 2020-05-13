### To stop all running containers (needed before removing)
`docker stop $(docker ps -a -q)`

### To remove all stopped containers (needed before removing images)
`docker rm $(docker ps -a -q)`

### To remove all images
`docker rmi $(docker images -a -q)`

### To remove all non-essential networks
`docker network rm $(docker network ls -q)`

Or, use -f if you have lot of tagged and dependent images

`docker rmi -f $(docker images -a -q)`

### To remove all volumes
`docker volume rm  $(docker volume ls -q)`
