git init

clear

read -r -p "What do you want to push?" fisier

git add $fisier

clear

echo "Loading..."

sleep 2
#! /usr/bin/env bash

git status

sleep 2

read -r -p "Message to commit" commit

git commit -m "$commit"

git push -f origin main

echo "Success"
