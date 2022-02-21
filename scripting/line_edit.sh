#!/bin/bash
FILE="line_edit"
clear

if [ ! -f $FILE ]
then	
	true > $FILE
fi

# Verifica daca fisierul $FILE este gol sau nu
function check_empty_file {
	if [ ! -s $FILE ] 
	then
		echo "Fisier gol!"
		return 1
	else	
		return 0
	fi
}

#Intreaba un Y/N iar daca utilizator raspunde altceva revine la intrebare!
function ask_confirmation {
	while read -r -p "Esti sigur ca doresti sa continui? (Y/N): " asking_confirmation ; do
		case $asking_confirmation in
				[Yy] )
				return 0
			;;
				[Nn] )
				echo "Actiune anulata"
				return 1
			;;
			* ) 
				echo "Raspunde cu Y sau N"
			;;
		esac
	done
}

while true
do
	echo "
Alege optiunea:
1) Pentru a adauga o linie noua
2) Pentru a sterge o linie
3) Vizualizare toate liniile
4) Editare linie
5) Inversare a 2 linii
0) Pentru a iesi din program"
	read -r optiune_meniu
	case $optiune_meniu in
		1)
			read -r -p "Ce text vrei sa adaugi? " text_de_introdus
			if [ -s "$text_de_introdus" ]
			then
				echo "Linia nu are voie sa fie goala"
			else
				echo "$text_de_introdus" >> $FILE
				echo "Linia a fost adaugata"
			fi
		;;
		2)
			if check_empty_file
			then
				read -r -p "Ce linie doresti sa stergi?: " linie_de_sters
				if [ "$(cat $FILE | wc -l)" -ge "$linie_de_sters" ] && [ "$linie_de_sters" -gt 0 ]
				then 
					if ask_confirmation
					then
						sed -i "$linie_de_sters"'d' $FILE
						echo "Linia a fost stearsa"
					fi
				else
					echo "Linia nu exista"
				fi
			fi
		;;
		3)
			if check_empty_file 
			then
				echo "Astea sunt liniile: "
				cat -n "$FILE"
			fi
		;;
		4)
			if check_empty_file
			then
				read -r -p "Alege linia pe care vrei sa o editi: " linie_de_editat
				if [ "$(cat $FILE | wc -l)" -ge "$linie_de_editat" ] && [ "$linie_de_editat" -gt 0 ]
				then
					read -r -p "Cu ce text doresti sa schimbi linia?" linie_noua
					if ask_confirmation
					then
						linie_veche=$(sed "$linie_de_editat"'q;d' $FILE)
						sed -i "$linie_de_editat"s/"$linie_veche"/"$linie_noua/""" $FILE
					fi
				else
					echo "Linia nu exista"
				fi
			fi
		;;
		5)
			if check_empty_file
			then
				read -r -p "Alege linia pe care vrei sa o muti: " linie_pozitie_veche
				if [ "$linie_pozitie_veche" -eq "$linie_pozitie_veche" ] 2>/dev/null #de retinut 
				then
					if [ "$(cat $FILE | wc -l)" -ge "$linie_pozitie_veche" ] || [ "$linie_pozitie_veche" -gt 0 ]
					then
						read -r -p "Pe ce pozitie vrei sa pui linia noua?" linie_pozitie_noua
						linie_de_mutat=$(sed "$linie_pozitie_veche"'q;d' $FILE) # Asta ii sirul de caractere de la prima linie
						linie_mutata=$(sed "$linie_pozitie_noua"'q;d' $FILE) # Asta ii sirul de caractere de la a doua linie
						if ask_confirmation
						then
							if [ "$(cat $FILE | wc -l)" -ge "$linie_pozitie_noua" ] && [ "$linie_pozitie_noua" -gt 0 ] && [ ! -z "$linie_pozitie_noua" ]
							then
								sed -i "$linie_pozitie_noua"s/"$linie_mutata"/"$linie_de_mutat/""" $FILE
								sed -i "$linie_pozitie_veche"s/"$linie_de_mutat"/"$linie_mutata/""" $FILE
							else
								echo "Linia in care vrei sa muti nu exista"
							fi
						fi
					else
						echo "Linia nu exista"
					fi
				else
					echo "Linia nu poate fi goala"
				fi
			fi
		;;
		0)
			echo "Ai iesit din program"
			break
		;;
		*)
			echo "Optiunea nu este valida"
		;; 
	esac
done