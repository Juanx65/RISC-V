### initialization settings for icc2
## time unit needs to match with SDC
set_user_units -type time -value 1ns

set_attribute [get_site_defs unit] symmetry Y
set_attribute [get_site_defs unit] is_default true

### what if this is not set
#set_attribute [get_layers {met1 met3 met5}] routing_direction horizontal
#set_attribute [get_layers {met2 met4 li1}] routing_direction vertical
#get_attribute [get_layers M?] routing_direction

set_ignored_layers -min_routing_layer met1 -max_routing_layer met5
set_message_info -id LGL-003 -limit 10