# Compilation File for Modelsim

vlog -sv test_memory.sv
vlog memory.vp
vsim -novopt test_memory
#log -r /*
run -all
#add wave -noupdate -radix binary /test_memory/clk
#add wave -noupdate -radix binary /test_memory/reset
#add wave -noupdate -radix binary /test_memory/A
#add wave -noupdate -radix binary /test_memory/B
#add wave -noupdate -radix binary /test_memory/Y
#add wave -noupdate -radix binary /test_memory/golden_ref_output
$stop


