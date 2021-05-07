#!/bin/zsh

USER="Carlos Guzmán"
EMAIL="cags84@gmail.com"

# Cambiar la zona a America/Bogota
echo "\n"
echo "Configurar timezone"
sudo timedatectl set-timezone America/Bogota

# Instalamos locales
sudo apt-get -y install language-pack-es language-pack-es-base locales
echo "\n"
echo "Configurando locales ....."
if (! grep -w "es_CO.UTF-8" /etc/default/locale); then
	sudo sed -i 's/^# *\(es_CO.UTF-8\)/\1/' /etc/locale.gen
	sudo sed -i 's/^# *\(en_US.UTF-8\)/\1/' /etc/locale.gen
	sudo sh -c "echo 'LC_ALL=es_CO.UTF-8\nLANG=es_CO.UTF-8\nLANGUAGE=es_CO.UTF-8' > /etc/default/locale"
	# Configure locales
	sudo locale-gen es_CO.UTF-8	
else
	echo "Locales ya esta configurado..."
fi

# Instalamos herramientas necesarias
echo "\n"
sudo apt-get -y install neovim git wget curl nano htop vlan unzip rar unrar p7zip-full p7zip-rar
git config --global user.name "${USER}"
git config --global user.email "${EMAIL}"

# Instalamos las fuentes mas amables para trabajar en programación.
echo "\n"
sudo apt-get -y install fonts-cascadia-code fonts-firacode fontconfig unzip acl zip vlan

# Instalamos las fuentes mesloLGS para las ligraduras
echo "\n"
cd

if [[ ! -d '~/.fonts' ]]; then
	mkdir -p ~/.fonts
fi

cd ~/.fonts 

if [[ -f "/home/vagrant/.fonts/MesloLGS NF Regular.ttf" ]]; then
	echo "La fuente ya esta instalada"
else
	wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
fi

if [[ -f "/home/vagrant/.fonts/MesloLGS NF Bold.ttf" ]]; then
	echo "La fuente ya esta instalada"
else
	wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
fi

if [[ -f "/home/vagrant/.fonts/MesloLGS NF Italic.ttf" ]]; then
	echo "La fuente ya esta instalada"
else
	wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
fi

if [[ -f "/home/vagrant/.fonts/MesloLGS NF Bold Italic.ttf" ]]; then
	echo "La fuente ya esta instalada"
else
	wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf
fi

# Cargamos las fuentes.
echo "\n"
sleep 1
fc-cache -f -v


# Agregamos el plugin que nos color a la terminal si ha sido agregado anteriormente
echo "\n"
echo "Instalando Plugin zsh-syntax-highlighting ..............."
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
echo "Instalando Plugin zsh-autosuggestions ..............."
if [ ! -d '/home/vagrant/.oh-my-zsh/custom/plugins/zsh-autosuggestions' ]; then
	cd ~/.oh-my-zsh/custom/plugins
	git clone https://github.com/zsh-users/zsh-autosuggestions
fi

if grep -w "zsh-autosuggestions" ~/.zshrc; then
	echo "Plugin zsh-autosuggestions ya configurado......"
else
	sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions)/' ~/.zshrc
fi

# Creamos los alias
echo "\n"
echo "Creando Alias......"
echo alias gits=\"git status\" >> ~/.zshrc
echo alias gitl=\"git log --oneline --decorate --graph\" >> ~/.zshrc
echo alias gitb=\"git branch --all\" >> ~/.zshrc
echo alias gitf=\"git fetch --all\" >> ~/.zshrc

# Recargamos la configuración realizada
echo "\n"
echo "Recargando la configuración....."
sleep 2
source ~/.zshrc

# Imprimir información informativa
echo "\n"
echo "Terminamos la personalización"
echo "\n"
echo "Recuerda la siguiente informacion, para las bases de datos y otros servicios:"
echo "User: homestead"
echo "Password: secret"
echo "\n"
echo "Ejecuta vagrant ssh para ingresar al servidor"
