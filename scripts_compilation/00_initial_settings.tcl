##############################################################
# Initial design settings
# Created by Juan Aguilera
# reference: https://github.com/abdelazeem201/ORCA
##############################################################
### design information
set design "top_risc"

### design data directory
set data_dir "../data"
file mkdir $data_dir

### nlib data dir
set nlib_dir "./${data_dir}/nlib"
file mkdir $nlib_dir

### library dir
set lib_dir "../library_sky"

### change all paths to absolute paths since some tools don't support relative paths
set lib_dir [file normalize $lib_dir]
set data_dir [file normalize $data_dir]
set nlib_dir [file normalize $nlib_dir]

### gate level netlist files
set import_netlists     ""
lappend import_netlists "${data_dir}/uniciclo.v"

### SDC files (to be added)
set import_sdc     ""
lappend import_sdc "${data_dir}/uniciclo.sdc"

### UPF files
set golden_upf "${data_dir}/upf_script.upf"

### tech files
set synopsys_tech_tf "${lib_dir}/skywater130_fd_sc_hd.tf"

### scandef
set scandef_file "${data_dir}/RISC_TOP.scandef"

### library files
set ndm_files ""
lappend ndm_files "${lib_dir}/ndm/sky130_fd_sc_hd.ndm"
lappend ndm_files "${lib_dir}/ndm/sram_32_32.ndm"

set lef_files ""
lappend lef_files "openram/sram_32_32_sky130A_TT_1p8V_25C.lib"

set icc2rc_tech(cmax)       "${lib_dir}/skywater130.nominal.tluplus"
set icc2rc_tech(cmin)       "${lib_dir}/skywater130.nominal.tluplus"
set icc2rc_tech(nominal)    "${lib_dir}/skywater130.nominal.tluplus"
set itf_tluplus_map         "${lib_dir}/skywater130.mw2itf.map"

### scenarios of each step

set default_scenarios  "func_ss0p75v125c_cmax"
set placeopt_scenarios "func_ss0p75v125c_cmax test_ss0p75v125c_cmax"
set clock_scenarios    "cts_ss0p75v125c_cmax"
set clockopt_scenarios "func_ss0p75v125c_cmax test_ss0p75v125c_cmax func_ff0p95vm40c_cmin test_ff0p95v125c_cmin"
set routeopt_scenarios "func_ss0p75v125c_cmax test_ss0p75v125c_cmax func_ff0p95vm40c_cmin test_ff0p95v125c_cmin"

set_app_var sh_continue_on_error true

##############################################################
# END
##############################################################