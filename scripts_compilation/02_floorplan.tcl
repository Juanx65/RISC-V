##############################################################
# Function: Create floorplan in ICC2
# Created by Juan Aguilera
# Reference: https://github.com/abdelazeem201/ORCA
##############################################################
source 00_initial_settings.tcl

#------------------------------------------
#  Variables
# -----------------------------------------
set current_step "02_icc2_floorplan"
set before_step  "01_icc2_import"

#------------------------------------------
#  Open database
# -----------------------------------------
file mkdir $nlib_dir
file delete -force $nlib_dir/${design}_${current_step}.nlib
copy_lib -from_lib ${nlib_dir}/${design}_${before_step}.nlib -to_lib ${nlib_dir}/${design}_${current_step}.nlib -force
current_lib ${design}_${current_step}.nlib

#------------------------------------------
#  Get blocks --all
# -----------------------------------------
open_block ${design}

#------------------------------------------
#  Initialize tool
# -----------------------------------------
source initialization_settings.tcl

#------------------------------------------
#  Create scenarios
# -----------------------------------------
set scenarios_list $default_scenarios
source scenarios_setup.tcl

#------------------------------------------
#  Floorplan
# -----------------------------------------
#initialize_floorplan -boundary {{0 0} {999.856 999.856}} -core_offset {0 2}
initialize_floorplan  -core_utilization 0.7 -core_offset {20}
shape_blocks

#------------------------------------------
#  Placement
# -----------------------------------------
create_placement -floorplan -timing_driven
legalize_placement 

#------------------------------------------
#  Pin I/O - MODIFY the pins as required
# -----------------------------------------
set_block_pin_constraints -self -allowed_layers {met2 met3}
place_pins -self

#------------------------------------------
#  Power Routing
# -----------------------------------------
source -echo pns.tcl

### connect pg
connect_pg_net -automatic

# -----------------------------------------
#  Route
# -----------------------------------------
route_auto
#clock_opt
#route_auto -max_detail_route_iterations 5
#save_block $library_name:$top_module
write_gds -hier all "..reports/top_risc.gds"


### save design
save_block -force
save_lib

### exit icc2
print_message_info
#quit!
##############################################################
# END
##############################################################