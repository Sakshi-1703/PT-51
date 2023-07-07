ORG 00H
 MOV P0,#0FFH
 MOV A,P0
 MOV R1,A
 MOV 70H,R1
 ANL A,#0FH
 MOV 71H,A
 SUBB A,#10
 JNC DOWN
 ACALL NUMBER_1
 DOWN: ACALL CHARACTER_1
 
 NUMBER_1:
          MOV A,71H
          ADD A,#48
		  MOV P1,A
		  
CHARACTER_1:
          MOV A,71H
          ADD A,#55
		  MOV P1,A
		
MOV A,70H	
ANL A,#0F0H
SWAP A
 MOV 72H,A
 SUBB A,#10
 JNC DOWN1
 ACALL NUMBER_2
 DOWN1: ACALL CHARACTER_2
 
 NUMBER_2:
          MOV A,72H
          ADD A,#48
		  MOV P2,A
		  
 CHARACTER_2:
          MOV A,72H
          ADD A,#55
		  MOV P2,A
END



ORG 00H
MAIN:
	ACALL READNIBBLE
	ACALL DEL_5s
	MOV P1,#0FH
	ACALL DEL_1s
	MOV A,P1
	CJNE A,#0FH,HERE
	MOV P1,4EH
	SJMP DOWN
		HERE:
			MOV P1,A
			HERE1:
			DOWN:SJMP HERE1
			
	READNIBBLE:
		MOV P1,#0FH
		MOV A,P1
		MOV P1,#0F0H
		SWAP A
		MOV P1,A
		SWAP A
		MOV 4EH,A
		RET
	
	
	DEL_250us: PUSH 00H // 1us
	           MOV R0,#245 //0.5
               L250us: DJNZ R0,L250us
               POP 00H //1us
               RET //1us


    DEL_1ms: PUSH 00H
	         MOV R0, #4
			 L1ms: acall DEL_250us
				   DJNZ R0 ,L1ms	 
			 POP 00H
			 RET	
			 
			 
    DEL_250ms: PUSH 00H
               MOV R0, #250
               L250ms: acall DEL_1ms
				     DJNZ R0 ,L250ms	 
			   POP 00H
			   RET
			   
    DEL_1s: PUSH 00H
            MOV R0, #4
            L1s: acall DEL_250ms
				 DJNZ R0 ,L1s	 
			POP 00H
			RET
	DEL_5s: PUSH 00H
            MOV R0, #5
            L5s: acall DEL_1s
				 DJNZ R0 ,L5s	 
			POP 00H			
			RET
END
