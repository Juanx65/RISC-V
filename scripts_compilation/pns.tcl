
remove_pg_strategies -all
remove_pg_patterns -all
remove_pg_regions -all
remove_pg_via_master_rules -all
remove_pg_strategy_via_rules -all
remove_routes -net_types {power ground} -ring -stripe -macro_pin_connect -lib_cell_pin_connect > /dev/null

connect_pg_net

#set_pg_via_master_rule pgvia_8x10 -via_array_dimension {8 10}


#-----------------------------------------
# MESH
#-----------------------------------------
create_pg_mesh_pattern std_mesh \
	-layers { \
		{ {horizontal_layer: M7} {width: 1.104} {spacing: interleaving} {pitch: 13.376} {offset: 0.856} {trim : true} } \
		{ {vertical_layer: M8}   {width: 4.64 } {spacing: interleaving} {pitch: 19.456} {offset: 6.08}  {trim : true} } \
		} \
	-via_rule { {intersection: adjacent}}

set_pg_strategy default_vdd_vss \
	-core \
	-pattern   { {name: std_mesh} {nets:{VSS VDD}} } \
	-extension { {{stop:design_boundary_and_generate_pin}} }

compile_pg -strategies {default_vdd_vss}

create_pg_mesh_pattern M2_mesh \
	-layers { \
		{ {vertical_layer: M2}  {track_alignment : track} {width: 0.44 0.192 0.192} {spacing: 2 3} {pitch: 9} {offset: 1} {trim : true} } }

set_pg_strategy m2_vddvss \
	-core \
	-pattern   { {name: M2_mesh} {nets: {VDD VSS VSS}} {offset_start: {2 0}} } \
	-extension { {{direction:BT} {stop:design_boundary_and_generate_pin}} }

################################################################################
# Build rings around the macros then connect them
suppress_message PGR-599

create_pg_ring_pattern ring_pattern -horizontal_layer M7 -horizontal_width {1} -vertical_layer M8 -vertical_width {1} -corner_bridge false
set_pg_strategy core_ring -pattern {{name: ring_pattern} {nets: {VDD VSS}} {offset: {0.3 0.3}}} -core
compile_pg -strategies core_ring

################################################################################
# Build the standard cell rails

create_pg_std_cell_conn_pattern rail_pattern
set_pg_strategy std_cell_rail \
    -core \
    -pattern {{name : rail_pattern}{nets: VDD VSS}}  \
    -extension {{stop: outermost_ring}{direction: L B R T }}
compile_pg -strategies std_cell_rail



