// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press. 
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

@8191
D=A
@n
M=D 

(LISTEN)
@KBD
D=M
@WHITE
D;JEQ
@BLACK
0;JMP

(BLACK)
    @q
    D=M
    @LISTEN
    D;JGT
    @q
    M=-1
    @COLOR
    0;JMP

(WHITE)
    @q
    D=M
    @LISTEN
    D;JEQ
    @q
    M=0

(COLOR)
    @SCREEN
    D=A
    @addr
    M=D 

    @0
    D=A
    @w
    M=D 


    @i
    M=0  

    
(LOOP)
    @i
    D=M
    @n
    D=D-M
    @OUTLOOP
    D;JGT  

    @q
    D=M
    @addr
    A=M
    M=D 
            
    @i
    M=M+1   
    @addr
    M=M+1
    @LOOP
    0;JMP

(OUTLOOP)
    @LISTEN
    0;JMP
