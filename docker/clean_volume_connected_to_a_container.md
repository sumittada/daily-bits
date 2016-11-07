1. Find the container id using `docker ps`

1. Run following to get the ID of volume using the container ID from above:

  `docker inspect -f '{{ json .Mounts }}' <containerid> | python -m json.tool`

1. Remove the Volume using the Volume-ID from above:

  `docker volume rm <volumeid>`
