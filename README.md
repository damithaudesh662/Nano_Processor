# Nano_Processor Lab
In this lab, we will design a 4-bit processor capable of executing 4 instructions. After
completing the lab, you will be able to:
    >design and develop a 4-bit arithmetic unit that can add and subtract signed integers
    >decode instructions to activate necessary components on the processor
    >design and develop k-way b-bit multiplexers or tri-state busses
    >verify their functionality via simulation and on the development board(Basys3)

# Introduction
We will design a very simple microprocessor (hence, called a nanoprocessor) capable of
executing a simple set of instructions.

# Assembly Programme
0. MOVI R7 , 1 ; R7 <= 1
1. MOVI R6 , 2 ; R6 <= 2
2. ADD R7 , R6 ; R7 <= R7 + R6
3. MOVI R6 , 3 ; R6 <= 3
4. ADD R7 , R6 ; R7 <= R7 + R6
5. MOVI R1 , 0 ; R1 <= 0
6. JZR R1 , 0 ; If R1 = 0 jump line 0
7. ADD R0 , R0 ; R0 <= R0 + R0
   
# Specific Instructions
When you load the bitstream file

Reset Button : U18
R7_out will be displayed via U16,E19,U19,V19 LEDs
seven segment display ports will be W7,W6,U8,V8,U5,V5,U7

         Operations

        1.First Store 1
        2.Then store 2
        3.Then add 1 and 2
        4.Next store 3
        5.Add output of 3rd instruction and 3
---------------------------------------------------------------------------------
Expected:
 	
>Displays 0 , 1 , 3, 6 
