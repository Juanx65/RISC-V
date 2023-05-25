# Implementation of a RISC-V proccessor using the Synopsys Digital Design Flow

The Digital Design Flow is the following:

<div align="center">
      <a href="">
     <img
      src="img_readme/flujo.png"
      alt="flujo de diseño Synopsys"
      style="width:70%;">
      </a>
</div>


## Specification

Diseño de un procesador RISC-V. Implementación de procesador RV32I con pipeline de cinco etapas:

Implementar un procesador RISC-V sencillo. En este caso el desafío no estaría tanto en el diseño en si, ya que hay varios que han implementado y verificado sus propias versiones de procesador en HDL. La idea es que teniendo un código base medianamente probado, el esfuerzo se enfoque en documentar el flujo de diseño en las capas más bajas de la implementación. El ya tener un RISC-V como base abre las puertas para posteriores proyectos que integren diversos periféricos. 

No se plantea el uso de FPGAs como un objetivo de los proyectos que desarrollaran los estudiantes. Se mencionaron las FPGAs en el contexto de que todos los participantes tienen experiencia en distintos grados en el flujo de diseño para FPGAs (algunos bien avanzados), por lo que la idea es justamente que extrapolen esa experiencia en las etapas de síntesis para preparar una actividad que muestre el flujo de diseño para un ASIC.


## RTL: Cell description coding

* Pruebas para una ALU simple, un sumador y otras descripciones se encuentran en la carpeta `test_code`, con el objetivo de probar el flujo de disennio en forma preeliminar.

* La descripcion de un procesador uniciclo para pruebas del flujo de disennio se encuentran en la carpeta `Uniciclo`.

* Se espera mas adelante tener una carpeta con la descripcion del procesador RV32I.

## Consola: Syntax Check

Usando el comando `vlogan <archivo(s)> -full64 –sverilog +v2k` me tira un error de sintaxis en la parte de simulación usando SystemVerilog, por lo que opte por este comando:

``` 
vcs -sverilog -parse_only <archivo(s)>
```

El cual revisa la sintaxis y no genera el archivo de simulación `\sim` propio del comando `vcs`.

## VCS: Logic simulation
 
Para correr una simulación corremos en consola:

```
vcs -sverilog -debug -cpp -gcc -R -gui <achivo(s)>
```
Donde `-R` corre la simulación (que debe añadirse en los archivos como un testbench) inmediatamente despues de la compilación.

otras opciones para el comando VCS son:

|Opciones de vcs   |                                            |
|------------------|--------------------------------------------|
| -debug           | Enable debug capabilities                  |
| -debug_all       | Enable source-line debugging               |
| -debug_pp        | Debug post-processing                      |
| -gui             | Start DVE after compilation finishes       |
| +define <macro>  | Defines macro in the verilog source        |
| -l <logfile>     | Create log file                            |
| -o <sim_name>    | Rename simulation executable               |
| -ucli            | Enable Tcl command-line interface          |
| -R               | Run simulation immediately after compile   |
| -cm <options>    | Enable coverage options                    |

Si deseas correr la simulación sin volver a correr vcs, puedes hacerlo usando el siguiente comando:

``` 
./simv <options> 
```

donde las opciones disponibles son:


|Opciones de ./simv|                                            |
|-----------------|---------------------------------------------|
| -ucli           | Stop at Tcl prompt upon start-up            |
| -i <run.tcl>    | Execute specified Tcl script upon start-up  |
| -l <logfile>    | Create runtime logfile                      |
| -gui            | Start interactive GUI session               |
| -xlrm           | Allows relaxed/non-LRM compliant code       |
| -cm <options>   | Enable coverage options                     |
| -cm_name        | Give name to the test (default is test)     |

## Logic Synthesis

Usamos el archivo `logic_synthesis.tcl` que se encarga de todo.

Falta especificar:
- area maxima
- fanout
- set_max_transition
por ahora se usaron datos de prueba.

El archivo `logic_synthesis.tcl` se corre con el siguiente comando:

``` 
dc_shell -f logic_synthesis.tcl
``` 

Y como resultado despliega información en consola, así como datos respecto al timing, area, power, etc en la carpeta `report`.

Pendientes
- verificar los resultados de la sintesis logica para el Uniciclo u otra descripcion simple, en especial WNS reportado.

## Formal Verification

Para la verificación formal usamos la herramienta formality.
Es importante revisar si se tiene acceso a esta, al igual que con la herramienta de prime time, para esto asegurarse de que en `.bashrc` se encuentren las siguientes lineas:

```
PATH=/home/SynopsysSoftware/fm/R-2020.09-SP5/bin:$PATH     
PATH=/home/SynopsysSoftware/prime/R-2020.09-SP5-3/bin:$PATH
```

Una vez contamos con acceso a la herramienta, podemos iniciar la gui en consola con el siguiente comando:

```
formality
```

En la gui seguimos los siguientes pasos:

* Cargar el RTL en la pestaña `1. Ref`:
![Vivado Project IP.](img_readme/ref.gif)

* Cargar la Netlist resultante de la sintesis logica en los pasos anteriores en `2. Impl.`:
![Vivado Project IP.](img_readme/impl.gif)

* Match y Verificacion:
![Vivado Project IP.](img_readme/verify.gif)


 --- 
 obs: por ahora hay unos WARNINGS respecto al codigo de imem y dmem del uniciclo, por lo que el tutorial esta hecho en base a una alu simple.
 --- 
Status:   Elaborating design imem   ...  
Warning: Index may take values outside array bound, may cause simulation mismatch .. (Signal: RAM Block: /imem File: /home/usuario12/RISC-V/Uniciclo/imem.sv Line: 9)  (FMR_ELAB-147)
Status:   Elaborating design dmem   ...  
Warning: Index may take values outside array bound, may cause simulation mismatch .. (Signal: RAM Block: /dmem File: /home/usuario12/RISC-V/Uniciclo/dmem.sv Line: 8)  (FMR_ELAB-147)



## Pre-Layour STA ( Prime Time )

Text

## Floorplanning, placement & Routing

### Floorplan:

Correr en la consola el siguiente comando (sigue en construccion): 

```
icc2_shell -gui -f icc2_test.tcl
```

---

obs: Por el momento tenemos los siguientes problemas:

* icc2: no se pueden hacer operaciones de optmizacion como place_opt, clock_opt ni route_opt.
* icc2: no existen los pines de salida de vcc ni vdd, no sabemos porque.
* formality: No es posible setear el top del codigo de uniciclo, error de index may take values oustide array bound en dmem e imem

## Physical Verification

Text

## Post-Layout STA ( Prime Time )

Text

## Finished Design

Text

# EXTRAS - WINDOWS 10/11 SYNOPSYS SERVER CONNECTION


## MobaXterm Connection

* algun dia lo explico si es necesario para ser auto contenido...


## RSA Key Generation - Needed for SSH Connection with VSC

* Open cmd and type `ssh-keygen -t rsa -b 2048`
* If it's your first time generating a key, you can use the default file to save the key
* passphrase can be let empty
* now the public and private key are (usually) saved at `C:\Users\<user_name>\.ssh\`


## Save RSA Public Key at Synopsys Server

* Enter the server (using your username and password given) 
* once there, go to the `.ssh` folder and create the `authorized_keys` file, open it and paste the content of the `id_rsa.pub` created earlier


## Install and run Xlaunch

* Install VcXsrv Windows X Server (`https://sourceforge.net/projects/vcxsrv/`)
* run it with default options

## VSCode SSH connection

* Install `Remote -SSH`, `Remote X11` and `Remote X11 (SSH)` extension in VSC
* Open command palette > Remote-SSH: Open SSH Configuration File.. > .../.ssh/config
* Edit it as follows:

      Host synopsys.elo.utfsm.cl
            HostName synopsys.elo.utfsm.cl
            Port 22
            User usuarioXX
            IdentityFile C:\Users\<user_name>\.ssh\id_rsa
            ForwardAgent yes
            ForwardX11 yes
            ForwardX11Trusted yes
            XAuthLocation "C:\Program Files\VcXsrv\xauth.exe"
* In VSC `Settings`, be sure that `Remote X11.SSH: Private Key` is set as the `IdentityFile` from the previous step

*  In VSC `Settings`, be sure to have `Remote X11.SSH: XAuth Permission Level` as `trusted` 

<div align="center">
      <a href="">
     <img
      src="img_readme/ssh-comfig.png"
      alt="configuracion rsa key vsc settings"
      style="width:75%;">
      </a>
</div>

* In VSC `Settings` be sure to have `Remote X11.SHH: Enable` selected.

<div align="center">
      <a href="">
     <img
      src="img_readme/x11_enabled.png"
      alt="enable x11"
      style="width:40%;">
      </a>
</div>


# References

* VSC X11 SSG connection: `https://github.com/microsoft/vscode-remote-release/issues/4600#issuecomment-791332086`
* RSA key generation and linking to VSC: `https://www.youtube.com/watch?v=PDVnUErS_us`

* Formality tutorial: `https://www.youtube.com/watch?v=CFRqPnqifx0`

* ICC tutorial: `https://www.youtube.com/watch?v=BQxG3jzcifg`
