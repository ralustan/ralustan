#! /usr/bin/env bash

a=10
b=20
val=`expr $a + $b`
echo "a + b : $val"
val=`expr $a - $b`
echo "a - b : $val"
if [ $a = $b ]
then
   echo "a is equal to b"
elif [ $a -gt $b ]
then
   echo "a is greater than b"
elif [ $a -lt $b ]
then
   echo "a is less than b"
else
   echo "None of the condition met"
fi

SWEETS="muffin"

case "$SWEETS" in
   "cinnamon") echo "cinn."
   ;;
   "muffin") echo "muff."
   ;;
   "chocho") echo "chocho."
   ;;
esac
echo "Please talk to me ..."
while :
do
  read INPUT_STRING
  case $INPUT_STRING in
	hello)
		echo "Hello yourself!"
		;;
	bye)
		echo "See you again!"
		break
		;;
	*)
		echo "What the fuck"
		;;
  esac
done
echo
echo "Key Bye"