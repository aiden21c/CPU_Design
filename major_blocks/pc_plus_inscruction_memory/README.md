# Instructions for Use
- Each memory address is addressed by an 8 bit unsigned integer. This means there are a total of 256 addresses
- Each address holds a 24-bit value. This means that to increment the program counter to the next address, the PC simply needs to be incremented by a value of 0x01
- The specific path to the ROM01.mif file must be specified in the instruction_memory module
- The pc_func[1..0] input has the following truth table:
    - pc_func[1] = PCWrite
    - pc_func[0] = PCSrc

| pc_func[1] | pc_func[0] | Action |
| --- | --- | --- |
| 0 | 0 | PC = PC |
| 1 | 0 | PC = PC | 
| 0 | 1 | PC = PC + k |
| 1 | 1 | PC = IMM |


