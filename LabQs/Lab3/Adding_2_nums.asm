; --------------------------------------
;	Adding Two 2-Digit Numbers
; --------------------------------------

;----------------------------------
;      Getting first number
;----------------------------------

start:
in 00 ;asks for input
sub al,30 ;subtracts 30 so it becomes the number inputed
push al ;puts a copy on the stack
add al,al ;3 + 3 =6
add al, al ; 6 + 6 =12
pop bl ;saves 3 in bl so we can do the maths right
add al,bl ;12 + 3 =15
add al,al ; 15 + 15 = 30
push al ;saves the 30 for later

in 00 
sub al, 30 ; makes al become the number needed
pop bl ; gets the 30 back from before
add al , bl ; adds them together to get 32
push al ; stores 32 so it stays around while you type the second number

;-------------------------------------------------------
;    Same as before just gets the second input
;-------------------------------------------------------

in 00
sub al,30
push al
add al,al
add al, al
pop bl
add al,bl
add al,al
push al

in 00 
sub al, 30
pop bl
add al , bl

;------------------------------
;      Adding the numbers
;------------------------------

pop bl ; gets the 32 back
add al, bl ; adds the numbers and saves it in al

;-------------------------------
;  Taking the numbers apart
;-------------------------------

mov bl, 30 ; starts bl with storing 0 (the decimal number), this will be our 10s
mov cl, 30 ;starts bl with storing 0 (the decimal number), this will be our units
mov dl, 00; starts the counter at 0 (really at 0)

count:
cmp dl,al ;compaires the sum with al (the sum of numbers)
jz done ;if they're equal then jump to done
inc dl ;the count goes up by 1
inc cl ;the units goes up by 1
cmp cl, 3a ; this checks if cl has gone past 9
jnz count ; if it has then go back to counting
mov cl, 30 ; set the units back to 0
inc bl ; push up the 10s
jmp count ; go back to the begining of count

done:
mov [c0], bl ; display the 10s in c0
mov [c1], cl; display the units in c1
jmp start ; go back to the begining for further input

	
; --------------------------------------
	END
; --------------------------------------
