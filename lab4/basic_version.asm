//1.Draw the paddle with height 3 pixel and width 3 world at the bottom left corner of the screen
@3
D=A
@height
M=D
@24544
D=A
(DRAW)
@paddleAddr
M=D
(LOOP1)
@paddleAddr
A=M
M=-1
A=A+1
M=-1
A=A+1
M=-1
@paddleAddr
D=M
@32
D=D-A
@paddleAddr
M=D
@height
MD=M-1
@LOOP1
D;JGT



//2.Move the paddle ONE word to the right (no key pressed)
(RIGHT)
@3
D=A
@height
M=D
@24544
D=A
@paddleAddr
M=D
(LOOP2)
@paddleAddr
AD=M
M=0
@3
D=D+A
A=D
M=-1
@paddleAddr
D=M
@32
D=D-A
@paddleAddr
M=D
@height
MD=M-1
@LOOP2
D;JGT

//3.Move the paddle ONE word to the left (no key pressed)
@3
D=A
@height
M=D
@24545
D=A
@paddleAddr
M=D
(LOOP3)
@paddleAddr
A=M
D=A-1
A=D
M=-1
@3
D=D+A
A=D
M=0
@paddleAddr
D=M
@32
D=D-A
@paddleAddr
M=D
@height
MD=M-1
@LOOP3
D;JGT



(END)
@END
0;JMP


//4.Move the paddle ONE word to the right (then stop) if the right arrow is pressed

@KBD
D=M
@132
D=D-A
@RIGHT
D;JEQ
@STAY
0;JMP
(RIGHT)
@currentPaddleAddr
M=M+1
@STAY
