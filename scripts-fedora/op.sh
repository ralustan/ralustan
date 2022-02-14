#! /bin/bash
a=10
b=15
val=`expr $a + $b`
echo "a+b: $val"
val=`expr $a - $b`
echo "a-b: $val"
if [ $a = $b ]
then
   echo "a egal b"
fi
