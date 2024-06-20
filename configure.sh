#!/bin/bash

#basic setup for all libraries

[ -d "${SCALA_HOME}" ] || SCALA_HOME="/usr/share/scala"
# 1. SCALA_HOME is not set (default)
# 2. the file at ${SCALA_HOME} does not exist
# 3. SCALA_HOME is then set to /usr/share/scala

[ -d "${SCALA_HOME}" ] || SCALA_HOME="`which scala | sed -e 's,/bin/scala,,'`"
# Ubuntu: 1. there is a /usr/share/scala, skip the rest
# Mac Ports: 2. right-hand side finds the right location

[ -d "${JPF_HOME}" ] || JPF_HOME="/tmp/m-jpf/jpf-core"

[ -d "${MODBAT_HOME}" ] || MODBAT_HOME="/tmp/m-jpf/modbat"

[ -d "${MODBAT_HOME}" ] || MODBAT_HOME="${HOME}/modbat/"

[ -d "${JPF_NHANDLER_HOME}" ] || JPF_NHANDLER_HOME="/tmp/m-jpf/jpf-nhandler"

#creating .jpf configuration file for running modbat inside jpf

echo "@using = jpf-nhandler" > ModbatTest.jpf
echo "target = modbat.mbt.Main" >> ModbatTest.jpf
echo "classpath = $SCALA_HOME/lib/scala-library.jar:$MODBAT_HOME/build/modbat.jar:$MODBAT_HOME/build/modbat-examples.jar:$JPF_NHANDLER_HOME/build/jpf-nhandler.jar" >> ModbatTest.jpf
echo "target.args =" >> ModbatTest.jpf
