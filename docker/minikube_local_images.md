By default minikube assumes all images are to be pulled from publically accessible Docker repositories or remote
repositories that the minikube VM can access with some pre-saved credentials (like Google container registery)
But, you can give following command and then any future docker commands you give on your host will be executed 
inside the minikube VM. Which means if you build any docker images after that, they will be availble inside minikube.

`eval $(minikube docker-env)`
