# modbat-JPF
repo for docker image of Modbat-JPF integration

- Build Docker image from Dockerfiel
  `docker build -t modbat-jpf:1.0 .`

- Create docker container from `modbat-jpf:1.0` image
  `CONT_ID=$(docker run -d -it modbat-jpf:1.0)`

- get access of container's shell
  `docker exec -it $CONT_ID bash`
