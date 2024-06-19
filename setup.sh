#!/bin/bash

#variables
SETUP_LOCATION=$(pwd)
echo $SETUP_LOCATION
# Create the /root/jpf directory if it doesn't exist
mkdir $HOME/jpf

# Navigate to the /root/jpf directory
cd $HOME/jpf

# Clone the repositories
echo "Cloning repositories..."
git clone https://github.com/javapathfinder/jpf-core.git
git clone https://github.com/javapathfinder/jpf-nhandler.git
git clone https://gitlab.com/cartho/modbat.git

#creatign site.properties file
echo "creating site.properties file..."
mkdir $HOME/.jpf
echo "jpf-core = /root/jpf/jpf-core" > $HOME/.jpf/site.properties
echo "jpf-nhandler = /root/jpf/jpf-nhandler" >> $HOME/.jpf/site.properties

#building all the repositories

echo "Building jpf-core..."
cd $HOME/jpf/jpf-core
./gradlew clean buildJars

echo "Building modbat..."
cd $HOME/jpf/modbat
./gradlew clean test

echo "Building jpf-nhandler..."
cd /$HOME/jpf/jpf-nhandler
./gradlew clean build

#runnig configure.sh

echo "Running configure.sh..."
cd $SETUP_LOCATION
chmod +x configure.sh
bash configure.sh

# Verify if ModbatTes.jpf file is generated
if [ -f "$HOME/jpf/ModbatTest.jpf" ]
then
    echo "ModbatTest.jpf file generated successfully."
else 
    echo "Failed to generate ModbatTest.jpf file."
fi
