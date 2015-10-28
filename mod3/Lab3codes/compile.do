# Compilation File for Modelsim

vlog -sv test_arbiter.sv
vlog arbiter.vp
vlog arbiter_interface.sv
vlog top.sv
vsim -novopt top
add wave sim:/top/arbif/*
#log -r /*
run -all
$stop


