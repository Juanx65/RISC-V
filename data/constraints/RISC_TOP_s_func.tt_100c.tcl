
set_clock_uncertainty -setup 0.2 [get_clocks *]
set_clock_uncertainty -hold  0.1 [get_clocks *]

set real_clocks [remove_from_collection [get_clocks] [get_clocks *]]

set_clock_transition 0.2 $real_clocks