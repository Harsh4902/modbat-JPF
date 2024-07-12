# Modbat-JPF

- we are providing separate environment as docker container to test and run Modbat on JPF with minimal effort. follow bellow given setps

  ## Container creation for Modbat-JPF

    - Build Docker image from Dockerfiel
      `docker build -t modbat-jpf:1.0 .`

  - Create docker container from `modbat-jpf:1.0` image
      `CONT_ID=$(docker run -d -it modbat-jpf:1.0)`

  - get access of the container's shell
    `docker exec -it $CONT_ID bash`

  ## How to run?

  - run `setup.sh` which will set all required environment variables, install required libraries and generate `.jpf` properties file.
    `bash /utils/setup.sh`

  - run `test.sh` to check all test examples are perfectly running
    `bash /utils/test.sh`