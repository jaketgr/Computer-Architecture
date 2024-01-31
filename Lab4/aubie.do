vsim aubie
add wave -position insertpoint sim:/aubie/*
add wave -position insertpoint sim:/aubie/aubie_regfile/reg_file_process/registers
add wave -position insertpoint sim:/aubie/aubie_memory/mem_behav/data_memory

force -freeze sim:/aubie/aubie_clock 0 0, 1 {100 ns} -repeat {200 ns}

run 6500 ns