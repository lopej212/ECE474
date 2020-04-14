force a_in 10#19
force b_in 10#21
add list -nodelta
configure list -strobestart {99 ns} -strobeperiod {100 ns}
configure list -usestrobe 1
add list -notrigger -hex -width 12 -label a_in a_in
add list -notrigger -hex -width 12 -label b_in b_in
add list -notrigger -hex -width 12 -label mult_product mult_product
add list -notrigger -hex -width 12 -label reset
add list -notrigger -hex -width 12 -label start
add list -notrigger -hex -width 12 -label done
add list -notrigger -hex -width 12 -label product
add list -notrigger -hex -width 12 -label multiplicand_reg
add list -notrigger -hex -width 12 -label counter_reg
add list -notrigger -hex -width 12 -label present_state
add list -notrigger -hex -width 12 -label next_state
add wave -position insertpoint  \
sim:/mult/a_in \
sim:/mult/b_in \
sim:/mult/clk \
sim:/mult/reset \
sim:/mult/start \
sim:/mult/done \
sim:/mult/product \
sim:/mult/multiplicand_reg \
sim:/mult/mult_product \
sim:/mult/present_state \
sim:/mult/next_state
force -freeze sim:/mult/clk 1 0, 0 {50 ps} -r 100
force reset 0
force start 0
run 200
run 50
force reset 1
run 100
run 50
force reset 0
force start 1
run 100
force start 0
run 500
run 100000
write list mult.list
quit -f
