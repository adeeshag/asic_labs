# Compilation File for Modelsim

vlog xor_design.vp
vlog -sv test_xor_all_directed_checker.sv
#vlog -sv test_xor.sv

#Simulate the test module
vsim -novopt test_xor

log -r /*

# ADD Wave

add wave -noupdate -radix binary /test_xor/clk
add wave -noupdate -radix binary /test_xor/reset
add wave -noupdate -radix binary /test_xor/A
add wave -noupdate -radix binary /test_xor/B
add wave -noupdate -radix binary /test_xor/Y
add wave -noupdate -radix binary /test_xor/golden_ref_output


# run the simulation
run 100000ns

stop


