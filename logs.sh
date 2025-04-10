Los logs suelen encontrarse en /var/log/

Búsqueda y filtrado en los logs
    Buscar una palabra o frase específica: grep permite buscar texto dentro de archivos.
      grep "texto_a_buscar" nombre_del_log.log

    Buscar sin distinción entre mayúsculas y minúsculas: Añade la opción -i a grep.​
      grep -i "texto_a_buscar" nombre_del_log.log
      
    Contar el número de ocurrencias de un término: Utiliza grep con la opción -c.​
      grep -c "texto_a_buscar" nombre_del_log.log

    Mostrar líneas que no contengan un término: Añade la opción -v a grep.​
      grep -v "texto_a_excluir" nombre_del_log.log



Ver logs del sistema con journalctl: journalctl muestra los registros del sistema en sistemas que utilizan systemd.​
  journalctl

Ver logs del arranque actual: Muestra los registros desde el último arranque.​
  journalctl -b

Filtrar logs por servicio: Muestra los registros relacionados con un servicio específico.​
  journalctl -u nombre_del_servicio

Ver logs en tiempo real con journalctl: Monitorea los logs en tiempo real.​
  journalctl -f

Para leer un log comprimido:​
  zcat nombre_del_log.log.gz

Visualización de logs comprimidos en tiempo real: Utiliza zless para navegar por logs comprimidos.​
  zless nombre_del_log.log.gz
