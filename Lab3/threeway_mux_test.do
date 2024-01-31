vsim threeway_mux
add wave -position end sim:/threeway_mux/input_2
add wave -position end sim:/threeway_mux/input_1
add wave -position end sim:/threeway_mux/input_0
add wave -position end sim:/threeway_mux/which
add wave -position end sim:/threeway_mux/output

force -freeze sim:/threeway_mux/input_2 32'h12345678 0
force -freeze sim:/threeway_mux/input_1 32'hABCDEF01 0
force -freeze sim:/threeway_mux/input_0 32'h87654321 0
force -freeze sim:/threeway_mux/which "00" 0
run

force -freeze sim:/threeway_mux/which "01" 0
run

force -freeze sim:/threeway_mux/input_2 32'h11111111 0
force -freeze sim:/threeway_mux/input_1 32'h22222222 0
force -freeze sim:/threeway_mux/input_0 32'h33333333 0
force -freeze sim:/threeway_mux/which "10" 0
run