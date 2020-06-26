.model small
DATA SEGMENT
    
        
Main_Menu db 10,13,'                  -:MAIN DISPLAY CONVERTER:-                                 ',10,13
 db '********************************************************************************'
 db '********************************************************************************',10,13
 db ' MAIN MENU      ',10,13
 ;db '                    
 db '                    Press 1 for TEMPERATURE CONVERTOR ',10,13
 db '                    Press 2 for VOLUME CONVERTOR',10,13
 db '                    Press 3 for CURRENCY CONVERTOR',10,13
 db '                    Press 4 for MASS CONVERTOR',10,13
 db '                       ',10,13

 db '                    Press X to Exit CODE ',10,13
 db 10,13,'********************************************************************************'
 db '********************************************************************************$'        



menuM db 10,13,'                  -:MASS CONVERTER:-                                 ',10,13
 db '********************************************************************************'
 db '********************************************************************************',10,13
 db ' MENU       ',10,13
 db '                    Press 0 for KILOGRAM : ',10,13
 db '                    Press 1 for POUND : ',10,13


 db '                    Press X to Exit FOR CURRENCY MENU ',10,13
 db 10,13,'********************************************************************************'
 db '********************************************************************************$'        

MSGm1 DB 10,13,"ENTER MASS IN KILOGRAM()  : $"
MSGm2 DB 10,13,"CONVERTED IS US GRAM  (MASS) : $"

MSGm3 DB 10,13,"ENTER MASS IN POUND()  : $"
MSGm4 DB 10,13,"CONVERTED IS US GRAM  (MASS) : $"



menuC db 10,13,'                  -:CURRENCY CONVERTER:-                                 ',10,13
 db '********************************************************************************'
 db '********************************************************************************',10,13
 db ' MENU       ',10,13
 db '                    Press 0 for US DOLLLAR : ',10,13
 db '                    Press 1 for QAWAIT DINAR : ',10,13
 db '                    Press 2 for SAUDI RIYAAL :',10,13
 db '                    Press 3 for CHINESE YUHAAN ',10,13


 db '                    Press X to Exit FOR CURRENCY MENU ',10,13
 db 10,13,'********************************************************************************'
 db '********************************************************************************$'        

MSGc1 DB 10,13,"ENTER CURRENCY IN PAKISTAN(.RS)  : $"
MSGc2 DB 10,13,"CONVERTED IS US DOLLAR  (CURRENCY) : $"


MSGc3 DB 10,13,"CONVERTED IS QAWAIT DINAR (CURRENCY) : $"
MSGc4 DB 10,13,"CONVERTED IS SAUDI RIYAAL (CURRENCY) : $"
MSGc5 DB 10,13,"CONVERTED IS CHINESE YUHAAN (CURRENCY) : $"


    
menuV db 10,13,'                  -:VOLUME CONVERTER:-                                 ',10,13
 db '********************************************************************************'
 db '********************************************************************************',10,13
 db ' MENU       ',10,13
 db '                    Press 0 for LITER ',10,13
 db '                    Press 1 for GALLON  ',10,13
 

 db '                    Press X to Exit FOR VOLUME MENU ',10,13
 db 10,13,'********************************************************************************'
 db '********************************************************************************$'        

MSGV1 DB 10,13,"ENTER VOLUME IN LITER  : $"
MSGV2 DB 10,13,"CONVERTED IS MILLILITER (VOLUME) : $"


MSGV3 DB 10,13,"ENTER VOLUME IN GALLON  : $"
MSGV4 DB 10,13,"CONVERTED IS MILLILITER (VOLUME) : $"

V DB ?
A DW ?



menuT db 10,13,'                  -:TEMPERATURE CONVERTER:-                                 ',10,13
 db '********************************************************************************'
 db '********************************************************************************',10,13
 db ' MENU       ',10,13
 db '                    Press 0 for CELSIUS -> FAHRENHEIT ',10,13
 db '                    Press 1 for FAHRENHEIT -> CELSIUS ',10,13


 db '                    Press X to Exit FOR TEMPERATURE MENU ',10,13
 db 10,13,'********************************************************************************'
 db '********************************************************************************$'        
T    DB ?
RES  DB 10 DUP ('$')
MSG1 DB 10,13,"ENTER TEMPERATURE IN CELSIUS (ONLY IN 2 DIGITS) : $"
MSG2 DB 10,13,"CONVERTED IS FAHRENHEIT (TEMPERATURE) : $"

MSG3 DB 10,13,"ENTER TEMPERATURE IN FAHRENHEIT (ONLY IN 2 DIGITS) : $"
MSG4 DB 10,13,"CONVERTED IS CELSIUS (TEMPERATURE) : $"

str  DB 10,13,"ENTER ANY NUMBER : $" 
ms2 DB 10,13,"PLEASE ENTER CORRECT NUMBER... $"
C DW ?



str10  db 10,13,10,13,'********************************************************************************'
 db '********************************************************************************'
 db 10,13,"                               THANK YOU... :) ",10,13,10,13
 db '     For Using : ',10,13,10,13
 db '                      "UNIT CONVERTER" ',10,13,10,13
 
 
 db '                    GOOD BYE... :) ',10,13
 db '                    STAY HAPPY.... :) ',10,13
 db 10,13,'********************************************************************************'
 db '********************************************************************************$'



DATA ENDS
CODE SEGMENT
ASSUME DS:DATA,CS:CODE
TEMP:

MOV AX,DATA
MOV DS,AX

LEA DX,str7
MOV AH,9    
INT 21H


mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h 

mov ah,00
int 16h

m_menu:

mov ah,00
mov al,02
int 10h


LEA DX,Main_Menu
MOV AH,9    
INT 21H


mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h 


  ;userinput
mov dx,offset str
mov ah,9
int 21h  
 

mov ah,1
int 21h
mov bl,al


         ;now compare
mov al,bl

cmp al,'1'
je while_
cmp al,'2'
je v_menu
cmp al,'3'
je c_menu
cmp al,'4'
je m_men


cmp al,'X'
jmp end_

mov dx,offset ms2
mov ah,9
int 21h

mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h
jmp m_menu

while_:
LEA DX,menuT
MOV AH,9    
INT 21H



mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h





  ;userinput
mov dx,offset str
mov ah,9
int 21h  
 

mov ah,1
int 21h
mov bl,al


         ;now compare
mov al,bl
cmp al,'0'
je cels
cmp al,'1'
je fahrn
cmp al,'2'
;je klv
cmp al,'3'
;je ckl
cmp al,'4'
;je klc
cmp al,'5'
;je fhrk

cmp al,'X'
;jmp end_

mov dx,offset ms2
mov ah,9
int 21h

mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h
jmp while_

cels:
call C_F


fahrn:
call F_C


;klv:
;call K_F


;ckl:
;call C_K


;klc:
;call K_C


;fhrk:
;call F_K








MOV AH,00
INT 16H

end_:


LEA DX,str10
MOV AH,9    
INT 21H


mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h 

mov ah,00
int 16h

MOV AH,4CH
INT 21H
CODE ENDS

;celsius to fahrenheit
C_F PROC NEAR
    
LEA DX,MSG1
MOV AH,9
INT 21H
MOV AH,1
INT 21H
SUB AL,30H
MOV AH,0
MOV BL,10
MUL BL
MOV BL,AL
MOV AH,1
INT 21H
SUB AL,30H
MOV AH,0
ADD AL,BL
MOV T,AL
MOV DL,9
MUL DL
MOV BL,5
DIV BL
MOV AH,0
ADD AL,32
LEA SI,RES

MOV CX,0
MOV BX,10
LOOP1: MOV DX,0
DIV BX
ADD DL,30H
PUSH DX
INC CX
CMP AX,9
JG LOOP1
ADD AL,30H
MOV [SI],AL
LOOP2: POP AX
INC SI
MOV [SI],AL
LOOP LOOP2

LEA DX,MSG2
MOV AH,9
INT 21H
LEA DX,RES
MOV AH,9
INT 21H

MOV AH,00
INT 16H


RET
C_F ENDP




F_C PROC NEAR
        
        
LEA DX,MSG3
MOV AH,9
INT 21H
MOV AH,1
INT 21H
SUB AL,30H
MOV AH,0
MOV BL,10
MUL BL
MOV BL,AL
MOV AH,1
INT 21H
SUB AL,30H
MOV AH,0
ADD AL,BL
MOV T,AL

SUB AL,32
MOV DL,5
MUL DL
MOV BL,9
DIV BL
MOV AH,0
LEA SI,RES

MOV CX,0
MOV BX,10
LOOPE1: MOV DX,0
DIV BX
ADD DL,30H
PUSH DX
INC CX
CMP AX,9
JG LOOPE1
ADD AL,30H
MOV [SI],AL
LOOPE2: POP AX
INC SI
MOV [SI],AL
LOOP LOOPE2

LEA DX,MSG4
MOV AH,9
INT 21H
LEA DX,RES
MOV AH,9
INT 21H

MOV AH,00
INT 16H



RET
F_C ENDP

 ;VOLUME CONVERTER START HERE..
v_menu:

mov dx,offset menuV
mov ah,9
int 21h

mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h


  ;userinput
mov dx,offset str
mov ah,9
int 21h  
 

mov ah,1
int 21h
mov bl,al
       

         ;now compare
mov al,bl
cmp al,'0'
je L_M
cmp al,'1'
je G_M
cmp al,'2'
;je klv
cmp al,'3'
;je ckl
cmp al,'4'
;je klc
cmp al,'5'
;je fhrk

cmp al,'X'
jmp end_

mov dx,offset ms2
mov ah,9
int 21h

mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h
jmp v_menu       

; liter  to  milli_liter  convertor
L_M PROC
LEA DX,MSGV1
MOV AH,9
INT 21H
MOV AH,1
INT 21H


MOV BX,1000h
MUL BL

LEA DX,MSGV2
MOV AH,9
INT 21H
;ADD ax,10h
MOV AH,2
MOV Dx,Ax
INT 21H
MOV AH,00
INT 16H
L_M endp

; Gallon to milli_litter
G_M PROC
LEA DX,MSGV3
MOV AH,9
INT 21H
MOV AH,1
INT 21H


MOV BX,4546h
MUL BL

LEA DX,MSGV4
MOV AH,9
INT 21H
;ADD ax,10h
MOV AH,2
MOV Dx,Ax
INT 21H
MOV AH,00
INT 16H
G_M endp

 
 

 ;CURRENCY CONVERTER START HERE..
c_menu:

mov dx,offset menuC
mov ah,9
int 21h

mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h


  ;userinput
mov dx,offset str
mov ah,9
int 21h  
 

mov ah,1
int 21h
mov bl,al
       

         ;now compare
mov al,bl
cmp al,'0'
je P_U
cmp al,'1'
je P_Q
cmp al,'2'
je P_S
cmp al,'3'
je P_Y
cmp al,'4'
;je klc
cmp al,'5'
;je fhrk

cmp al,'X'
jmp end_

mov dx,offset ms2
mov ah,9
int 21h

mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h
jmp c_menu       

; PAKISTAN(.RS)  to  US DOLLAR($)  convertor
P_U PROC
LEA DX,MSGc1
MOV AH,9
INT 21H
MOV AH,1
INT 21H


MOV BX,160h
MUL BL

LEA DX,MSGc2
MOV AH,9
INT 21H
;ADD ax,10h
MOV AH,2
MOV Dx,Ax
INT 21H
MOV AH,00
INT 16H
P_U endp

; PAKISTAN(.RS)  to  US QAWAIT DINAR  convertor
P_Q PROC
LEA DX,MSGc1
MOV AH,9
INT 21H
MOV AH,1
INT 21H


MOV BX,490h
MUL BL

LEA DX,MSGc3
MOV AH,9
INT 21H
;ADD ax,10h
MOV AH,2
MOV Dx,Ax
INT 21H
MOV AH,00
INT 16H
P_Q endp

; PAKISTAN(.RS)  to   SAUDI RIYAAL  convertor
P_S PROC
LEA DX,MSGc1
MOV AH,9
INT 21H
MOV AH,1
INT 21H


MOV BL,47h
MUL BL

LEA DX,MSGc4
MOV AH,9
INT 21H
;ADD ax,10h
MOV AH,2
MOV Dx,Ax
INT 21H
MOV AH,00
INT 16H
P_S endp


; PAKISTAN(.RS)  to  CHINESE YUHAAN  convertor
P_Y PROC
LEA DX,MSGc1
MOV AH,9
INT 21H
MOV AH,1
INT 21H


MOV BL,24h
MUL BL

LEA DX,MSGc5
MOV AH,9
INT 21H
;ADD ax,10h
MOV AH,2
MOV Dx,Ax
INT 21H
MOV AH,00
INT 16H
P_Y endp


 ;MASS CONVERTER START HERE..
m_men:

mov dx,offset menuM
mov ah,9
int 21h

mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h


  ;userinput
mov dx,offset str
mov ah,9
int 21h  
 

mov ah,1
int 21h
mov bl,al
       

         ;now compare
mov al,bl
cmp al,'0'
je K_G
cmp al,'1'
je P_G
cmp al,'2'
;je klv
cmp al,'3'
;je ckl
cmp al,'4'
;je klc
cmp al,'5'
;je fhrk

cmp al,'X'
jmp end_

mov dx,offset ms2
mov ah,9
int 21h

mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h
jmp m_men       

; KILOGRAM  to  GRAM  convertor
K_G PROC
LEA DX,MSGm1
MOV AH,9
INT 21H
MOV AH,1
INT 21H


MOV BX,1000h
MUL BL

LEA DX,MSGm2
MOV AH,9
INT 21H
;ADD ax,10h
MOV AH,2
MOV Dx,Ax
INT 21H
MOV AH,00
INT 16H
K_G endp

; POUND to GRAM
P_G PROC
LEA DX,MSGm3
MOV AH,9
INT 21H
MOV AH,1
INT 21H


MOV BX,454h
MUL BL

LEA DX,MSGm4
MOV AH,9
INT 21H
;ADD ax,10h
MOV AH,2
MOV Dx,Ax
INT 21H
MOV AH,00
INT 16H
P_G endp




END TEMP
