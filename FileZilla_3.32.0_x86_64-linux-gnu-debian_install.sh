#!/bin/bash
# Última actualización: 07/04/2018
cd /
# Se descarga FileZilla
wget https://dl1.cdn.filezilla-project.org/client/FileZilla_3.32.0_x86_64-linux-gnu.tar.bz2
# se confirma la existencia de dependencias necesarias
echo 'Buscando dependencia libpng14...'
if [ -d /usr/include/libpng14/ ];
	then
		echo '------------------------------'
		echo 'Dependencia encontrada...'
		echo '>>> Ingresando a /usr/local/...'
		cd /usr/local/
		echo 'Se va a instalar en /usr/local/...'
		read -p "Ingresa el nombre del directorio principal de instalacion, si no existe se creará: " DIRINST
		if [ -d $DIRINST ];
			then
				echo 'El directorio ya existe...'
				echo '>>> Ingresando...'
				cd $DIRINST
			else
				echo 'El directorio no existe...'
				echo 'Creando directorio...'
				mkdir $DIRINST
				echo 'Directorio creado...'
				echo '>>> Ingresando...'
				cd $DIRINST
		fi
	sleep 2
	else
		echo '------------------------------'
		echo 'Dependencia libpng14 no encontrada...'
		echo '>>> Ingresando a /usr/local/...'
		cd /usr/local/
		echo 'Instalando dependencia faltante...'
		sleep 2
		wget http://ftp.br.debian.org/debian/pool/main/libp/libpng/libpng12-0_1.2.50-2+deb8u3_amd64.deb
		dpkg -i libpng12-0_1.2.50-2+deb8u3_amd64.deb
		echo 'Dependencia faltante instalada...'
		echo 'Se va a instalar en /usr/local/...'
		read -p "Ingresa el nombre del directorio principal de instalacion, si no existe se creará: " DIRINST
		if [ -d $DIRINST ];
			then
				echo 'El directorio ya existe...'
				echo '>>> Ingresando...'
				cd $DIRINST
			else
				echo 'El directorio no existe...'
				echo 'Creando directorio...'
				mkdir $DIRINST
				echo 'Directorio creado...'
				echo '>>> Ingresando...'
				cd $DIRINST
		fi
fi
echo 'Instalando dependencias adicionales...'
sleep 2
apt-get install filezilla-common libatk1.0-0 libatomic1 libc6 libcairo2 libdbus-1-3 libfilezilla0 \
libfontconfig1 libfreetype6 libgcc1 libgdk-pixbuf2.0-0 libglib2.0-0 libgnutls30 libgtk2.0-0 libnettle6 \
libpango-1.0-0 libpangocairo-1.0-0 libpangoft2-1.0-0 libpugixml1v5 libsqlite3-0 libstdc++6 libwxbase3.0-0v5 \
libwxgtk3.0-0v5 xdg-utils
echo 'Dependencias instaladas...'
sleep 2
mv /FileZilla_3.32.0_x86_64-linux-gnu.tar.bz2 /usr/local/$DIRINST
tar jxvf FileZilla_3.32.0_x86_64-linux-gnu.tar.bz2
mv FileZilla3 /usr/local/$DIRINST/filezilla3
#
#App a Menú
cd /usr/share/applications/
touch filezilla.desktop
echo '[Desktop Entry]' > filezilla.desktop
echo 'Version=3.32.0' >> filezilla.desktop
echo 'Name=FileZilla' >> filezilla.desktop
echo 'Comment="Gestor torrent' >> filezilla.desktop
echo 'Exec=/usr/local/'$DIRINST'/filezilla3/bin/filezilla' >> filezilla.desktop
echo 'Icon=/usr/local/'$DIRINST'/filezilla3/share/icons/hicolor/16x16/apps/filezilla.png' >> filezilla.desktop
echo 'Categories=Network;' >> filezilla.desktop
echo 'Terminal=false' >> filezilla.desktop
echo 'Type=Application' >> filezilla.desktop
cd /usr/local/$DIRINST/filezilla3/
#
#Remove
touch remove.sh
echo '#!/bin/bash' > remove.sh
echo "echo '------------------------------'" >> remove.sh
echo "echo 'Removiendo...'" >> remove.sh
echo 'apt-get remove libpng12-0 filezilla-common libfilezilla0 libpugixml1v5' >> remove.sh
echo "echo -ne '[===>                                    ]( 8.33%)\r';sleep 0.2" >> remove.sh
echo "echo -ne '[=========>                              ](16.66%)\r';sleep 0.2" >> remove.sh
echo "echo -ne '[============>                           ](24.99%)\r';sleep 0.2" >> remove.sh
echo "echo -ne '[===============>                        ](33.32%)\r';sleep 0.2" >> remove.sh
echo "echo -ne '[==================>                     ](41.65%)\r';sleep 0.2" >> remove.sh
echo "echo -ne '[=====================>                  ](49.98%)\r';sleep 0.2" >> remove.sh
echo "echo -ne '[========================>               ](58.31%)\r';sleep 0.2" >> remove.sh
echo "echo -ne '[===========================>            ](66.64%)\r';sleep 0.2" >> remove.sh
echo "echo -ne '[==============================>         ](74.97%)\r';sleep 0.2" >> remove.sh
echo "echo -ne '[=================================>      ](83.30%)\r';sleep 0.2" >> remove.sh
echo "echo -ne '[====================================>   ](91.64%)\r';sleep 0.2" >> remove.sh
echo "echo -ne '[=======================================>](100.00%)\r';sleep 0.2" >> remove.sh
echo "echo -ne '\n'" >> remove.sh
echo 'cd /' >> remove.sh
echo 'rm -rf /usr/share/applications/filezilla.desktop' >> remove.sh
echo 'rm -rf /usr/local/'$DIRINST'/filezilla3/' >> remove.sh
echo 'rm -rf /home/*/.cache/filezilla/' >> remove.sh
echo 'rm -rf /home/*/.config/filezilla/' >> remove.sh
echo "echo 'Completado!'" >> remove.sh
echo "echo '------------------------------'" >> remove.sh
echo 'exit' >> remove.sh
chmod 744 remove.sh
#
#README
touch README.txt
echo 'FileZilla' > README:txt
echo 'Idioma=es' >> README.txt
echo 'Version=3.32.0' >> README.txt
echo 'Arquitectura=x86_64' >> README.txt
echo 'Esta es una instalación no invasiva.' >> README.txt
echo 'Para desinstalar ejecute el fichero remove.sh como root.' >> README.txt
echo '' >> README.txt
echo 'https://filezilla-project.org/' >> README.txt
echo '' >> README.txt
echo 'xaxlm' >> README.txt
cd /
echo '------------------------------'
echo 'Limpiando...'
echo -ne '[===>                                    ]( 8.33%)\r';sleep 0.2
echo -ne '[=========>                              ](16.66%)\r';sleep 0.2
echo -ne '[============>                           ](24.99%)\r';sleep 0.2
echo -ne '[===============>                        ](33.32%)\r';sleep 0.2
echo -ne '[==================>                     ](41.65%)\r';sleep 0.2
echo -ne '[=====================>                  ](49.98%)\r';sleep 0.2
echo -ne '[========================>               ](58.31%)\r';sleep 0.2
echo -ne '[===========================>            ](66.64%)\r';sleep 0.2
echo -ne '[==============================>         ](74.97%)\r';sleep 0.2
echo -ne '[=================================>      ](83.30%)\r';sleep 0.2
echo -ne '[====================================>   ](91.64%)\r';sleep 0.2
echo -ne '[=======================================>](100.00%)\r';sleep 0.2
echo -ne '\n'
rm -rf /usr/local/libpng12-0_1.2.50-2+deb8u3_amd64.deb
rm -rf /usr/local/$DIRINST/FileZilla_3.32.0_x86_64-linux-gnu.tar.bz2
if [ -d /home/*/.cache/filezilla/ ];
	then
		rm -rf /home/*/.cache/filezilla/
		rm -rf /home/*/.config/filezilla/
	else
		:
fi
echo 'Completado!'
echo '------------------------------'
exit
