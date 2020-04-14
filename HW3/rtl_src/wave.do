onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Literal -radix hexadecimal /mult/in_a
add wave -noupdate -format Literal -radix hexadecimal /mult/in_b
add wave -noupdate -format Literal -radix hexadecimal /mult/clk
add wave -noupdate -format Literal -radix hexadecimal /mult/reset
add wave -noupdate -format Literal -radix hexadecimal /mult/start
add wave -noupdate -format Literal -radix hexadecimal /mult/done
add wave -noupdate -format Literal -radix hexadecimal /mult/product
add wave -noupdate -format Literal -radix hexadecimal /mult/multiplicand_reg
add wave -noupdate -format Literal -radix hexadecimal /mult/mult_product
add wave -noupdate -format Literal -radix hexadecimal /mult/counter_reg
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
update
WaveRestoreZoom {0 ns} {119 ns}
