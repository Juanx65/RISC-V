##############################################################
# Initial design settings
# Created by Juan Aguilera
# reference: https://github.com/abdelazeem201/ORCA
##############################################################
### design information
set design "RISC_TOP"

### design data directory
set data_dir "../logic_synthesis/report"
file mkdir $data_dir

### nlib data dir
set nlib_dir "./${data_dir}/nlib"
file mkdir $nlib_dir

### library dir
set lib_dir "../sky130_fd_sc_hd"

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
#set scandef_file "${data_dir}/ORCA_TOP.scandef"

### library files
set ndm_files ""
lappend ndm_files "${lib_dir}/ndm/sky130_fd_sc_hd.ndm"

#set lef_files ""
#lappend lef_files "${lib_dir}/lef/saed32sram.lef"
#lappend lef_files "${lib_dir}/lef/saed32nm_hvt_1p9m.lef"
#lappend lef_files "${lib_dir}/lef/saed32nm_lvt_1p9m.lef"
#lappend lef_files "${lib_dir}/lef/saed32nm_rvt_1p9m.lef"

#set icc2rc_tech(cmax)       "${lib_dir}/tech/tluplus/saed32nm_1p9m_Cmax.tluplus"
#set icc2rc_tech(cmin)       "${lib_dir}/tech/tluplus/saed32nm_1p9m_Cmin.tluplus"
set icc2rc_tech(nominal)    "${lib_dir}/skywater130.nominal.tluplus"
set itf_tluplus_map         "${lib_dir}/skywater130.mw2itf.map"

### scenarios of each step
#set default_scenarios  "func_ss0p75v125c_cmax"
#set placeopt_scenarios "func_ss0p75v125c_cmax test_ss0p75v125c_cmax"
#set clock_scenarios    "cts_ss0p75v125c_cmax"
#set clockopt_scenarios "func_ss0p75v125c_cmax test_ss0p75v125c_cmax func_ff0p95vm40c_cmin test_ff0p95v125c_cmin"
#set routeopt_scenarios "func_ss0p75v125c_cmax test_ss0p75v125c_cmax func_ff0p95vm40c_cmin test_ff0p95v125c_cmin"

### cells type settings
#set fillers_ref     "*/SHFILL128_HVT */SHFILL64_HVT */SHFILL3_HVT */SHFILL2_HVT */SHFILL1_HVT"
#set endcap_left     "*/SHFILL2_HVT"
#set endcap_right    "*/SHFILL2_HVT"
#set endcap_top      "*/SHFILL3_HVT */SHFILL2_HVT */SHFILL1_HVT"
#set endcap_bottom   "*/SHFILL3_HVT */SHFILL2_HVT */SHFILL1_HVT"
#set tapcell_ref     "*/SHFILL3_HVT"
#set holdfix_ref     "*/DELLN1X2_HVT */DELLN1X2_RVT */DELLN3X2_HVT */NBUFFX2_HVT */NBUFFX2_LVT */NBUFFX2_RVT */NBUFFX4_HVT */NBUFFX8_HVT"

set_app_var sh_continue_on_error true

##############################################################
# END
##############################################################