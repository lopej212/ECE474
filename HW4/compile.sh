#!/bin/bash
vlog fifo.sv
vlog tb.sv
vsim tb

if [ -s syn_fifo ] ; then
dc_shell-xg-t -f syn_fifo
echo "********dc_shell-xg-t -f syn_mult"
fi

vlog fifo.gate.v


grep -q AND4X2.v work/_info
if [ $? -eq 0 ] ; then
  echo "--> compiled cells found in work directory <--"
else
  echo "--> compiled cells not found, compiling cell library<---"
  vlog /nfs/guille/a1/cadlibs/synop_lib/SAED_EDK90nm/Digital_Standard_Cell_Library/verilog/*.v
fi


vsim tb

a2ps fifo.sv -o fifo.ps
