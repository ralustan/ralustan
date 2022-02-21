#! /usr/bin/env bash
#Author: Raluca Stan
#NAME[0]="Zara"
#NAME[1]="Qadir"
#NAME[2]="Mahnaz"
#NAME[3]="Ayan"
#NAME[4]="Daisy"
# shellcheck disable=SC2039
#echo "First Method: ${NAME[*]}"
# shellcheck disable=SC2145
# shellcheck disable=SC2039
#echo "Second Method: ${NAME[@]}"
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




