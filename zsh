Para poner zsh como el shell predeterminado en Linux, puedes usar el comando chsh y seguir estos pasos: 

    Entrar a la terminal
    Actualizar el sistema operativo
    Instalar zsh
    Verificar que zsh se instaló correctamente
    Ejecutar chsh -s $(which zsh)
    Cerrar y volver a iniciar la sesión
    Probar que funciona ejecutando echo $SHELL 

Instalar zsh

    En Ubuntu, puedes instalar zsh con el comando sudo apt install zsh 

Si no usas Ubuntu o Debian, puedes cambiar el comando para el administrador de paquetes de la distribución que usas 

Personalizar zsh 

    Puedes personalizar el tema y los plugins que utilizarás
    Para acceder a la configuración, puedes teclear el comando vi ~/.zshrc
    Puedes consultar la lista completa de temas existentes con zsh-themes
    Puedes consultar la lista de plugins disponibles con zsh-plugins
