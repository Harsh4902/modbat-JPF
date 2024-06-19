#!/bin/bash

#basic setup for all libraries

[ -e "${SCALA_HOME}" ] || SCALA_HOME="/usr/share/scala"

#[ -e "${SCALA_HOME}" ] || SCALA_HOME="`which scala | sed -e 's,/bin/scala,,'`"

[ -e "${JPF_HOME}" ] || JPF_HOME="${HOME}/jpf/jpf-core"

[ -e "${MODBAT_HOME}" ] || MODBAT_HOME="${HOME}/jpf/modbat"

#[ -e "${MODBAT_HOME}" ] || MODBAT_HOME="${HOME}/modbat/"

[ -e "${JPF_NHANDLER_HOME}" ] || JPF_NHANDLER_HOME="${HOME}/jpf/jpf-nhandler"

#creating .jpf configuration file for running modbat inside jpf

cd /root/jpf

echo "@using = jpf-nhandler" > ModbatTest.jpf
echo "target = modbat.mbt.Main" >> ModbatTest.jpf
echo "classpath = $SCALA_HOME/lib/scala-library.jar:$MODBAT_HOME/build/modbat.jar:$MODBAT_HOME/build/modbat-examples.jar:$JPF_NHANDLER_HOME/build/jpf-nhandler.jar" >> ModbatTest.jpf
echo "target.args =" >> ModbatTest.jpf
