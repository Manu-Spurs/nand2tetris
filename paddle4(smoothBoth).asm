

// init of a paddle game
//set 16 value into a binary list
@2
D=A
@value
M=-D
@count
M=0

//OPTION4 for pixel move, the arry is created for record 15 positions, which are pixels steps
(CREATARRAY)
// if (count-15>0) goto ENDINIT 
// repeat 15 times
@15
D=A
@count
D=M-D
@ENDINIT
D;JGE
// Ri = count
@value
D=M
@count
A=M
M=D
@value
M=D+M
@count
M=M+1
// goto LOOP
@CREATARRAY
0;JMP
(ENDINIT)

//set the bottom of the paddle initial location to left corner of the screen 
@24544  
D=A
@currentArr
M=D
@pixelIndex
M=0
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
(STAY)   //THIS IS PROGRAMMING CONTROL WHEN THERE IS AN EVENT
@3
D=A
@height
M=D
@currentArr
D=M
@paddleAddr
M=D
(LOOP1)
@pixelIndex
A=M
D=M
@paddleAddr
A=M
M=D
A=A+1
M=-1
A=A+1
M=-1
A=A+1
D=-D
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

//AFTER DRAW A STATIC PADDLE DELAY LOOP NEED TO RESTART
@TIMER
M=0
//listen to the key event
@EVENT
0;JMP

//move the paddle one pixel to the right
(RIGHT)// WHEN RIGHT FUNCTION IS CALLED THE PADDLE WILL MOVE RIGHT ONE PIXEL
//get pixel value from array
@pixelIndex
A=M
D=M
@pixels
M=D
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
M=D
@3
D=A
@paddleAddr
M=M+D
@pixels
M=-M
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

//Move the paddle ONE pixel to the left
(LEFT)//WHEN LEFT FUNCTION IS CALLED THE PADDLE WILL MOVE RIGHT ONE PIXEL
@pixelIndex
A=M
D=M
@pixelsL
M=D
@3
D=A
@height
M=D
@currentArr
D=M
@paddleLAddr
M=D
(LOOP3)
@pixelsL
D=M
@paddleLAddr
A=M
M=D
@3
D=A
@paddleLAddr
M=M+D
@pixelsL
D=-M
D=M-1
@paddleLAddr
A=M
M=D
@paddleLAddr
A=M+1
M=0

@3
D=A
@paddleLAddr
D=M-D
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

//this will tell right func move right with one pixel
(MOVER)
@pixelIndex
M=M+1
D=M
@15
D=D-A
@RIGHT
D;JLE
@currentArr
M=M+1
@pixelIndex
M=0
@RIGHT
0;JMP

//this will tell left func move left with one pixel
(MOVEL)
@pixelIndex
M=M-1
D=M
@LEFT
D;JGE
@currentArr
M=M-1
@15
D=A
@pixelIndex
M=D
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