#!/bin/bash
#Ayudamequieromatar:D

function Nombre() {
	while true; do
		read -r -p "Buena noshe. Ingrese el nombre que le quiere poner a su monigote: " name
		if grep -q "$name" /etc/passwd; then
			echo " Ya existe esta vaina"
		else
			echo "Se ha guardado tu coso"
			break
		fi
	done	
}

function Grupo() {
	read -r -p "Anota el grupo en el que deseas estar: " grupo
	if grep -q "$grupo" /etc/group; then
		echo "Felicidades. Tuviste fe, que si existe"
	else
		echo -e "No existe, asi que lo vamos a crear. Tas de acuerdo? Si o no? \nNo me importa, procedamos :D "
		groupadd "$grupo" 
	fi		
}

function Hogar() {
	while true; do
		read -r -p "Cual es tu directorio hogar? " hogar
		if grep -q ":/home/$hogar:" /etc/passwd; then
			echo "Ya lo usaron. Sorry to much. Escribe otro: "
		elif [ -d /home/"$hogar" ]; then
			echo "Existe. Se encuentra desocupado y listo para usar "
			break
		else 
			echo "No existe, tons lo vamos a crear uwu "
			mkdir /home/"$hogar"
			break 
		fi	
	done
}

function Contrasenia() {
	while true; do
		read -r -s -p "Asigna una contrasenia: " contrasenia
		echo
		if [[ ${#contrasenia} -ge 8 &&
				"$contrasenia" =~ [A-Z]  &&    
		        "$contrasenia" =~ [a-z] &&    
		        "$contrasenia" =~ [0-9]  &&    
		        "$contrasenia" =~ [#\$@_\-] ]]; then  
			echo "Contrasenia validada"
			break
		else
			echo "Error: No le supiste a la vida. Esa contrasenia no es buena, tons prueba otra: "
		fi
	done		
}

function Comentario() {
	read -r -p "Pon un comentario OWO: " comentario
	echo "Eso Tilin. Ya se guardo"
}

function Cuota() {
	echo "Tendras una cuota, buenas tardes"
	echo -e "Escoge tu veneno. Soft o Hard? \n Recuerda que el Hard debe ser mayor al Soft"

	while true;do
		read -r -p "Soft: " suavemente
		read -r -p "Hard: " durito

		if [ "$suavemente" -eq "$durito" ]; then
			echo "Te dije que el Hard debia ser mayor al Soft >:c"
		elif [ "$suavemente" -gt "$durito" ]; then
			echo "Te dije que el Hard debia ser mayor al Soft >:c"
		else 
			echo "Ya se hizo. Amen"
			quota 
			break
		fi
	done 
}

Nombre
echo ""
Comentario
echo ""
Grupo 
echo ""
Hogar 
echo ""

useradd -d /home/$hogar -s /bin/sh -c "$comentario" -g "$grupo" "$name" 
Contrasenia 
echo "$name:$contrasenia" | chpasswd
setquota -u "$name" "$suavemente" "$durito" 0 0 /
quota -u "$name"
echo ""
