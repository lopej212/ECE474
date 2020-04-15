#!/bin/bash
vlog clock.sv
vlog decoder.sv
vlog mux.sv
vlog states.sv
vlog tb.sv

vsim -novopt tb

# if [ -s syn_clock ] ; then
# dc_shell-xg-t -f syn_clock
# echo "********dc_shell-xg-t -f syn_clock"
# fi
#
# vlog clock.gate.v
#
#
# grep -q AND4X2.v work/_info
# if [ $? -eq 0 ] ; then
#   echo "--> compiled cells found in work directory <--"
# else
#   echo "--> compiled cells not found, compiling cell library<---"
#   vlog /nfs/guille/a1/cadlibs/synop_lib/SAED_EDK90nm/Digital_Standard_Cell_Library/verilog/*.v
# fi
#
# vsim  -novopt tb
