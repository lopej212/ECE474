add wave -position insertpoint sim:/clock/*

#force -freeze sim:/clock/clk_1sec 1 0, 0 {500000000000} -r 1000000000000
#force -freeze sim:/clock/clk_1ms 1 0, 0  {500000000} -r 1000000000

force -freeze sim:/clock/clk_1sec 1 0, 0 {5000} -r 10000
force -freeze sim:/clock/clk_1ms 1 0, 0 {5} -r 10

force mil_time 0
run 100
force reset_n 0
run 100
force reset_n 1
run 500000000000
force mil_time 1
run 50000000000
