##############################################################
# Function: Create power ground shapes and vias in ICC2
# Created by Ahmed Abdelazeem
##############################################################
source 00_common_initial_settings.tcl

### variables
set current_step "03_icc2_pgrouting"
set before_step  "02_icc2_floorplan"

### open database
file mkdir $nlib_dir
file delete -force $nlib_dir/${design}_${current_step}.nlib
copy_lib -from_lib ${nlib_dir}/${design}_${before_step}.nlib -to_lib ${nlib_dir}/${design}_${current_step}.nlib -force
current_lib ${design}_${current_step}.nlib
open_block ${design}

### initialize tool
source initialization_settings.tcl

### create scenarios
set scenarios_list $default_scenarios
source scenarios_setup.tcl

### connect pg
connect_pg_net -automatic

### remove all pg regions
remove_pg_regions -all

### remove power settings
remove_pg_patterns -all
remove_pg_strategies -all
remove_pg_via_master_rules -all
remove_pg_strategy_via_rules -all

### remove all pg routes
remove_routes -net_types {power ground} -ring -stripe -macro_pin_connect -lib_cell_pin_connect

### create pg regions for all macros
remove_pg_regions -all
set macros_col [get_cells -physical_context -filter "is_hard_macro==true" -quiet]
set memory_risc [get_cells -filter "is_hard_macro==true" -physical_context *REG_FILE_*_RAM*]
set memory_top  [remove_from_collection $macros_col $memory_risc]
set region_cnt 0
foreach_in_col _macro $memory_top {
    set macro_bbox [get_att ${_macro} bbox] ;# check the difference between boundary bbox and bbxo
    create_pg_region -polygon $macro_bbox MEMORY_REGION_TOP_${region_cnt}
    incr region_cnt
}
set region_cnt 0
foreach_in_col _macro $memory_risc {
    set macro_bbox [get_att ${_macro} bbox] ;# check the difference between boundary bbox and bbxo
    create_pg_region -polygon $macro_bbox MEMORY_REGION_RISC_${region_cnt}
    incr region_cnt
}

### create basic patterns
## rail pattern
create_pg_std_cell_conn_pattern pattern_pg_rail -layers M1 -rail_width {@w} -parameters {w}
## stripe pattern with 5 parameters
create_pg_wire_pattern pattern_stripe -layer @l -direction @d -width @w -spacing @s -pitch @p -track_alignment @t -parameters {l d w s p t} 
## wire based pattern with 5 parameters
create_pg_wire_pattern pattern_wire_based_on_track -layer @l -direction @d -width @w -spacing @s -pitch @p -parameters {l d w s p} -track_alignment track 

### create pg rails strategies : check rails at keepout boundary
set_pg_strategy strategy_pg_rail_top -pattern "{name: pattern_pg_rail} {nets: VDD VSS} {parameters: 0.06}" -blockage {{macros_with_keepout: $macros_col} {placement_blockages: all}} -voltage_areas DEFAULT_VA
compile_pg -strategies {strategy_pg_rail_top strategy_pg_rail_risc} -tag pg_rail

### create power stripes strategies
create_pg_composite_pattern pattern_core_m6_mesh_top -nets {VDD VSS} -add_patterns {{{pattern: pattern_wire_based_on_track} {nets: {VDD VSS}} {parameters: {M6 vertical   0.224 0.112 6.72 }}{offset: 0.1 }}} 
create_pg_composite_pattern pattern_core_m7_mesh_top -nets {VDD VSS} -add_patterns {{{pattern: pattern_wire_based_on_track} {nets: {VDD VSS}} {parameters: {M7 horizontal 0.224 0.112 6.72 }}{offset: 0.1 }}} 
create_pg_composite_pattern pattern_core_m8_mesh_top -nets {VDD VSS} -add_patterns {{{pattern: pattern_wire_based_on_track} {nets: {VDD VSS}} {parameters: {M8 vertical   0.224 0.112 6.72 }}{offset: 0.1 }}} 

set memory_regions_top [get_pg_regions MEMORY_REGION_TOP_* -quiet]
set_pg_strategy strategy_m6_pg_mesh_top -pattern {{name: pattern_core_m6_mesh_top} {nets: {VDD VSS}}} -blockage {pg_regions: $memory_regions_top} -voltage_areas DEFAULT_VA
set_pg_strategy strategy_m7_pg_mesh_top -pattern {{name: pattern_core_m7_mesh_top} {nets: {VDD VSS}}} -blockage {pg_regions: $memory_regions_top} -voltage_areas DEFAULT_VA
set_pg_strategy strategy_m8_pg_mesh_top -pattern {{name: pattern_core_m8_mesh_top} {nets: {VDD VSS}}} -blockage {pg_regions: $memory_regions_top} -voltage_areas DEFAULT_VA

### create via rules stripes
#set_pg_via_master_rule pgvia_array_8x10 -via_array_dimension {8 10}
set_pg_strategy_via_rule via_pg_core -via_rule { \
{{{strategies: strategy_m9_pg_mesh}{layers: M9}}{{strategies: strategy_m8_pg_mesh_top}{layers: M8}}{via_master:default} } \
{{{strategies: strategy_m9_pg_mesh}{layers: M9}}{{strategies: strategy_m8_pg_mesh_risc}{layers: M8}}{via_master:default} } \
{{{strategies: strategy_m8_pg_mesh_top}{layers: M8}}{{strategies: strategy_m7_pg_mesh_top}{layers: M7}}{via_master:default} } \
{{{strategies: strategy_m8_pg_mesh_risc}{layers: M8}}{{strategies: strategy_m7_pg_mesh_risc}{layers: M7}}{via_master:default} } \
{{{strategies: strategy_m7_pg_mesh_top}{layers: M7}}{{strategies: strategy_m6_pg_mesh_top}{layers: M6}}{via_master:default} } \
{{{strategies: strategy_m7_pg_mesh_risc}{layers: M7}}{{strategies: strategy_m6_pg_mesh_risc}{layers: M6}}{via_master:default} } \
{{{existing : std_conn }}{{strategies: strategy_m6_pg_mesh_top}{layers: M6}}{via_master:default} } \
{{{existing : std_conn }}{{strategies: strategy_m6_pg_mesh_risc}{layers: M6}}{via_master:default} } \
{{intersection: adjacent}{via_master: default}} } 

#compile_pg -strategies {strategy_m6_pg_mesh} -tag pg_stripes -via_rule {via_pg_core} -ignore_via_drc
compile_pg -strategies {strategy_m6_pg_mesh_top strategy_m6_pg_mesh_risc strategy_m7_pg_mesh_top strategy_m7_pg_mesh_risc strategy_m8_pg_mesh_top strategy_m8_pg_mesh_risc strategy_m9_pg_mesh} -tag pg_stripes -via_rule {via_pg_core} -ignore_via_drc

### create macro ring and pin connection
create_pg_ring_pattern pattern_memory_ring -horizontal_layer M5 -horizontal_width {1} -vertical_layer M6 -vertical_width {1} -corner_bridge false
set_pg_strategy strategy_memory_ring_top  -macros $memory_top -pattern { {pattern: pattern_memory_ring} {nets: {VSS VDD}}  {offset: {0.3 0.3}} }
set_pg_strategy_via_rule strategy_memory_ring_vias -via_rule { \
    {{{strategies: {strategy_memory_ring_top strategy_memory_ring_risc}} {layers: {M5}}} {existing: {strap }}{via_master: {default}}} \
    {{{strategies: {strategy_memory_ring_top strategy_memory_ring_risc}} {layers: {M6}}} {existing: {strap }}{via_master: {default}}} \
}
compile_pg -strategies {strategy_memory_ring_top strategy_memory_ring_risc} -via_rule {strategy_memory_ring_vias}

### connect macro pins
create_pg_macro_conn_pattern pattern_memory_pin -pin_conn_type scattered_pin -layers {M5 M6}
set_pg_strategy strategy_top_pins -macros $memory_top -pattern { {pattern: pattern_memory_pin} {nets: {VSS VDD}} }
compile_pg -strategies {strategy_top_pins strategy_risc_pins}

### save design
save_block -force
save_lib

### exit icc2
print_message_info
quit!

##############################################################
# END
##############################################################
