# Compilation File for Modelsim

vlog xor_design.vp
vlog -sv test_xor_few_directed.sv


#Simulate the test module
vsim -novopt test_xor

log -r /*

# ADD Wave

add wave -noupdate -radix binary /test_xor/clk
add wave -noupdate -radix binary /test_xor/reset
add wave -noupdate -radix binary /test_xor/A
add wave -noupdate -radix binary /test_xor/B
add wave -noupdate -radix binary /test_xor/Y
#add wave -noupdate -radix binary /test_xor/golden_ref_output

add wave -noupdate -radix binary /test_xor/u0_xordesign/clk
add wave -noupdate -radix binary /test_xor/u0_xordesign/reset
add wave -noupdate -radix binary /test_xor/u0_xordesign/a
add wave -noupdate -radix binary /test_xor/u0_xordesign/b
add wave -noupdate -radix binary /test_xor/u0_xordesign/y

# run the simulation
run 1000ns

stop


