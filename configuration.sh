#!/bin/bash

#basic setup for all libraries

[ -e "${SCALA_HOME}" ] || SCALA_HOME="/usr/share/scala/"

[ -e "${SCALA_HOME}" ] || SCALA_HOME="`which scala | sed -e 's,/bin/scala,,'`"

[ -e "${JPF_HOME}" ] || JPF_HOME="${HOME}/jpf/jpf-core/"

[ -e "${MODBAT_HOME}" ] || MODBAT_HOME="${HOME}/jpf/modbat/"

[ -e "${MODBAT_HOME}" ] || MODBAT_HOME="${HOME}/modbat/"

[ -e "${JPF_NHANDLER_HOME}" ] || JPF_NHANDLER_HOME="${HOME}/jpf/jpf-nhandler/"

#creating .jpf configuration file for running modbat inside jpf

echo "@using = jpf-nhandler" > $HOME/jpf/ModbatTest.jpf
echo "target = modbat.mbt.Main" >> $HOME/jpf/ModbatTest.jpf
echo "classpath = $SCALA_HOME/lib/scala-library.jar:$MODBAT_HOME/build/modbat.jar:$JPF_NHADLER_HOME/build/jpf-nhandler.jar" >> $HOME/jpf/ModbatTest.jpf
echo "target.args = $1" >> $HOME/jpf/ModbatTest.jpf

