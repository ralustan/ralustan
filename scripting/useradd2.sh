#! /usr/bin/env bash
#se verifica daca id-ul este liber

if [ $(id) -eq 0 ]
then
  #se creeaza username si parola introduse de la tastatura
  read -p "Enter username: " username
  read -s -p "Eneter password : " password
fi
  #se verifica userul in etc/passwd
  grep  "^$username" /etc/passwd >/dev/null
  #daca exista se iese din program
if [ $(username) eq 0 ]
then
 echo "$username exists :( "
     exit 1
  else
       useradd -m -p "$username" "$password"
       echo "User $username  added :) "
fi


 #se creeaza un grup pt user
 groupadd group1
 groupadd group2
 groupadd ceimaitari
 #acestea sunt grupurile in care poate fi adaugat
 Validgroup="group1, group2, ceimaitari"
echo "introdu un grup"
 read usergroup

 #se verifica existenta
 grep "$usergroup" /etc/group 2>&1>/dev/null
 if [ $? != 0 ]
 #daca exista se adauga userul daca nu se iese
 then
     echo "Group is not a Validgroup\n"
     exit 1
 else
   #adaugam userul in grup si se creeaza un director in home pentru el
     useradd -g $usergroup -d /home/$username -s /bin/bash -m $username
     passwd $username
     echo $usergroup
fi
 echo "username id"  id $username
 echo "usergroup id" id $usergroup
 echo "informatii" getent $usergroup
 echo "grupuri valide $Validgroup"

 #citim toate informatiile si le adaugam pe linie noua
 #folosim -e pentru a recunoaste \n
 #folosim cat pentru a adauga pe linie noua fara sa stearga informatia
 cat -e  "Numele userului:$username\nGrupul:$usergroup"
 cat > /etc/passwd
 cat > /etc/group
 cat > /etc/shadow

 cat > /etc/passwd
 cat > /etc/group
 cat > /etc/shadow

 useradd -g ceimaitari -d /home/$username -s /bin/bash -m $username
