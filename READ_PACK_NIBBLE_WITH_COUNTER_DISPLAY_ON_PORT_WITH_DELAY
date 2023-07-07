ORG 00H
MAIN:
MOV R0,#02
MOV R1,#60H
UP:ACALL READNIBBLE
   ACALL PACKNIBBLE
   MOV @R1,A
   INC R1
   DJNZ R0,UP
   ACALL READNIBBLE
   MOV A,50H
   CJNE A,#02H,HERE1
   HERE1:	JNC DOWN
   MOV R1,#60H
			ADD A,R1
			MOV R1,A
			MOV P1,#0F0H
			MOV A,@R1
			MOV P1,A
			ACALL DEL_2s
			MOV R1,A
			MOV P1,#0FH
			MOV A,@R1
			SWAP A
			MOV P1,A
			ACALL DEL_2s
			 HERE2: SJMP HERE2
	DOWN:MOV P1,#0FH			
   
   HERE: SJMP HERE

READNIBBLE:
		MOV P1,#0FH
		MOV A,P1
		MOV P1,#0F0H
		SWAP A
		MOV P1,A
		ACALL DEL_5s
		SWAP A
		MOV R2,A
		MOV 50H,R2
		INC R2
		MOV A,R2
		MOV P1,#0F0H
		SWAP A
		MOV P1,A
		ACALL DEL_5s
		SWAP A
		MOV 51H,R2
		RET
		
PACKNIBBLE:
		MOV A,50H
		SWAP A
		MOV R3,51H
		ADD A,R3
		MOV P1,A
		//MOV 70H,A
		ACALL DEL_5s
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
	DEL_2s: PUSH 00H
            MOV R0, #2
            L2s: acall  DEL_1s
				 DJNZ R0,L2s	 
			POP 00H
			RET
	DEL_5s: PUSH 00H
            MOV R0, #5
            L5s: acall DEL_1s
				 DJNZ R0 ,L5s	 
			POP 00H			
			RET
END
