do wave.do

run 20

#undefined opcode-----
#output: 0
force in_a 16#04
force in_b 16#00
force opcode 16#00
run 20

# addition------
#output: 0x0A
force in_a 16#05
force in_b 16#05
force opcode 16#01
run 20

#addition w carry-----
#output: 0x100
force in_a 16#FF
force in_b 16#01
force opcode 16#01
run 20

#subtraction-----
#output: 0xF
force in_a 16#14
force in_b 16#05
force opcode 16#02
run 20


#increment by 1-----
#output; 0xA
force in_a 16#09
force in_b 16#XX
force opcode 16#03
run 20


#increment by 1 w/ carry-----
#output:0x100
force in_a 16#FF
force in_b 16#XX
force opcode 16#03
run 20


#decrement by 1-----
#output: 0x14
force in_a 16#15
force in_b 16#xx
force opcode 16#04
run 20

#OR-----
#output: 0xB
force in_a 16#0A
force in_b 16#09
force opcode 16#05
run 20

#AND-----
#output: 0x3
force in_a 16#07
force in_b 16#0B
force opcode 16#06
run 20

#XOR -----
#output: 0x1
force in_a 16#F0
force in_b 16#F1
force opcode 16#07
run 20

#shift right-----
#output: 0x3F
force in_a 16#7F
force in_b 16#XX
force opcode 16#08
run 20

#shift left by one w carry-----
#output: 0x180
force in_a 16#C0
force in_b 16#XX
force opcode 16#09
run 20

#1's comp-----
#output 0x95 (149)
force in_a 16#6A
force in_b 16#XX
force opcode 16#0A
run 20

#2's comp-----
force in_a 16#25
force in_b 16#XX
force opcode 16#0B
run 20
#output: 0xDB (DB)
