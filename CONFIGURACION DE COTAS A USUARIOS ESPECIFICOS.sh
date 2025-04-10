#!/bin/bash

# Verifica si eres root
if [ "$EUID" -ne 0 ]; then
  echo "Corre como root, inútil." >&2
  exit 1
fi

USER_NAME="$1"
BLOCK_LIMIT="$2"  # En KB
INODE_LIMIT="$3"

if [ -z "$USER_NAME" ] || [ -z "$BLOCK_LIMIT" ] || [ -z "$INODE_LIMIT" ]; then
  echo "Uso: $0 <usuario> <bloques_kb> <inodos>"
  exit 1
fi

# 1. Habilitar cuotas en /etc/fstab (usuario debe hacerlo manual)
echo "Verifica que en /etc/fstab tengas algo como:"
echo "/dev/sdXn /home ext4 defaults,usrquota 0 2"

# 2. Remontar /home con quotas (si ya editaste fstab)
mount -o remount /home

# 3. Crear archivos de control de cuotas
quotacheck -cum /home
quotaon /home

# 4. Asignar cuota
setquota -u "$USER_NAME" $BLOCK_LIMIT $BLOCK_LIMIT $INODE_LIMIT $INODE_LIMIT /home

# 5. Mostrar lo asignado
echo "Cuota aplicada a $USER_NAME:"
quota -u "$USER_NAME"
