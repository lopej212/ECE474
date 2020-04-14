#!/bin/bash
for listfile in 'ls.*list'
do
  rm Rf $listfiles
    echo "--> deleting listfile $listfiles <--"
done
if [ ! -d work ] ; then
echo work directory does not exist, making it
vlib work
fi
if [ -s mult.sv ] ; then
echo "********vlog mult.sv"
vlog mult.sv
sleep 2
fi
if [ -s mult.do ] ; then
echo "********** vsim mult -do mult.do -t 1ps quiet -c"
vsim -novopt mult -do mult.do -quiet -c
sleep 2
fi
if [ -s syn_mult ] ; then
dc_shell-xg-t -f syn_mult
echo "********dc_shell-xg-t -f syn_mult"
mv mult.list mult.golden.list
sleep 2 #sleep 2 seconds
fi

grep -q AND4X2.v work/_info
if [ $? -eq 0 ] ; then
  echo "--> compiled cells found in work directory <--"
else
  echo "--> compiled cells not found, compiling cell library<---"
  vlog_cells
fi

if [ -s mult.gate.v ] ; then
vlog mult.gate.v
echo "******vlog.gate.v"
vsim -novopt mult -do mult2.do -quiet -c
echo "****** mult -do mul.do -quit -c"
fi

diff mult.golden.list mult.list >| diff_report
if [ ! -s "diff_report" ] ; then
  echo "Horray it works!"
else
  echo "It is broken"
fi
