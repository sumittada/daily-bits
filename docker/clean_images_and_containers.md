### To stop all running containers (needed before removing)
`docker stop $(docker ps -a -q)`

### To remove all stopped containers (needed before removing images)
`docker rm $(docker ps -a -q)`

### To remove all images
`docker rmi $(docker images -a -q)`
