# Datos para la configuración de Vagrant

##  Situarse en el directore C:

```sh
cd c:\
```

## Clonar el repositorio

```sh
git clone https://github.com/laravel/homestead.git Homestead
```

## Ingresar al direcorio

```sh
cd Homestead
```

## Nos cambiamos de rama

```sh
git checkout release
```

## Inicializamos vagrant

```sh
.\init.bat
```

## Modificamos la configuración

- Reemplazamos el contenido de los archivo `Homestead.yaml`, con el del repositorio.
- Creamos el archivo `user-customizations.sh` y agregamos al información como esta en el repositorio.

## Creamos la carpeta donde vamos a guardar el código, se recomienda que sea en una carpeta diferente donde esta Homestead

```sh
cd C:\
mkdir Code
```

## Ahora corremos la maquina, para ello debemos estar en la carpeta C:\Homestead

```sh
cd C:\
cd Homestead
vagrant up
```

## Si hacen cambios despues de creada la maquina, deben ejecutar algunos de estos comandos.

```sh
cd C:\
cd Homestead
vagrant up --provision # Si la maquina no esta encendida
vagrant reload --provision # Si la maquina esta encendida
```

## Podemos para la maquina con el siguiente comando

```sh
cd C:\
cd Homestead
vagrant halt
```

## Para eliminar la maquina corremos

```sh
cd C:\
cd Homestead
vagrant destroy
```