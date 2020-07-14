# Docfiles para neovim - vim

Esta guía tiene como objetivo guardar mis memorias para proximas instalaciones y configuraciones de estas herramientas en los diferentes sistemas operativos en los cuales trabajo, espero le sirva a otras personas para mejorar su flujo de trabajo.

En este caso se trata de la configuración de nvim un fork de vim con superpoderes, en el cual activamos algunos plugins necesarios y "casi" obligatorios, tales como nerdtree, entre otros.

Primero debemos asegurarnos que tenemos el directorio ~/.config/nvim, en caso de no ternerlo, procederemos a crearlo.

```shell
> mkdir -p ~/.config/nvim/
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
