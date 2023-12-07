# Single port
num_rw_ports = 1
num_r_ports = 0
num_w_ports = 0
num_spare_rows = 1
num_spare_cols = 1

word_size = 32
num_words = 32
num_banks = 1
words_per_row = 1
write_size = 8 # Bits

#ports_human = '1rw'
#human_byte_size = "{:.0f}kbytes".format((word_size * num_words)/1024/8)

tech_name = "sky130A"
process_corners = ["TT"]
supply_voltages = [ 1.8 ]
temperatures    = [25] #[ 100 ]

route_supplies  = True
check_lvsdrc = True

output_path = "temp"
output_name = "sram_{0}_{1}_{2}".format(word_size,num_words,tech_name)
instance_name = "sram_{0}_{1}_{2}".format(word_size,num_words,tech_name)
