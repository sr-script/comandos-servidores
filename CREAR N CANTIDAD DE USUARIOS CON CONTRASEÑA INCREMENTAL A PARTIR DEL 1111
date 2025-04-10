#!/bin/bash

# Script para crear N usuarios automáticamente con contraseñas como 1111, 2222, etc. cuando llegue al usuario10 la pass va a ser 10101010 y asi
#ejemplo de uso
#darle permisos jejeje chmod +x crear_usuarios_incremental.sh
#ejecutarlo con el numero de cantidad de usuarios a crear sudo ./crear_usuarios_incremental.sh 5


# Verifica que seas root
if [ "$(id -u)" -ne 0 ]; then
  echo "Este script debe ejecutarse como root." >&2
  exit 1
fi

# Verifica que pasaste un número como argumento
if [ -z "$1" ] || ! [[ "$1" =~ ^[0-9]+$ ]]; then
  echo "Uso: $0 cantidad_de_usuarios" >&2
  exit 1
fi

CANTIDAD="$1"
echo "Se van a crear $CANTIDAD usuarios con contraseñas incrementales..."

# Archivo para guardar las credenciales generadas
OUTPUT="credenciales_usuarios.txt"
echo "Usuario : Contraseña" > "$OUTPUT"
echo "====================" >> "$OUTPUT"

for i in $(seq 1 "$CANTIDAD"); do
  USUARIO="usuario$i"
  # Contraseña incremental (e.g., 1 -> 1111, 2 -> 2222)
  DIGITO=$(printf "%d" "$i")
  CONTRASENA=$(printf "%.0s$DIGITO" {1..4})

  # Verifica si el usuario ya existe
  if id "$USUARIO" &>/dev/null; then
    echo "El usuario $USUARIO ya existe. Lo salto."
    continue
  fi

  echo "👤 Creando $USUARIO con contraseña $CONTRASENA..."

  if useradd -m -s /bin/bash "$USUARIO"; then
    echo "$USUARIO:$CONTRASENA" | chpasswd
    passwd -e "$USUARIO"  # Forzar cambio de contraseña al primer login
    echo "$USUARIO : $CONTRASENA" >> "$OUTPUT"
    echo "Usuario $USUARIO creado exitosamente."
  else
    echo "Error al crear el usuario $USUARIO." >&2
  fi
done

echo "Proceso completado."
echo "Credenciales guardadas en: $OUTPUT"



