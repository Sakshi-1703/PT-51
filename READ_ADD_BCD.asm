ORG 00H
MAIN:
	ACALL READNIBBLE
	ACALL ADDNIBBLE
	MOV A,4FH
	ANL A,#0F0H
	MOV 51H,A
	MOV P1,51H
	ACALL DEL_5s
	MOV A,4FH
	ANL A,#0FH
	SWAP A
	MOV 50H,A
	MOV P1,50H
	HERE:SJMP HERE

	READNIBBLE:
	    MOV R1,#4DH
		MOV R0,#02H
	 UP:MOV P1,#0FH
		MOV A,P1
		MOV @R1,A
		INC R1
		DJNZ R0,UP
		RET
		
	ADDNIBBLE:
		MOV A,4DH
		MOV R2,4EH
		ADD A,R2
		DA A
		MOV 4FH,A
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












