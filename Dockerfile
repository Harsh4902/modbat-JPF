# Use the official Ubuntu base image
FROM ubuntu:22.04

# Install required packages and clean up
RUN apt-get update && \
    apt-get install -y wget software-properties-common git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install OpenJDK 11
RUN apt-get update && \
    apt-get install -y openjdk-11-jdk && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install Scala 2.11.12
RUN wget https://downloads.lightbend.com/scala/2.11.12/scala-2.11.12.deb && \
    dpkg -i scala-2.11.12.deb && \
    apt-get install -f && \
    rm scala-2.11.12.deb

# setup of JAVA_HOME
RUN export JAVA_HOME="$(dirname $(dirname $(readlink -f $(which java))))"
ENV PATH $JAVA_HOME/bin:$PATH

# Copy setup and configuration scripts
RUN mkdir /root/utils
COPY setup.sh /root/utils/setup.sh
COPY configure.sh /root/utils/configure.sh
COPY test.sh /root/utils/test.sh
