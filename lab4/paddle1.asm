// init of a paddle game
//set the bottom of the paddle's  initial location to left corner of the screen 
@24544  
D=A
@currentArr
M=D

//set the top of the ball's location
@16400   
D=A
@currentBallArr
M=D
@withball
M=0
	
(STAY)
//draw a paddle at the left cornor of the screen with given address named currentArr
@3
D=A
@height
M=D
@currentArr
D=M
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

@TIMER
M=0
//listen to the key event
@EVENT
0;JMP

//move to one word right
(RIGHT)
@3
D=A
@height
M=D
@currentArr
D=M
@paddleAddr
M=D-1
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

@TIMER
M=0
//listen to the key event
@EVENT
0;JMP

//3.Move the paddle ONE word to the left
(LEFT)
@3
D=A
@height
M=D
@currentArr
D=M
@paddleAddr
M=D+1
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

@TIMER
M=0
@EVENT
0;JMP

//listen to the key event
(EVENT)
// dalay loop for slow down the paddle moving
@TIMER
M=M+1
D=M
@5000
D=D-A
@EVENT
D;JLT

//if there is a ball run ballmove else run noball
@withball
D=M-1
@NOBALL
D;JNE
(BALLMOVE)
//move ball one pixel down
@currentBallArr
D=M
@ballAddr
M=D
@32
D=D-A
A=D
M=0                            
@512
D=A
@ballAddr
M=M+D
A=M
M=-1

//change the ball position for next move
@32
D=A
@currentBallArr
M=M+D



(NOBALL)
//if key left is pressed
@KBD
D=M
@130
D=D-A
@CANMOVELEFT
D;JEQ

//if key right is pressed
@KBD
D=M
@132
D=D-A
@CANMOVERIGHT
D;JEQ

//if key down is pressed
@KBD
D=M
@133
D=D-A
@BALL
D;JEQ


@currentBallArr
D=M
@24070
D=D-A
@GAMEOVER
D;JGT


@STAY
0;JMP

//this will tell right func move right with one word
(MOVER)
@currentArr
M=M+1
@RIGHT
0;JMP

//this will tell left func move left with one word
(MOVEL)
@currentArr
M=M-1
@LEFT
0;JMP

// this will test the condition for right moving
(CANMOVERIGHT)
@currentArr
D=M
@24573
D=D-A
@MOVER
D;JLT
@STAY
0;JMP

// this will test the condition for left moving
(CANMOVELEFT)
@currentArr
D=M
@24544
D=D-A
@MOVEL
D;JGT
@STAY
0;JMP


//draw a ball with a length of 16 pixels
(BALL)
@withball
M=1
@16
D=A
@ballheight
M=D
@currentBallArr
D=M
@ballArr
M=D
(LOOPDBALL)
@ballArr
A=M
M=-1
@ballArr
D=M
@32
D=D+A
@ballArr
M=D
@ballheight
MD=M-1
@LOOPDBALL
D;JGT
@STAY
0;JMP

(GAMEOVER)
//ball disappears
@32
D=A
@currentBallArr
M=M-D
@17
D=A
@ballheight
M=D
@currentBallArr
D=M
@ballArr
M=D
(LOOPCBALL)
@ballArr
A=M
M=0
@ballArr
D=M
@32
D=D+A
@ballArr
M=D
@ballheight
MD=M-1
@LOOPCBALL
D;JGT
(END)
	@END
	0;JMP