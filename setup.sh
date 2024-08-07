#!/bin/bash

#variables
SETUP_LOCATION=/root/utils

# Create the /root/jpf directory if it doesn't exist
mkdir /root/jpf

# Navigate to the /root/jpf directory
cd /root/jpf

# Clone the repositories
echo "Cloning repositories..."
git clone https://github.com/javapathfinder/jpf-core.git
git clone https://github.com/javapathfinder/jpf-nhandler.git
git clone https://gitlab.com/cartho/modbat.git

#creatign site.properties file
echo "creating site.properties file..."
mkdir /root/.jpf
echo "jpf-core = /root/jpf/jpf-core" > /root/.jpf/site.properties
echo "jpf-nhandler = /root/jpf/jpf-nhandler" >> /root/.jpf/site.properties

#building all the repositories

echo "Building jpf-core..."
cd /root/jpf/jpf-core
./gradlew clean buildJars

echo "Building modbat..."
cd /root/jpf/modbat
./gradlew clean test

echo "Building jpf-nhandler..."
cd /root/jpf/jpf-nhandler
./gradlew clean build

#runnig configure.sh

echo "Running configure.sh..."
cd $SETUP_LOCATION
chmod +x configure.sh
bash configure.sh

# Verify if ModbatTes.jpf file is generated
if [ -f "./ModbatTest.jpf" ]
then
    echo "ModbatTest.jpf file generated successfully."
else 
    echo "Failed to generate ModbatTest.jpf file."
fi
