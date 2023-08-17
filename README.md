
# Implementation of a RISC-V processor using the Synopsys Digital Design Flow
Here is the updated index for your README.md:

## Table of Contents
0. [Synopsys Digital Design Flow](#synopsys-digital-design-flow)
1. [Specification](#specification)
2. [RTL: Cell description coding](#rtl-cell-description-coding)
3. [Console: Syntax Check](#console-syntax-check)
4. [VCS: Logic simulation](#vcs-logic-simulation)
5. [Logic Synthesis](#logic-synthesis)
6. [Formal Verification](#formal-verification)
7. [Pre-Layout STA (Prime Time)](#pre-layout-sta-prime-time)
8. [Floorplanning, placement & Routing](#floorplanning-placement-routing)
9. [Physical Verification](#physical-verification)
10. [Post-Layout STA (Prime Time)](#post-layout-sta-prime-time)
11. [Finished Design](#finished-design)
12. [Extra - RVSCC by MARIO](#extra-rvscc-by-mario)
    - [RTL](#rtl)
    - [Logic Simulation](#logic-simulation)
    - [Logic Synthesis](#logic-synthesis)
    - [Floorplan](#floorplan)
13. [Extra - Windows 10/11 Synopsys Server Connection](#extra---windows-1011-synopsys-server-connection)
    - [MobaXterm Connection](#mobaxterm-connection)
    - [RSA Key Generation - Needed for SSH Connection with VSC](#rsa-key-generation---needed-for-ssh-connection-with-vsc)
    - [Save RSA Public Key at Synopsys Server](#save-rsa-public-key-at-synopsys-server)
    - [Install and run Xlaunch](#install-and-run-xlaunch)
    - [VSCode SSH connection](#vscode-ssh-connection)
14. [References](#references)

## Synopsys Digital Design Flow 
The Digital Design Flow is the following

<div align="center">
      <a href="">
     <img
      src="img_readme/flujo.png"
      alt="flujo de diseño Synopsys"
      style="width:70%;">
      </a>
</div>


## Specification

Design of a RISC-V processor. Implementation of an RV32I processor with a five-stage pipeline.

--- 

Diseño de un procesador RISC-V. Implementación de procesador RV32I con pipeline de cinco etapas:

Implementar un procesador RISC-V sencillo. En este caso el desafío no estaría tanto en el diseño en si, ya que hay varios que han implementado y verificado sus propias versiones de procesador en HDL. La idea es que teniendo un código base medianamente probado, el esfuerzo se enfoque en documentar el flujo de diseño en las capas más bajas de la implementación. El ya tener un RISC-V como base abre las puertas para posteriores proyectos que integren diversos periféricos. 

No se plantea el uso de FPGAs como un objetivo de los proyectos que desarrollaran los estudiantes. Se mencionaron las FPGAs en el contexto de que todos los participantes tienen experiencia en distintos grados en el flujo de diseño para FPGAs (algunos bien avanzados), por lo que la idea es justamente que extrapolen esa experiencia en las etapas de síntesis para preparar una actividad que muestre el flujo de diseño para un ASIC.


## RTL: Cell description coding

* Tests for a simple ALU, an adder, and other descriptions can be found in the `test_code` folder, with the aim of testing the design flow preliminarily.

* The description of a unicycle processor for testing the design flow can be found in the `Unicycle` folder.

* It is expected later to have a folder with the description of the RV32I processor.

## Console: Syntax Check

The command `vlogan <file(s)> -full64 –sverilog +v2k` gives a syntax error in the simulation part using SystemVerilog, so we opted for the following command:

``` 
vcs -sverilog -parse_only <archivo(s)>
```

Which checks the syntax and does not generate the simulation file `\sim` typical of the `vcs` command.

## VCS: Logic simulation
 
To start a simulation we run in the console the following command:

```
vcs -sverilog -debug -cpp -gcc -R -gui <achivo(s)>
```

Where `-R` runs the simulation (which should be added to the files as a testbench) immediately after compilation.

Other options for the VCS command are:

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

If you want to run the simulation without running vcs again, you can do it using the following command:

``` 
./simv <options> 
```

Where you may use the following options:


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

--- 

obs:

Make sure to download the skywater library, for this, we have all the files you might need here: `https://drive.google.com/drive/folders/1yW7nUxN1jMjz_ce_J53yK2rmMj6R_uhI?usp=sharing`. Add the content to the `sky130_fd_sc_hd` folder.

---

Run the Makefile that runs the `logic_synthesis.tcl` script in the `logic_synthesis` folder.

``` 
cd logic_synthesis
make
``` 

As a result, it displays information in the console, as well as data regarding timing, area, power, etc in the `logic_synthesis/report` folder.

To clean all the log files, and maintain the reports, do a `make clean`.

--- 

Pending tasks
- Verify the results of the logic synthesis for the Unicycle or another simple description, especially the reported WNS.

## Formal Verification

For formal verification we use the formality tool.
It is important to check if you have access to this, as with the prime time tool, for this make sure that the following lines are found in `.bashrc` at the synopsys server:

```
PATH=/home/SynopsysSoftware/fm/R-2020.09-SP5/bin:$PATH     
PATH=/home/SynopsysSoftware/prime/R-2020.09-SP5-3/bin:$PATH
```

Once we have access to the tool, we can start the gui in the console with the following command:

```
formality
```

In the gui we follow the following steps:

* Cargar el RTL en la pestaña `1. Ref`:
<div align="center">
      <a href="">
     <img
      src="img_readme/ref.gif"
      alt="flujo de diseño Synopsys"
      style="width:70%;">
      </a>
</div>

* Cargar la Netlist resultante de la sintesis logica en los pasos anteriores en `2. Impl.`:

<div align="center">
      <a href="">
     <img
      src="img_readme/impl.gif"
      alt="flujo de diseño Synopsys"
      style="width:70%;">
      </a>
</div>

* Match y Verificacion:

<div align="center">
      <a href="">
     <img
      src="img_readme/verify.gif"
      alt="flujo de diseño Synopsys"
      style="width:70%;">
      </a>
</div>


 --- 
 obs: 
 - For now, there are some WARNINGS regarding the unicicle's imem and dmem code, so the tutorial is based on a simple alu.
 - In the Overleaf there is some instructions in how to make the formal verification without GUI.
 --- 
Status:   Elaborating design imem   ...  
Warning: Index may take values outside array bound, may cause simulation mismatch .. (Signal: RAM Block: /imem File: /home/usuario12/RISC-V/Uniciclo/imem.sv Line: 9)  (FMR_ELAB-147)
Status:   Elaborating design dmem   ...  
Warning: Index may take values outside array bound, may cause simulation mismatch .. (Signal: RAM Block: /dmem File: /home/usuario12/RISC-V/Uniciclo/dmem.sv Line: 8)  (FMR_ELAB-147)



## Pre-Layour STA ( Prime Time )

Text

## Floorplanning, placement & Routing

### Floorplan:

Run using the Makefile in the `icc2` folder, that runs the `icc2_test.tcl` script. 

```
cd icc2
make
```

To clean all the log files, do a `make clean`.

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

--- 

# Extra - RVSCC by MARIO

## RTL

You can find the RTL in the `rvscc` folder.
You can find the source code here: `https://git.1159.cl/Mario1159/RVSCC`

## Logic Simulation

To run the logic simulation use the following:

```
vcs -sverilog -debug -cpp -gcc -R -gui timescale.sv rv32i_defs.sv test_five_stage_pipeline_core.sv alu_decoder.sv alu.sv cache_memory.sv control_unit.sv data_memory_if.sv data_memory.sv five_stage_pipeline_datapath.sv hazard_unit.sv imm_extend.sv instr_memory_if.sv instr_memory.sv jump_control.sv main_decoder.sv pipelined_control_unit.sv priority_encoder.sv register_file.sv
```

Note, if you want to run the Testbench `rvscc/test_five_staged_pipeline_core.sv` of this project, you need to uncomment the following static functions:

* check_fw_test_core_assertions in `rvscc/data_memmory_if.sv` in line 28.
* next_instr in `rvscc/instr_memory_if.sv` in line 15.

## Logic Synthesis

Note that you need to comment all the static functions for the synthesis to run.

you might run the code in `logic_synthesis` folder, remember to the analyze and elaborate options in the first lines of `logic_synthesis/logic_synthesis.tcl` as follows:

```
analyze -format sverilog {../rvscc/timescale.sv ../rvscc/rv32i_defs.sv ../rvscc/alu_decoder.sv ../rvscc/alu.sv ../rvscc/cache_memory.sv ../rvscc/control_unit.sv ../rvscc/data_memory_if.sv ../rvscc/data_memory.sv ../rvscc/five_stage_pipeline_datapath.sv ../rvscc/hazard_unit.sv ../rvscc/imm_extend.sv ../rvscc/instr_memory_if.sv ../rvscc/instr_memory.sv ../rvscc/jump_control.sv ../rvscc/main_decoder.sv ../rvscc/pipelined_control_unit.sv ../rvscc/priority_encoder.sv ../rvscc/register_file.sv}
elaborate five_stage_pipeline_datapath
```

Change the name of the reports as needed, as example, in line 67:
```
## Save Design
write_file -format ddc -hierarchy -out report/rvscc.ddc
write_file -format verilog -hierarchy -out report/rvscc.v
write_sdc report/rvscc.sdc
```

Then you can use `make` in the terminal, being inside the `logic_synthesis` folder, and it will save the reports for the followings steps of the design in the `logic_synthesis/report` folder.

## Floorplan

Use the scripts in scripts_compilation as always...


---

# EXTRA - WINDOWS 10/11 SYNOPSYS SERVER CONNECTION


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

* Five Stage Pipeline RISC-V by Mario - RVSCC: `https://git.1159.cl/Mario1159/RVSCC`



--- 

# INTENTOS REUNION

* VSS y VDD ahora son inout.

* No hay errores en la sintesis.

* Creamos el power ring con estos comandos

``` 
create_pg_ring_pattern ring_pattern -horizontal_layer met1 -horizontal_width {0.48} -horizontal_spacing {0.24} -vertical_layer met2 -vertical_width {0.48} -vertical_spacing {0.24}
set_pg_strategy core_ring -pattern {{name: ring_pattern} {nets: {VPWR VGND}} {offset: {3 3}}} -core
compile_pg -strategies core_ring 

```

No se conecta a los rieles creados anteriormente con este comando

```
create_pg_std_cell_conn_pattern rail_pattern -layer met1 
set_pg_strategy M1_rails -core -pattern {{name : rail_pattern}{nets: VPWR VGND}}
set_app_options -name plan.pgroute.ignore_signal_route -value true 
compile_pg -strategies M1_rails

```

* hacemos el placement de todos los piens con este comando

```
place_pins -self -ports [get_ports *]
```

pd: al usar `get_ports VSS` o VDD si existe, por lo que el comando si deberia tomarlos para hacer el placement.

* Intentamos crear voltage area con comando 
```
create_voltage_area -power_domains TOP -region {{5 5} {70 48}} -power VPWR -ground VGND -name VA1
```
No funciono en el flujo, pero si dentro de la gui.
 

* Intentamos rutear la red de power (luego de crear la VA)

```
route_group -nets VPWR
```

      Information: Routes in non-preferred voltage areas = 0 (ZRT-559)

  No funciono.

* Intentamos usar el comando `create_secondary_pg_placement_constraints -name pg_cstr0 -supply VPWR -voltage_areas DEFAULT_VA -region {{0 115} {0 75}}` sin resultados.

 `Error: Supply 'VPWR' is domain primary of voltage area 'DEFAULT_VA'. (MV-252)`


