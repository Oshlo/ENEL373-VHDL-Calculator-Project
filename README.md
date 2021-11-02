# Calculator Project
> Adam Finlayson

**[Project Instructions](ENEL373_Fast_Calculator_Project_v0_2__2021.pdf)**

## TO DO LIST

1. Create some nested structure components so the code looks better
2. Start creating a register source file
	- Will probably be structural 
	- Need to create working flip flop source
	- Used to store a n bit number
	- Register should only read from the bus when 'read'/'load' is true
	- Register should only write to the bus when 'write'/'enable' is true
	- Ensure that only 1 register is outputting to the bus at one time
		- use 'tristate' buffers on the output of the registers
3. Start looking at the consturction of the ALU
	- need to use unsigned bits (used in subtraction)
	- how does the ALU 'talk' to the registers
4. Create a Binary to BCD converter
	- Double Dabble
	- will need to convert signeed to unsigned and back again
5. Think about what states the state machine will need to have
	- when will the registers need to communicate with the ALU
	- when will a we need to convert to two's complement
	- when will we need to load input from the swtiches to the registers
6. How do we display symbols other than numbers on the 7 segment displays (+,-,*,/ etc)
