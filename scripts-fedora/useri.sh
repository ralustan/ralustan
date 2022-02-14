#! /bin/bash

echo "Automatizare vizualizare useri"
echo "User curent: "
who --count
echo "Cu ip: "
hostname -i

echo "Toti userii: "
getent passwd | awk -F: '{print $ 1}'

