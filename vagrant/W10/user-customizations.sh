#!/bin/zsh

USER="Carlos Guzman"
EMAIL="cags84@gmail"

# Cambiar la zona a America/Bogota
sudo timedatectl set-timezone America/Bogota

# Instalamos locales
sudo apt-get -y install language-pack-es language-pack-es-base locales
sudo sed -i 's/^# *\(es_CO.UTF-8\)/\1/' /etc/locale.gen
sudo sed -i 's/^# *\(en_US.UTF-8\)/\1/' /etc/locale.gen
sudo sh -c "echo 'LC_ALL=es_CO.UTF-8\nLANG=es_CO.UTF-8\nLANGUAGE=es_CO.UTF-8' > /etc/default/locale"

# Configure locales
sudo locale-gen es_CO.UTF-8

#
cd
sudo apt-get -y install neovim git wget curl nano htop vlan traceroute zsh unzip rar unrar p7zip-full p7zip-rar
git config --global user.name "${USER}"
git config --global user.email "${EMAIL}"

# Instalamos las fuentes mas amables para trabajar en programación.
cd
sudo apt-get -y install fonts-cascadia-code fonts-firacode fontconfig unzip acl zip vlan traceroute
mkdir ~/.fonts
cd ~/.fonts 
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf
fc-cache -f -v


# Agregamos el plugin que nos color a la terminal si ha sido agregado anteriormente
echo "\n"
if [ ! -d '/home/vagrant/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting' ]; then
	cd ~/.oh-my-zsh/custom/plugins
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
	echo "source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
else
	if grep -w "zsh-syntax-highlighting.zsh" ~/.zshrc; then
		echo "Plugin zsh-syntax-highlighting ya configurado......"
	else
		echo "source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
	fi
fi

# Agregar el plugin al archivo de `~/.zshrc`
# nano -w ~/.zshrc
# plugins=(git zsh-autosuggestions)
echo "\n"
if grep -w "zsh-autosuggestions" ~/.zshrc; then
	echo "Plugin zsh-autosuggestions ya configurado......"
else
	sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions)/' ~/.zshrc
fi

sleep 1

source ~/.zshrc
echo "\n"
echo "Terminamos la personalización"
echo "\n"
echo "Recuerda la siguiente informacion, para las bases de datos y otros servicios:"
echo "User: homestead"
echo "Password: secret"
echo "\n"
echo "Ejecuta vagrant ssh para ingresar al servidor"
