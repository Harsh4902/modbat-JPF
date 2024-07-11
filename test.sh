#!/bin/bash
echo ""
echo "Running 'scala modbat -v'..."
echo ""
head -n -1 ModbatTest.jpf > tmp.jpf
echo "target.args = -v" >> tmp.jpf
java -jar /root/jpf/jpf-core/build/RunJPF.jar tmp.jpf

echo "Running 'scala modbat -h'..."
echo ""
head -n -1 ModbatTest.jpf > tmp.jpf
echo "target.args = -h" >> tmp.jpf
java -jar /root/jpf/jpf-core/build/RunJPF.jar tmp.jpf

echo "Running 'scala modbat --classpath=modbat-examples.jar modbat.examples.SimpleModel'..."
echo ""
head -n -1 ModbatTest.jpf > tmp.jpf
echo "target.args = modbat.examples.SimpleModel" >> tmp.jpf
java -jar /root/jpf/jpf-core/build/RunJPF.jar tmp.jpf
echo ""

rm tmp.jpf
