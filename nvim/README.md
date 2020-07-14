# Docfiles para neovim - vim

Esta guía tiene como objetivo guardar mis memorias para proximas instalaciones y configuraciones de estas herramientas en los diferentes sistemas operativos en los cuales trabajo, espero le sirva a otras personas para mejorar su flujo de trabajo.

En este caso se trata de la configuración de nvim un fork de vim con superpoderes, en el cual activamos algunos plugins necesarios y "casi" obligatorios, tales como nerdtree, entre otros.

Primero debemos asegurarnos que tenemos el directorio ~/.config/nvim, en caso de no ternerlo, procederemos a crearlo.

```shell
> cd ~
> git clone https://github.com/cags84/dotfiles.git
> mkdir -p ~/.config/nvim/
> cp dotfiles/nvim/init.vim ~/.config/nvim/
```

## Fedora 32

Una vez instalado correctamente fedora, es hora de actualizar e instalar neovim

Actualizamos el sistema.

```shell
> sudo dnf update
```

Instalamos neovim

```shell
> sudo dnf install -y neovim python3-neovim 
```

Instalamos el manejador de paquetes para nvim plug.

```shell
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

Abrimos nvim y ejecutamos en modo comandos esc :pluginstall, esperamos a que se complete y con ello tendremos instalado nvim con los plugin y configuraciones necesarias para poder trabajar.
 
