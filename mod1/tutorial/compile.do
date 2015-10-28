# Compilation File for Modelsim

vlog xor_design.v
vlog -sv test_xor_design.sv


#Simulate the test module
vsim -novopt test_xor

log -r /*

# ADD Wave

add wave -noupdate -radix hexadecimal /test_xor/clk
add wave -noupdate -radix hexadecimal /test_xor/reset
add wave -noupdate -radix hexadecimal /test_xor/A
add wave -noupdate -radix hexadecimal /test_xor/B
add wave -noupdate -radix hexadecimal /test_xor/Y
#add wave -noupdate -radix hexadecimal /test_xor/golden_ref_output

add wave -noupdate -radix hexadecimal /test_xor/u0_xordesign/clk
add wave -noupdate -radix hexadecimal /test_xor/u0_xordesign/reset
add wave -noupdate -radix hexadecimal /test_xor/u0_xordesign/a
add wave -noupdate -radix hexadecimal /test_xor/u0_xordesign/b
add wave -noupdate -radix hexadecimal /test_xor/u0_xordesign/y

# run the simulation
run 500ns

stop


