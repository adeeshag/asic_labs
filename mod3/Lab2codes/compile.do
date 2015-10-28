# Compilation File for Modelsim

vlog -sv test_arbiter.sv
vlog arbiter.vp
vlog arb_if.sv
vlog top.sv
vsim -novopt top
#log -r /*
run -all
$stop


