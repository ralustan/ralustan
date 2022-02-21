
#! /usr/bin/env bash
echo "Guess game on"

number=$(( $RANDOM % 10 + 1 ))
echo $number
sc=0
while [ $sc -lt 3 ]
do   


echo "Guess the number!"
read input_number
if [[ $input_number -gt $number ]]
then 
echo "Too high"
elif [[ $input_number -lt $number ]]
then 
echo "Too low"
else 
echo "You guessed!"
fi

((sc++))
if [[ $sc = 3 ]] 
then 
echo "Game Over"
fi

done 

