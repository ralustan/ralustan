
#! /usr/bin/env bash
#se verifica daca id-ul este liber

  #se creeaza username si parola introduse de la tastatura
  #daca exista se iese din program
  if id "$1003" &>/dev/null
  then
     echo "id free "
     useradd -u 1003 cosmin
  else
     echo "not free"
     exit 1
  fi

 #acestea sunt grupurile in care poate fi adaugat
 Validgroup="group1, group2, ceimaitari"
 echo "grupuri valide $Validgroup"

 echo "introdu un grup"
 read usergroup
 if "$usergroup" in "$Validgroup" 
 then 
     "se poate adauga"
  else 
      "nu se poate"
   fi  

 #adaugam userul in grup si se creeaza un director in home pentru el
 usermod -a -G $(usergroup) $(username)


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

 usermod -G ceimaitari -d /home/$(username) -s /bin/bash -m $(username)
