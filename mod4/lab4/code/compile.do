# Compilation File for Modelsim

vlog -sv test_execute.sv
vlog execute.v
vsim -novopt test_execute
#log -r /*
run -all
$stop


