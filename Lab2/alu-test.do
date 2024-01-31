vsim alu
add wave -position insertpoint sim:/alu/*

# Test for unsigned addition 
force -freeze sim:/alu/operation 4'h0 0
force -freeze sim:/alu/operand1 32'h000000ff 0
force -freeze sim:/alu/operand2 32'h00000015 0
run
# Show that overflow returns proper error
force -freeze sim:/alu/operand1 32'hffffffff 0
force -freeze sim:/alu/operand2 32'h00000001 0
run
pause
# Test for unsigned subtraction
resume
force -freeze sim:/alu/operand1 32'h000000ff 0
force -freeze sim:/alu/operand2 32'h00000001 0
force -freeze sim:/alu/operation 4'h1 0
run

# Show that negative overflow returns proper error
force -freeze sim:/alu/operand1 32'h00000000 0
force -freeze sim:/alu/operand2 32'hffffffff 0
run
pause

# Test for signed addition
force -freeze sim:/alu/operand1 32'hffffffff 0
force -freeze sim:/alu/operand2 32'h00000001 0
force -freeze sim:/alu/operation 4'h2 0
run
# Show that operation returns proper overflow
force -freeze sim:/alu/operand1 32'h7fffffff 0
force -freeze sim:/alu/operand2 32'h0000000f 0
run
pause
# Test for signed subtraction
force -freeze sim:/alu/operand1 32'h00000000 0
force -freeze sim:/alu/operand2 32'h00000001 0
force -freeze sim:/alu/operation 4'h3 0
run

# Show that operation returns proper overflow
force -freeze sim:/alu/operand1 32'h7fffffff 0
force -freeze sim:/alu/operand2 32'h80000000 0
run
pause

# Test for signed multiplication
force -freeze sim:/alu/operand1 32'h00000003 0
force -freeze sim:/alu/operand2 32'h00000005 0
force -freeze sim:/alu/operation 4'h4 0
run
# Show proper error
force -freeze sim:/alu/operand1 32'h80000000 0
force -freeze sim:/alu/operand2 32'h7fffffff 0
run
pause
# Test for signed division
force -freeze sim:/alu/operand1 32'h00000004 0
force -freeze sim:/alu/operand2 32'h00000002 0
force -freeze sim:/alu/operation 4'h5 0
run
# Show proper error
force -freeze sim:/alu/operand1 32'h80000000 0
force -freeze sim:/alu/operand2 32'h00000000 0
run
pause

# Test for Bitwise AND
force -freeze sim:/alu/operand1 32'h10101010 0
force -freeze sim:/alu/operand2 32'h01010101 0
force -freeze sim:/alu/operation 4'h7 0
run
pause


# Test for Bitwise OR
force -freeze sim:/alu/operand1 32'hf0f0f0f0 0
force -freeze sim:/alu/operand2 32'h0f0f0f0f 0
force -freeze sim:/alu/operation 4'h9 0
run
pause

# Test for Logical NOT
force -freeze sim:/alu/operand1 32'h00000000 0
force -freeze sim:/alu/operation 4'ha 0
run
pause

# Test for Bitwise NOT
force -freeze sim:/alu/operand1 32'hf0f0f0f0 0
force -freeze sim:/alu/operation 4'hb 0
run
pause

# Test for passing operand1
force -freeze sim:/alu/operation 4'hc 0
run
pause

# Test for passing operand2
force -freeze sim:/alu/operation 4'hd 0
run
pause

# Test for output all 0's
force -freeze sim:/alu/operation 4'he 0
run
pause

# Test for output all 1's
force -freeze sim:/alu/operation 4'hf 0
run
