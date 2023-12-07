
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
		{ {horizontal_layer: met4} {width: 2} {spacing: interleaving} {pitch: 14} {offset: 0} {trim : true} } \
		{ {vertical_layer: met5}   {width: 2} {spacing: interleaving} {pitch: 14} {offset: 0} {trim : true} } \
		} \
	-via_rule { {intersection: adjacent}}

set_pg_strategy default_vdd_vss \
	-core \
	-pattern   { {name: std_mesh} {nets:{VSS VDD}} } \
	-extension { {{stop:design_boundary_and_generate_pin}} }

# se hace una mesh adicional que conecte los rienes en M1 con el resto del circuito pg
create_pg_mesh_pattern met2_mesh \
	-layers { \
		{ {vertical_layer: met2} {track_alignment : track}{width: 0.5}{spacing: interleaving}{pitch: 8}{offset: 0} {trim : true} } }

set_pg_strategy met2_vddvss \
	-core \
	-pattern   { {name: met2_mesh} {nets: {VDD VSS}} } \
	-extension { {{direction:BT} {stop:design_boundary_and_generate_pin}} }

compile_pg -strategies {met2_vddvss default_vdd_vss}

#-----------------------------------------
# Build rings around the macros then connect them
#-----------------------------------------
suppress_message PGR-599

create_pg_ring_pattern ring_pattern -horizontal_layer met4 -horizontal_width {1} -vertical_layer met5 -vertical_width {1} -corner_bridge false
set_pg_strategy core_ring -pattern {{name: ring_pattern} {nets: {VDD VSS}} {offset: {0.3 0.3}}} -core
compile_pg -strategies core_ring

#-----------------------------------------
# Build the standard cell rails
#-----------------------------------------
# aun no entiendo porque los rieles M1 no se conectan a los anillos :c sera porque son met4 met5?
create_pg_std_cell_conn_pattern std_cell_rail

set_pg_strategy std_cell_rail_VSS_VDD \
	-core \
	-pattern {{pattern: std_cell_rail}{nets: {VSS VDD}}} \
	-extension {{stop: outermost_ring}{direction: L B R T }}

set_pg_strategy_via_rule via_stdcellrail \
        -via_rule {{intersection: adjacent}{via_master: default}}

compile_pg -strategies {std_cell_rail_VSS_VDD} -via_rule {via_stdcellrail}

return