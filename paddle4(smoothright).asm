// init of a paddle game
//set the bottom of the paddle initial location to left corner of the screen 
@24544  
D=A
@currentArr
M=D
@pixels
M=1
//set direction of ball to false
@up
M=0
//set the top of the ball's lRocation
@16400   
D=A
@currentBallArr
M=D
@withball
M=0	
//draw a paddle at the left cornor of the screen with given address named currentArr
(STAY)
@3
D=A
@height
M=D
@currentArr
D=M
@paddleAddr
M=D
(LOOP1)
@pixels
D=M
@paddleAddr
A=M
M=-D
A=A+1
M=-1
A=A+1
M=-1
A=A+1
M=D-1
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
//move the paddle one pixel to the right
(RIGHT)
@3
D=A
@height
M=D
@currentArr
D=M
@paddleAddr
M=D
(LOOP2)
@paddleAddr
A=M-1
M=0
@pixels
D=M
@paddleAddr
A=M
M=-D
@3
D=A
@paddleAddr
M=M+D
@pixels
D=M-1
@paddleAddr
A=M
M=D
@3
D=A
@paddleAddr
D=M-D
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
@3
D=A
@height
M=D
@currentArr
D=M
@paddleLAddr
M=D+1
(LOOP3)
@paddleLAddr
A=M
D=A-1
A=D
M=-1
@3
D=D+A
A=D
M=0
@paddleLAddr
D=M
@32
D=D-A
@paddleLAddr
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

@1000   // time delay time delay time delay time delay time delay
D=D-A
@EVENT
D;JLT

//if there is a ball run ballmove else run noball
@withball
D=M-1
@NOBALL
D;JNE

@up
D=M-1
@GOUP
D;JEQ

//move ball one pixel down
@currentBallArr
D=M
@ballAddr
M=D
@32
D=D-A
A=D
M=0                            
@256
D=A
@ballAddr
M=M+D
A=M
D=-D
M=D

//change the ball position for next move
@32
D=A
@currentBallArr
M=M+D
@NOBALL
0;JMP

(GOUP)
//move ball one pixel up
@currentBallArr
D=M
@ballUpAddr
M=D

@256
D=A
@ballUpAddr
A=M
D=-D
M=D 
                         
@256
D=A
@ballUpAddr
M=M+D
A=M
M=0

//change the ball position for next move
@32
D=A
@currentBallArr
M=M-D

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




// ball touches the bottom
@currentBallArr
D=M
@24287
D=D-A
@GAMEOVER
D;JGT
@currentBallArr
D=M
@24256
D=D-A
@REACHTOP
D;JLT
@currentArr
D=M
@24558
D=D-A
@STAY
D;JLT
@currentArr
D=M
@24560
D=D-A
@STAY
D;JGT
@up
M=1




@TIMER
M=0
@STAY
0;JMP

(REACHTOP)
@currentBallArr
D=M
@16400
D=D-A
@STAY
D;JGT
@up
M=0

@TIMER
M=0
@STAY
0;JMP

//this will tell right func move right with one word
(MOVER)
@pixels
D=M
D=D+M
M=D
@32767
D=D-A
@RIGHT
D;JLT
@currentArr
M=M+1
@pixels
M=1
@STAY
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


//draw a ball with a length of 8 pixels
(BALL)
@withball
M=1
@8
D=A
@ballheight
M=D
@currentBallArr
D=M
@ballArr
M=D
(LOOPDBALL)
@256
D=A
D=-D
@ballArr
A=M
M=D
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
@9
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