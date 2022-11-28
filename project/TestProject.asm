
_answer_key_state:

;TestProject.c,68 :: 		key_state answer_key_state(){
	MOVF        R0, 0 
	MOVWF       R2 
	MOVF        R1, 0 
	MOVWF       R3 
;TestProject.c,70 :: 		LATB.B5 = 1;
	BSF         LATB+0, 5 
;TestProject.c,71 :: 		LATB.B6 = 1;
	BSF         LATB+0, 6 
;TestProject.c,72 :: 		LATB.B7 = 1;
	BSF         LATB+0, 7 
;TestProject.c,73 :: 		LATB.B4 = 0;
	BCF         LATB+0, 4 
;TestProject.c,74 :: 		nop();
	NOP
;TestProject.c,75 :: 		nop();
	NOP
;TestProject.c,76 :: 		cur_state.b4 = PORTB;
	MOVF        PORTB+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        R4, 0 
	XORWF       R0, 1 
	MOVF        R5, 0 
	XORWF       R1, 1 
	MOVLW       255
	ANDWF       R0, 1 
	MOVLW       255
	ANDWF       R1, 1 
	MOVF        R4, 0 
	XORWF       R0, 1 
	MOVF        R5, 0 
	XORWF       R1, 1 
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
;TestProject.c,77 :: 		LATB.B4 = 1;
	BSF         LATB+0, 4 
;TestProject.c,78 :: 		LATB.B5 = 0;
	BCF         LATB+0, 5 
;TestProject.c,79 :: 		nop();
	NOP
;TestProject.c,80 :: 		nop();
	NOP
;TestProject.c,81 :: 		cur_state.b5 = PORTB;
	MOVF        PORTB+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        R6, 0 
	XORWF       R0, 1 
	MOVF        R7, 0 
	XORWF       R1, 1 
	MOVLW       255
	ANDWF       R0, 1 
	MOVLW       255
	ANDWF       R1, 1 
	MOVF        R6, 0 
	XORWF       R0, 1 
	MOVF        R7, 0 
	XORWF       R1, 1 
	MOVF        R0, 0 
	MOVWF       R6 
	MOVF        R1, 0 
	MOVWF       R7 
;TestProject.c,82 :: 		LATB.B5 = 1;
	BSF         LATB+0, 5 
;TestProject.c,83 :: 		LATB.B6 = 0;
	BCF         LATB+0, 6 
;TestProject.c,84 :: 		nop();
	NOP
;TestProject.c,85 :: 		nop();
	NOP
;TestProject.c,86 :: 		cur_state.b6 = PORTB;
	MOVF        PORTB+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        R8, 0 
	XORWF       R0, 1 
	MOVF        R9, 0 
	XORWF       R1, 1 
	MOVLW       255
	ANDWF       R0, 1 
	MOVLW       255
	ANDWF       R1, 1 
	MOVF        R8, 0 
	XORWF       R0, 1 
	MOVF        R9, 0 
	XORWF       R1, 1 
	MOVF        R0, 0 
	MOVWF       R8 
	MOVF        R1, 0 
	MOVWF       R9 
;TestProject.c,87 :: 		LATB.B6 = 1;
	BSF         LATB+0, 6 
;TestProject.c,88 :: 		LATB.B7 = 0;
	BCF         LATB+0, 7 
;TestProject.c,89 :: 		nop();
	NOP
;TestProject.c,90 :: 		nop();
	NOP
;TestProject.c,91 :: 		cur_state.b7 = PORTB;
	MOVF        PORTB+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        R10, 0 
	XORWF       R0, 1 
	MOVF        R11, 0 
	XORWF       R1, 1 
	MOVLW       255
	ANDWF       R0, 1 
	MOVLW       255
	ANDWF       R1, 1 
	MOVF        R10, 0 
	XORWF       R0, 1 
	MOVF        R11, 0 
	XORWF       R1, 1 
	MOVF        R0, 0 
	MOVWF       R10 
	MOVF        R1, 0 
	MOVWF       R11 
;TestProject.c,92 :: 		LATB.B7 = 1;
	BSF         LATB+0, 7 
;TestProject.c,93 :: 		return  cur_state;
	MOVLW       8
	MOVWF       R0 
	MOVF        R2, 0 
	MOVWF       FSR1L+0 
	MOVF        R3, 0 
	MOVWF       FSR1L+1 
	MOVLW       4
	MOVWF       FSR0L+0 
	MOVLW       0
	MOVWF       FSR0L+1 
L_answer_key_state0:
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
	DECF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_answer_key_state0
;TestProject.c,94 :: 		}
L_end_answer_key_state:
	RETURN      0
; end of _answer_key_state

_read_key_state:

;TestProject.c,96 :: 		unsigned char read_key_state(key_state cur_state){
;TestProject.c,97 :: 		unsigned char def = 'N';
	MOVLW       78
	MOVWF       read_key_state_def_L0+0 
;TestProject.c,98 :: 		unsigned char num = cur_state.b4;
	MOVLW       255
	ANDWF       FARG_read_key_state_cur_state+0, 0 
	MOVWF       R0 
	MOVF        FARG_read_key_state_cur_state+1, 0 
	MOVWF       R1 
	MOVLW       255
	ANDWF       R1, 1 
	MOVF        R0, 0 
	MOVWF       R2 
;TestProject.c,99 :: 		switch(num){
	GOTO        L_read_key_state1
;TestProject.c,100 :: 		case 0b11100111:
L_read_key_state3:
;TestProject.c,101 :: 		def = 0x2b;
	MOVLW       43
	MOVWF       read_key_state_def_L0+0 
;TestProject.c,102 :: 		break;
	GOTO        L_read_key_state2
;TestProject.c,103 :: 		case 0b11101011:
L_read_key_state4:
;TestProject.c,104 :: 		def = 0x33;
	MOVLW       51
	MOVWF       read_key_state_def_L0+0 
;TestProject.c,105 :: 		break;
	GOTO        L_read_key_state2
;TestProject.c,106 :: 		case 0b11101101:
L_read_key_state5:
;TestProject.c,107 :: 		def = 0x32;
	MOVLW       50
	MOVWF       read_key_state_def_L0+0 
;TestProject.c,108 :: 		break;
	GOTO        L_read_key_state2
;TestProject.c,109 :: 		case 0b11101110:
L_read_key_state6:
;TestProject.c,110 :: 		def = 0x31;
	MOVLW       49
	MOVWF       read_key_state_def_L0+0 
;TestProject.c,111 :: 		break;
	GOTO        L_read_key_state2
;TestProject.c,112 :: 		}
L_read_key_state1:
	MOVF        R2, 0 
	XORLW       231
	BTFSC       STATUS+0, 2 
	GOTO        L_read_key_state3
	MOVF        R2, 0 
	XORLW       235
	BTFSC       STATUS+0, 2 
	GOTO        L_read_key_state4
	MOVF        R2, 0 
	XORLW       237
	BTFSC       STATUS+0, 2 
	GOTO        L_read_key_state5
	MOVF        R2, 0 
	XORLW       238
	BTFSC       STATUS+0, 2 
	GOTO        L_read_key_state6
L_read_key_state2:
;TestProject.c,113 :: 		num = cur_state.b5;
	MOVLW       255
	ANDWF       FARG_read_key_state_cur_state+2, 0 
	MOVWF       R0 
	MOVF        FARG_read_key_state_cur_state+3, 0 
	MOVWF       R1 
	MOVLW       255
	ANDWF       R1, 1 
	MOVF        R0, 0 
	MOVWF       R2 
;TestProject.c,114 :: 		switch(num){
	GOTO        L_read_key_state7
;TestProject.c,115 :: 		case 0b11010111:
L_read_key_state9:
;TestProject.c,116 :: 		def = '-';
	MOVLW       45
	MOVWF       read_key_state_def_L0+0 
;TestProject.c,117 :: 		break;
	GOTO        L_read_key_state8
;TestProject.c,118 :: 		case 0b11011011:
L_read_key_state10:
;TestProject.c,119 :: 		def = 0x36;
	MOVLW       54
	MOVWF       read_key_state_def_L0+0 
;TestProject.c,120 :: 		break;
	GOTO        L_read_key_state8
;TestProject.c,121 :: 		case 0b11011101:
L_read_key_state11:
;TestProject.c,122 :: 		def = 0x35;
	MOVLW       53
	MOVWF       read_key_state_def_L0+0 
;TestProject.c,123 :: 		break;
	GOTO        L_read_key_state8
;TestProject.c,124 :: 		case 0b11011110:
L_read_key_state12:
;TestProject.c,125 :: 		def = 0x34;
	MOVLW       52
	MOVWF       read_key_state_def_L0+0 
;TestProject.c,126 :: 		break;
	GOTO        L_read_key_state8
;TestProject.c,127 :: 		}
L_read_key_state7:
	MOVF        R2, 0 
	XORLW       215
	BTFSC       STATUS+0, 2 
	GOTO        L_read_key_state9
	MOVF        R2, 0 
	XORLW       219
	BTFSC       STATUS+0, 2 
	GOTO        L_read_key_state10
	MOVF        R2, 0 
	XORLW       221
	BTFSC       STATUS+0, 2 
	GOTO        L_read_key_state11
	MOVF        R2, 0 
	XORLW       222
	BTFSC       STATUS+0, 2 
	GOTO        L_read_key_state12
L_read_key_state8:
;TestProject.c,128 :: 		num = cur_state.b6;
	MOVLW       255
	ANDWF       FARG_read_key_state_cur_state+4, 0 
	MOVWF       R0 
	MOVF        FARG_read_key_state_cur_state+5, 0 
	MOVWF       R1 
	MOVLW       255
	ANDWF       R1, 1 
	MOVF        R0, 0 
	MOVWF       R2 
;TestProject.c,129 :: 		switch(num){
	GOTO        L_read_key_state13
;TestProject.c,130 :: 		case 0b10110111:
L_read_key_state15:
;TestProject.c,131 :: 		def = 0x2a;
	MOVLW       42
	MOVWF       read_key_state_def_L0+0 
;TestProject.c,132 :: 		break;
	GOTO        L_read_key_state14
;TestProject.c,133 :: 		case 0b10111011:
L_read_key_state16:
;TestProject.c,134 :: 		def = 0x39;
	MOVLW       57
	MOVWF       read_key_state_def_L0+0 
;TestProject.c,135 :: 		break;
	GOTO        L_read_key_state14
;TestProject.c,136 :: 		case 0b10111101:
L_read_key_state17:
;TestProject.c,137 :: 		def = 0x38;
	MOVLW       56
	MOVWF       read_key_state_def_L0+0 
;TestProject.c,138 :: 		break;
	GOTO        L_read_key_state14
;TestProject.c,139 :: 		case 0b10111110:
L_read_key_state18:
;TestProject.c,140 :: 		def = 0x37;
	MOVLW       55
	MOVWF       read_key_state_def_L0+0 
;TestProject.c,141 :: 		break;
	GOTO        L_read_key_state14
;TestProject.c,142 :: 		}
L_read_key_state13:
	MOVF        R2, 0 
	XORLW       183
	BTFSC       STATUS+0, 2 
	GOTO        L_read_key_state15
	MOVF        R2, 0 
	XORLW       187
	BTFSC       STATUS+0, 2 
	GOTO        L_read_key_state16
	MOVF        R2, 0 
	XORLW       189
	BTFSC       STATUS+0, 2 
	GOTO        L_read_key_state17
	MOVF        R2, 0 
	XORLW       190
	BTFSC       STATUS+0, 2 
	GOTO        L_read_key_state18
L_read_key_state14:
;TestProject.c,143 :: 		num = cur_state.b7;
	MOVLW       255
	ANDWF       FARG_read_key_state_cur_state+6, 0 
	MOVWF       R0 
	MOVF        FARG_read_key_state_cur_state+7, 0 
	MOVWF       R1 
	MOVLW       255
	ANDWF       R1, 1 
	MOVF        R0, 0 
	MOVWF       R2 
;TestProject.c,144 :: 		switch(num){
	GOTO        L_read_key_state19
;TestProject.c,145 :: 		case 0b01110111:
L_read_key_state21:
;TestProject.c,146 :: 		def = 0x2f;
	MOVLW       47
	MOVWF       read_key_state_def_L0+0 
;TestProject.c,147 :: 		break;
	GOTO        L_read_key_state20
;TestProject.c,148 :: 		case 0b01111011:
L_read_key_state22:
;TestProject.c,149 :: 		def = 0x3d;
	MOVLW       61
	MOVWF       read_key_state_def_L0+0 
;TestProject.c,150 :: 		break;
	GOTO        L_read_key_state20
;TestProject.c,151 :: 		case 0b01111101:
L_read_key_state23:
;TestProject.c,152 :: 		def = 0x30;
	MOVLW       48
	MOVWF       read_key_state_def_L0+0 
;TestProject.c,153 :: 		break;
	GOTO        L_read_key_state20
;TestProject.c,154 :: 		case 0b01111110:
L_read_key_state24:
;TestProject.c,155 :: 		def = 0x43;
	MOVLW       67
	MOVWF       read_key_state_def_L0+0 
;TestProject.c,156 :: 		break;
	GOTO        L_read_key_state20
;TestProject.c,157 :: 		}
L_read_key_state19:
	MOVF        R2, 0 
	XORLW       119
	BTFSC       STATUS+0, 2 
	GOTO        L_read_key_state21
	MOVF        R2, 0 
	XORLW       123
	BTFSC       STATUS+0, 2 
	GOTO        L_read_key_state22
	MOVF        R2, 0 
	XORLW       125
	BTFSC       STATUS+0, 2 
	GOTO        L_read_key_state23
	MOVF        R2, 0 
	XORLW       126
	BTFSC       STATUS+0, 2 
	GOTO        L_read_key_state24
L_read_key_state20:
;TestProject.c,158 :: 		return def;
	MOVF        read_key_state_def_L0+0, 0 
	MOVWF       R0 
;TestProject.c,159 :: 		}
L_end_read_key_state:
	RETURN      0
; end of _read_key_state

_keypad_readkey:

;TestProject.c,161 :: 		unsigned char keypad_readkey()
;TestProject.c,163 :: 		LATB.B4 = 1;
	BSF         LATB+0, 4 
;TestProject.c,164 :: 		LATB.B5 = 1;
	BSF         LATB+0, 5 
;TestProject.c,165 :: 		LATB.B6 = 1;
	BSF         LATB+0, 6 
;TestProject.c,166 :: 		LATB.B7 = 1;
	BSF         LATB+0, 7 
;TestProject.c,167 :: 		delay_ms(5);
	MOVLW       13
	MOVWF       R12, 0
	MOVLW       251
	MOVWF       R13, 0
L_keypad_readkey25:
	DECFSZ      R13, 1, 1
	BRA         L_keypad_readkey25
	DECFSZ      R12, 1, 1
	BRA         L_keypad_readkey25
	NOP
	NOP
;TestProject.c,169 :: 		LATB.B4 = 0;
	BCF         LATB+0, 4 
;TestProject.c,170 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_keypad_readkey26:
	DECFSZ      R13, 1, 1
	BRA         L_keypad_readkey26
	DECFSZ      R12, 1, 1
	BRA         L_keypad_readkey26
	DECFSZ      R11, 1, 1
	BRA         L_keypad_readkey26
	NOP
;TestProject.c,171 :: 		if(PORTB.B0 == 0) {return 0x31;}
	BTFSC       PORTB+0, 0 
	GOTO        L_keypad_readkey27
	MOVLW       49
	MOVWF       R0 
	GOTO        L_end_keypad_readkey
L_keypad_readkey27:
;TestProject.c,172 :: 		if(PORTB.B1 == 0) {return 0x32;}
	BTFSC       PORTB+0, 1 
	GOTO        L_keypad_readkey28
	MOVLW       50
	MOVWF       R0 
	GOTO        L_end_keypad_readkey
L_keypad_readkey28:
;TestProject.c,173 :: 		if(PORTB.B2 == 0) {return 0x33;}
	BTFSC       PORTB+0, 2 
	GOTO        L_keypad_readkey29
	MOVLW       51
	MOVWF       R0 
	GOTO        L_end_keypad_readkey
L_keypad_readkey29:
;TestProject.c,174 :: 		if(PORTB.B3 == 0) {return 0x2B;} //+
	BTFSC       PORTB+0, 3 
	GOTO        L_keypad_readkey30
	MOVLW       43
	MOVWF       R0 
	GOTO        L_end_keypad_readkey
L_keypad_readkey30:
;TestProject.c,175 :: 		LATB.B4 = 1;
	BSF         LATB+0, 4 
;TestProject.c,176 :: 		LATB.B5 = 0;
	BCF         LATB+0, 5 
;TestProject.c,177 :: 		LATB.B6 = 1;
	BSF         LATB+0, 6 
;TestProject.c,178 :: 		LATB.B7 = 1;
	BSF         LATB+0, 7 
;TestProject.c,179 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_keypad_readkey31:
	DECFSZ      R13, 1, 1
	BRA         L_keypad_readkey31
	DECFSZ      R12, 1, 1
	BRA         L_keypad_readkey31
	DECFSZ      R11, 1, 1
	BRA         L_keypad_readkey31
	NOP
;TestProject.c,180 :: 		if(PORTB.B0 == 0) {return 0x34;}
	BTFSC       PORTB+0, 0 
	GOTO        L_keypad_readkey32
	MOVLW       52
	MOVWF       R0 
	GOTO        L_end_keypad_readkey
L_keypad_readkey32:
;TestProject.c,181 :: 		if(PORTB.B1 == 0) {return 0x35;}
	BTFSC       PORTB+0, 1 
	GOTO        L_keypad_readkey33
	MOVLW       53
	MOVWF       R0 
	GOTO        L_end_keypad_readkey
L_keypad_readkey33:
;TestProject.c,182 :: 		if(PORTB.B2 == 0) {return 0x36;}
	BTFSC       PORTB+0, 2 
	GOTO        L_keypad_readkey34
	MOVLW       54
	MOVWF       R0 
	GOTO        L_end_keypad_readkey
L_keypad_readkey34:
;TestProject.c,183 :: 		if(PORTB.B3 == 0) {return '-';}   // -
	BTFSC       PORTB+0, 3 
	GOTO        L_keypad_readkey35
	MOVLW       45
	MOVWF       R0 
	GOTO        L_end_keypad_readkey
L_keypad_readkey35:
;TestProject.c,185 :: 		LATB.B4 = 1;
	BSF         LATB+0, 4 
;TestProject.c,186 :: 		LATB.B5 = 1;
	BSF         LATB+0, 5 
;TestProject.c,187 :: 		LATB.B6 = 0;
	BCF         LATB+0, 6 
;TestProject.c,188 :: 		LATB.B7 = 1;
	BSF         LATB+0, 7 
;TestProject.c,189 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_keypad_readkey36:
	DECFSZ      R13, 1, 1
	BRA         L_keypad_readkey36
	DECFSZ      R12, 1, 1
	BRA         L_keypad_readkey36
	DECFSZ      R11, 1, 1
	BRA         L_keypad_readkey36
	NOP
;TestProject.c,190 :: 		if(PORTB.B0 == 0) {return 0x37;}
	BTFSC       PORTB+0, 0 
	GOTO        L_keypad_readkey37
	MOVLW       55
	MOVWF       R0 
	GOTO        L_end_keypad_readkey
L_keypad_readkey37:
;TestProject.c,191 :: 		if(PORTB.B1 == 0) {return 0x38;}
	BTFSC       PORTB+0, 1 
	GOTO        L_keypad_readkey38
	MOVLW       56
	MOVWF       R0 
	GOTO        L_end_keypad_readkey
L_keypad_readkey38:
;TestProject.c,192 :: 		if(PORTB.B2 == 0) {return 0x39;}
	BTFSC       PORTB+0, 2 
	GOTO        L_keypad_readkey39
	MOVLW       57
	MOVWF       R0 
	GOTO        L_end_keypad_readkey
L_keypad_readkey39:
;TestProject.c,193 :: 		if(PORTB.B3 == 0) {return 0x2A;}  // *
	BTFSC       PORTB+0, 3 
	GOTO        L_keypad_readkey40
	MOVLW       42
	MOVWF       R0 
	GOTO        L_end_keypad_readkey
L_keypad_readkey40:
;TestProject.c,195 :: 		LATB.B4 = 1;
	BSF         LATB+0, 4 
;TestProject.c,196 :: 		LATB.B5 = 1;
	BSF         LATB+0, 5 
;TestProject.c,197 :: 		LATB.B6 = 1;
	BSF         LATB+0, 6 
;TestProject.c,198 :: 		LATB.B7 = 0;
	BCF         LATB+0, 7 
;TestProject.c,199 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_keypad_readkey41:
	DECFSZ      R13, 1, 1
	BRA         L_keypad_readkey41
	DECFSZ      R12, 1, 1
	BRA         L_keypad_readkey41
	DECFSZ      R11, 1, 1
	BRA         L_keypad_readkey41
	NOP
;TestProject.c,200 :: 		if(PORTB.B0 == 0) {return 0x43;} // C
	BTFSC       PORTB+0, 0 
	GOTO        L_keypad_readkey42
	MOVLW       67
	MOVWF       R0 
	GOTO        L_end_keypad_readkey
L_keypad_readkey42:
;TestProject.c,201 :: 		if(PORTB.B1 == 0) {return 0x30;} // 0
	BTFSC       PORTB+0, 1 
	GOTO        L_keypad_readkey43
	MOVLW       48
	MOVWF       R0 
	GOTO        L_end_keypad_readkey
L_keypad_readkey43:
;TestProject.c,202 :: 		if(PORTB.B2 == 0) {return 0x3D;} // =
	BTFSC       PORTB+0, 2 
	GOTO        L_keypad_readkey44
	MOVLW       61
	MOVWF       R0 
	GOTO        L_end_keypad_readkey
L_keypad_readkey44:
;TestProject.c,203 :: 		if(PORTB.B3 == 0) {return 0x2F;} // /
	BTFSC       PORTB+0, 3 
	GOTO        L_keypad_readkey45
	MOVLW       47
	MOVWF       R0 
	GOTO        L_end_keypad_readkey
L_keypad_readkey45:
;TestProject.c,204 :: 		LATB.B7 = 1;
	BSF         LATB+0, 7 
;TestProject.c,205 :: 		return 'N';
	MOVLW       78
	MOVWF       R0 
;TestProject.c,206 :: 		}
L_end_keypad_readkey:
	RETURN      0
; end of _keypad_readkey

_lcd_print:

;TestProject.c,208 :: 		void lcd_print(unsigned char dat){
;TestProject.c,210 :: 		a.byte = dat;
	MOVF        FARG_lcd_print_dat+0, 0 
	MOVWF       R0 
;TestProject.c,211 :: 		EN = 1;
	BSF         LATA+0, 5 
;TestProject.c,212 :: 		nop();
	NOP
;TestProject.c,213 :: 		LATD.B7 = a.bit7;
	BTFSC       R0, 7 
	GOTO        L__lcd_print201
	BCF         LATD+0, 7 
	GOTO        L__lcd_print202
L__lcd_print201:
	BSF         LATD+0, 7 
L__lcd_print202:
;TestProject.c,214 :: 		LATD.B6 = a.bit6;
	BTFSC       R0, 6 
	GOTO        L__lcd_print203
	BCF         LATD+0, 6 
	GOTO        L__lcd_print204
L__lcd_print203:
	BSF         LATD+0, 6 
L__lcd_print204:
;TestProject.c,215 :: 		LATD.B5 = a.bit5;
	BTFSC       R0, 5 
	GOTO        L__lcd_print205
	BCF         LATD+0, 5 
	GOTO        L__lcd_print206
L__lcd_print205:
	BSF         LATD+0, 5 
L__lcd_print206:
;TestProject.c,216 :: 		LATD.B4 = a.bit4;
	BTFSC       R0, 4 
	GOTO        L__lcd_print207
	BCF         LATD+0, 4 
	GOTO        L__lcd_print208
L__lcd_print207:
	BSF         LATD+0, 4 
L__lcd_print208:
;TestProject.c,217 :: 		nop();
	NOP
;TestProject.c,218 :: 		EN = 0;
	BCF         LATA+0, 5 
;TestProject.c,219 :: 		nop();
	NOP
;TestProject.c,220 :: 		EN = 1;
	BSF         LATA+0, 5 
;TestProject.c,221 :: 		nop();
	NOP
;TestProject.c,222 :: 		LATD.B7 = a.bit3;
	BTFSC       R0, 3 
	GOTO        L__lcd_print209
	BCF         LATD+0, 7 
	GOTO        L__lcd_print210
L__lcd_print209:
	BSF         LATD+0, 7 
L__lcd_print210:
;TestProject.c,223 :: 		LATD.B6 = a.bit2;
	BTFSC       R0, 2 
	GOTO        L__lcd_print211
	BCF         LATD+0, 6 
	GOTO        L__lcd_print212
L__lcd_print211:
	BSF         LATD+0, 6 
L__lcd_print212:
;TestProject.c,224 :: 		LATD.B5 = a.bit1;
	BTFSC       R0, 1 
	GOTO        L__lcd_print213
	BCF         LATD+0, 5 
	GOTO        L__lcd_print214
L__lcd_print213:
	BSF         LATD+0, 5 
L__lcd_print214:
;TestProject.c,225 :: 		LATD.B4 = a.bit0;
	BTFSC       R0, 0 
	GOTO        L__lcd_print215
	BCF         LATD+0, 4 
	GOTO        L__lcd_print216
L__lcd_print215:
	BSF         LATD+0, 4 
L__lcd_print216:
;TestProject.c,226 :: 		nop();
	NOP
;TestProject.c,227 :: 		EN = 0;
	BCF         LATA+0, 5 
;TestProject.c,228 :: 		nop();
	NOP
;TestProject.c,229 :: 		}
L_end_lcd_print:
	RETURN      0
; end of _lcd_print

_lcd_char:

;TestProject.c,231 :: 		void lcd_char(unsigned char dat){
;TestProject.c,232 :: 		RS = 1;
	BSF         LATA+0, 4 
;TestProject.c,233 :: 		delay_ms(1);
	MOVLW       3
	MOVWF       R12, 0
	MOVLW       151
	MOVWF       R13, 0
L_lcd_char46:
	DECFSZ      R13, 1, 1
	BRA         L_lcd_char46
	DECFSZ      R12, 1, 1
	BRA         L_lcd_char46
	NOP
	NOP
;TestProject.c,234 :: 		lcd_print(dat);
	MOVF        FARG_lcd_char_dat+0, 0 
	MOVWF       FARG_lcd_print_dat+0 
	CALL        _lcd_print+0, 0
;TestProject.c,235 :: 		}
L_end_lcd_char:
	RETURN      0
; end of _lcd_char

_lcd_Command:

;TestProject.c,237 :: 		void lcd_Command(unsigned char cmd){
;TestProject.c,238 :: 		RS = 0;
	BCF         LATA+0, 4 
;TestProject.c,239 :: 		delay_ms(1);
	MOVLW       3
	MOVWF       R12, 0
	MOVLW       151
	MOVWF       R13, 0
L_lcd_Command47:
	DECFSZ      R13, 1, 1
	BRA         L_lcd_Command47
	DECFSZ      R12, 1, 1
	BRA         L_lcd_Command47
	NOP
	NOP
;TestProject.c,240 :: 		lcd_print(cmd);
	MOVF        FARG_lcd_Command_cmd+0, 0 
	MOVWF       FARG_lcd_print_dat+0 
	CALL        _lcd_print+0, 0
;TestProject.c,241 :: 		}
L_end_lcd_Command:
	RETURN      0
; end of _lcd_Command

_lcd_string:

;TestProject.c,243 :: 		void lcd_string(char *str)
;TestProject.c,244 :: 		{    unsigned char i = 0;
	CLRF        lcd_string_i_L0+0 
;TestProject.c,245 :: 		while(str[i]!='\0')
L_lcd_string48:
	MOVF        lcd_string_i_L0+0, 0 
	ADDWF       FARG_lcd_string_str+0, 0 
	MOVWF       FSR0L+0 
	MOVLW       0
	ADDWFC      FARG_lcd_string_str+1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_lcd_string49
;TestProject.c,247 :: 		lcd_char(str[i]);
	MOVF        lcd_string_i_L0+0, 0 
	ADDWF       FARG_lcd_string_str+0, 0 
	MOVWF       FSR0L+0 
	MOVLW       0
	ADDWFC      FARG_lcd_string_str+1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_lcd_char_dat+0 
	CALL        _lcd_char+0, 0
;TestProject.c,248 :: 		i++;
	INCF        lcd_string_i_L0+0, 1 
;TestProject.c,249 :: 		}
	GOTO        L_lcd_string48
L_lcd_string49:
;TestProject.c,250 :: 		}
L_end_lcd_string:
	RETURN      0
; end of _lcd_string

_LCD_Command_first:

;TestProject.c,252 :: 		void LCD_Command_first(){
;TestProject.c,253 :: 		RS = 0;
	BCF         LATA+0, 4 
;TestProject.c,254 :: 		EN = 1;
	BSF         LATA+0, 5 
;TestProject.c,255 :: 		delay_ms(1);
	MOVLW       3
	MOVWF       R12, 0
	MOVLW       151
	MOVWF       R13, 0
L_LCD_Command_first50:
	DECFSZ      R13, 1, 1
	BRA         L_LCD_Command_first50
	DECFSZ      R12, 1, 1
	BRA         L_LCD_Command_first50
	NOP
	NOP
;TestProject.c,256 :: 		LATD.B7 = 0;
	BCF         LATD+0, 7 
;TestProject.c,257 :: 		LATD.B6 = 0;
	BCF         LATD+0, 6 
;TestProject.c,258 :: 		LATD.B5 = 1;
	BSF         LATD+0, 5 
;TestProject.c,259 :: 		LATD.B4 = 1;
	BSF         LATD+0, 4 
;TestProject.c,260 :: 		EN = 0;
	BCF         LATA+0, 5 
;TestProject.c,261 :: 		delay_ms(1);
	MOVLW       3
	MOVWF       R12, 0
	MOVLW       151
	MOVWF       R13, 0
L_LCD_Command_first51:
	DECFSZ      R13, 1, 1
	BRA         L_LCD_Command_first51
	DECFSZ      R12, 1, 1
	BRA         L_LCD_Command_first51
	NOP
	NOP
;TestProject.c,262 :: 		}
L_end_LCD_Command_first:
	RETURN      0
; end of _LCD_Command_first

_lcd_Init:

;TestProject.c,264 :: 		void lcd_Init(){
;TestProject.c,265 :: 		ADCON1 = 0b0001111;
	MOVLW       15
	MOVWF       ADCON1+0 
;TestProject.c,267 :: 		TRISA.B5 = 0;
	BCF         TRISA+0, 5 
;TestProject.c,268 :: 		TRISA.B4 = 0;
	BCF         TRISA+0, 4 
;TestProject.c,270 :: 		TRISD = 0;
	CLRF        TRISD+0 
;TestProject.c,271 :: 		delay_ms(20);
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_lcd_Init52:
	DECFSZ      R13, 1, 1
	BRA         L_lcd_Init52
	DECFSZ      R12, 1, 1
	BRA         L_lcd_Init52
	NOP
	NOP
;TestProject.c,273 :: 		LCD_Command_first();
	CALL        _LCD_Command_first+0, 0
;TestProject.c,274 :: 		delay_us(40);
	MOVLW       26
	MOVWF       R13, 0
L_lcd_Init53:
	DECFSZ      R13, 1, 1
	BRA         L_lcd_Init53
	NOP
;TestProject.c,275 :: 		LCD_Command_first();
	CALL        _LCD_Command_first+0, 0
;TestProject.c,276 :: 		delay_us(40);
	MOVLW       26
	MOVWF       R13, 0
L_lcd_Init54:
	DECFSZ      R13, 1, 1
	BRA         L_lcd_Init54
	NOP
;TestProject.c,277 :: 		LCD_Command_first();
	CALL        _LCD_Command_first+0, 0
;TestProject.c,278 :: 		lcd_Command(0b00101000);
	MOVLW       40
	MOVWF       FARG_lcd_Command_cmd+0 
	CALL        _lcd_Command+0, 0
;TestProject.c,279 :: 		delay_ms(2);
	MOVLW       6
	MOVWF       R12, 0
	MOVLW       48
	MOVWF       R13, 0
L_lcd_Init55:
	DECFSZ      R13, 1, 1
	BRA         L_lcd_Init55
	DECFSZ      R12, 1, 1
	BRA         L_lcd_Init55
	NOP
;TestProject.c,280 :: 		lcd_Command(0b00001111);
	MOVLW       15
	MOVWF       FARG_lcd_Command_cmd+0 
	CALL        _lcd_Command+0, 0
;TestProject.c,281 :: 		delay_ms(2);
	MOVLW       6
	MOVWF       R12, 0
	MOVLW       48
	MOVWF       R13, 0
L_lcd_Init56:
	DECFSZ      R13, 1, 1
	BRA         L_lcd_Init56
	DECFSZ      R12, 1, 1
	BRA         L_lcd_Init56
	NOP
;TestProject.c,282 :: 		lcd_Command(0b00000001);
	MOVLW       1
	MOVWF       FARG_lcd_Command_cmd+0 
	CALL        _lcd_Command+0, 0
;TestProject.c,283 :: 		delay_ms(2);
	MOVLW       6
	MOVWF       R12, 0
	MOVLW       48
	MOVWF       R13, 0
L_lcd_Init57:
	DECFSZ      R13, 1, 1
	BRA         L_lcd_Init57
	DECFSZ      R12, 1, 1
	BRA         L_lcd_Init57
	NOP
;TestProject.c,284 :: 		lcd_Command(0b00000110);
	MOVLW       6
	MOVWF       FARG_lcd_Command_cmd+0 
	CALL        _lcd_Command+0, 0
;TestProject.c,285 :: 		}
L_end_lcd_Init:
	RETURN      0
; end of _lcd_Init

_get_num:

;TestProject.c,287 :: 		int get_num(char ch)         //convert char into int
;TestProject.c,289 :: 		int num = 0;
	CLRF        get_num_num_L0+0 
	CLRF        get_num_num_L0+1 
;TestProject.c,290 :: 		switch(ch)
	GOTO        L_get_num58
;TestProject.c,292 :: 		case '0':
L_get_num60:
;TestProject.c,293 :: 		num = 0;
	CLRF        get_num_num_L0+0 
	CLRF        get_num_num_L0+1 
;TestProject.c,294 :: 		break;
	GOTO        L_get_num59
;TestProject.c,295 :: 		case '1':
L_get_num61:
;TestProject.c,296 :: 		num = 1;
	MOVLW       1
	MOVWF       get_num_num_L0+0 
	MOVLW       0
	MOVWF       get_num_num_L0+1 
;TestProject.c,297 :: 		break;
	GOTO        L_get_num59
;TestProject.c,298 :: 		case '2':
L_get_num62:
;TestProject.c,299 :: 		num = 2;
	MOVLW       2
	MOVWF       get_num_num_L0+0 
	MOVLW       0
	MOVWF       get_num_num_L0+1 
;TestProject.c,300 :: 		break;
	GOTO        L_get_num59
;TestProject.c,301 :: 		case '3':
L_get_num63:
;TestProject.c,302 :: 		num = 3;
	MOVLW       3
	MOVWF       get_num_num_L0+0 
	MOVLW       0
	MOVWF       get_num_num_L0+1 
;TestProject.c,303 :: 		break;
	GOTO        L_get_num59
;TestProject.c,304 :: 		case '4':
L_get_num64:
;TestProject.c,305 :: 		num = 4;
	MOVLW       4
	MOVWF       get_num_num_L0+0 
	MOVLW       0
	MOVWF       get_num_num_L0+1 
;TestProject.c,306 :: 		break;
	GOTO        L_get_num59
;TestProject.c,307 :: 		case '5':
L_get_num65:
;TestProject.c,308 :: 		num = 5;
	MOVLW       5
	MOVWF       get_num_num_L0+0 
	MOVLW       0
	MOVWF       get_num_num_L0+1 
;TestProject.c,309 :: 		break;
	GOTO        L_get_num59
;TestProject.c,310 :: 		case '6':
L_get_num66:
;TestProject.c,311 :: 		num = 6;
	MOVLW       6
	MOVWF       get_num_num_L0+0 
	MOVLW       0
	MOVWF       get_num_num_L0+1 
;TestProject.c,312 :: 		break;
	GOTO        L_get_num59
;TestProject.c,313 :: 		case '7':
L_get_num67:
;TestProject.c,314 :: 		num = 7;
	MOVLW       7
	MOVWF       get_num_num_L0+0 
	MOVLW       0
	MOVWF       get_num_num_L0+1 
;TestProject.c,315 :: 		break;
	GOTO        L_get_num59
;TestProject.c,316 :: 		case '8':
L_get_num68:
;TestProject.c,317 :: 		num = 8;
	MOVLW       8
	MOVWF       get_num_num_L0+0 
	MOVLW       0
	MOVWF       get_num_num_L0+1 
;TestProject.c,318 :: 		break;
	GOTO        L_get_num59
;TestProject.c,319 :: 		case '9':
L_get_num69:
;TestProject.c,320 :: 		num = 9;
	MOVLW       9
	MOVWF       get_num_num_L0+0 
	MOVLW       0
	MOVWF       get_num_num_L0+1 
;TestProject.c,321 :: 		break;
	GOTO        L_get_num59
;TestProject.c,322 :: 		case 'A':
L_get_num70:
;TestProject.c,323 :: 		num = 0xA;
	MOVLW       10
	MOVWF       get_num_num_L0+0 
	MOVLW       0
	MOVWF       get_num_num_L0+1 
;TestProject.c,324 :: 		break;
	GOTO        L_get_num59
;TestProject.c,325 :: 		case 'B':
L_get_num71:
;TestProject.c,326 :: 		num = 0xb;
	MOVLW       11
	MOVWF       get_num_num_L0+0 
	MOVLW       0
	MOVWF       get_num_num_L0+1 
;TestProject.c,327 :: 		break;
	GOTO        L_get_num59
;TestProject.c,328 :: 		case 'C':
L_get_num72:
;TestProject.c,329 :: 		num = 0xc;
	MOVLW       12
	MOVWF       get_num_num_L0+0 
	MOVLW       0
	MOVWF       get_num_num_L0+1 
;TestProject.c,330 :: 		break;
	GOTO        L_get_num59
;TestProject.c,331 :: 		case 'D':
L_get_num73:
;TestProject.c,332 :: 		num = 0xd;
	MOVLW       13
	MOVWF       get_num_num_L0+0 
	MOVLW       0
	MOVWF       get_num_num_L0+1 
;TestProject.c,333 :: 		break;
	GOTO        L_get_num59
;TestProject.c,334 :: 		case 'E':
L_get_num74:
;TestProject.c,335 :: 		num = 0xe;
	MOVLW       14
	MOVWF       get_num_num_L0+0 
	MOVLW       0
	MOVWF       get_num_num_L0+1 
;TestProject.c,336 :: 		break;
	GOTO        L_get_num59
;TestProject.c,337 :: 		case 'F':
L_get_num75:
;TestProject.c,338 :: 		num = 0xf;
	MOVLW       15
	MOVWF       get_num_num_L0+0 
	MOVLW       0
	MOVWF       get_num_num_L0+1 
;TestProject.c,339 :: 		break;
	GOTO        L_get_num59
;TestProject.c,340 :: 		}
L_get_num58:
	MOVF        FARG_get_num_ch+0, 0 
	XORLW       48
	BTFSC       STATUS+0, 2 
	GOTO        L_get_num60
	MOVF        FARG_get_num_ch+0, 0 
	XORLW       49
	BTFSC       STATUS+0, 2 
	GOTO        L_get_num61
	MOVF        FARG_get_num_ch+0, 0 
	XORLW       50
	BTFSC       STATUS+0, 2 
	GOTO        L_get_num62
	MOVF        FARG_get_num_ch+0, 0 
	XORLW       51
	BTFSC       STATUS+0, 2 
	GOTO        L_get_num63
	MOVF        FARG_get_num_ch+0, 0 
	XORLW       52
	BTFSC       STATUS+0, 2 
	GOTO        L_get_num64
	MOVF        FARG_get_num_ch+0, 0 
	XORLW       53
	BTFSC       STATUS+0, 2 
	GOTO        L_get_num65
	MOVF        FARG_get_num_ch+0, 0 
	XORLW       54
	BTFSC       STATUS+0, 2 
	GOTO        L_get_num66
	MOVF        FARG_get_num_ch+0, 0 
	XORLW       55
	BTFSC       STATUS+0, 2 
	GOTO        L_get_num67
	MOVF        FARG_get_num_ch+0, 0 
	XORLW       56
	BTFSC       STATUS+0, 2 
	GOTO        L_get_num68
	MOVF        FARG_get_num_ch+0, 0 
	XORLW       57
	BTFSC       STATUS+0, 2 
	GOTO        L_get_num69
	MOVF        FARG_get_num_ch+0, 0 
	XORLW       65
	BTFSC       STATUS+0, 2 
	GOTO        L_get_num70
	MOVF        FARG_get_num_ch+0, 0 
	XORLW       66
	BTFSC       STATUS+0, 2 
	GOTO        L_get_num71
	MOVF        FARG_get_num_ch+0, 0 
	XORLW       67
	BTFSC       STATUS+0, 2 
	GOTO        L_get_num72
	MOVF        FARG_get_num_ch+0, 0 
	XORLW       68
	BTFSC       STATUS+0, 2 
	GOTO        L_get_num73
	MOVF        FARG_get_num_ch+0, 0 
	XORLW       69
	BTFSC       STATUS+0, 2 
	GOTO        L_get_num74
	MOVF        FARG_get_num_ch+0, 0 
	XORLW       70
	BTFSC       STATUS+0, 2 
	GOTO        L_get_num75
L_get_num59:
;TestProject.c,341 :: 		return num;
	MOVF        get_num_num_L0+0, 0 
	MOVWF       R0 
	MOVF        get_num_num_L0+1, 0 
	MOVWF       R1 
;TestProject.c,342 :: 		}
L_end_get_num:
	RETURN      0
; end of _get_num

_get_char:

;TestProject.c,344 :: 		char get_char(int ch)
;TestProject.c,346 :: 		char num = 'N';
	MOVLW       78
	MOVWF       get_char_num_L0+0 
;TestProject.c,347 :: 		switch(ch)
	GOTO        L_get_char76
;TestProject.c,349 :: 		case 0:
L_get_char78:
;TestProject.c,350 :: 		num = '0';
	MOVLW       48
	MOVWF       get_char_num_L0+0 
;TestProject.c,351 :: 		break;
	GOTO        L_get_char77
;TestProject.c,352 :: 		case 1:
L_get_char79:
;TestProject.c,353 :: 		num = '1';
	MOVLW       49
	MOVWF       get_char_num_L0+0 
;TestProject.c,354 :: 		break;
	GOTO        L_get_char77
;TestProject.c,355 :: 		case 2:
L_get_char80:
;TestProject.c,356 :: 		num = '2';
	MOVLW       50
	MOVWF       get_char_num_L0+0 
;TestProject.c,357 :: 		break;
	GOTO        L_get_char77
;TestProject.c,358 :: 		case 3:
L_get_char81:
;TestProject.c,359 :: 		num = '3';
	MOVLW       51
	MOVWF       get_char_num_L0+0 
;TestProject.c,360 :: 		break;
	GOTO        L_get_char77
;TestProject.c,361 :: 		case 4:
L_get_char82:
;TestProject.c,362 :: 		num = '4';
	MOVLW       52
	MOVWF       get_char_num_L0+0 
;TestProject.c,363 :: 		break;
	GOTO        L_get_char77
;TestProject.c,364 :: 		case 5:
L_get_char83:
;TestProject.c,365 :: 		num = '5';
	MOVLW       53
	MOVWF       get_char_num_L0+0 
;TestProject.c,366 :: 		break;
	GOTO        L_get_char77
;TestProject.c,367 :: 		case 6:
L_get_char84:
;TestProject.c,368 :: 		num = '6';
	MOVLW       54
	MOVWF       get_char_num_L0+0 
;TestProject.c,369 :: 		break;
	GOTO        L_get_char77
;TestProject.c,370 :: 		case 7:
L_get_char85:
;TestProject.c,371 :: 		num = '7';
	MOVLW       55
	MOVWF       get_char_num_L0+0 
;TestProject.c,372 :: 		break;
	GOTO        L_get_char77
;TestProject.c,373 :: 		case 8:
L_get_char86:
;TestProject.c,374 :: 		num = '8';
	MOVLW       56
	MOVWF       get_char_num_L0+0 
;TestProject.c,375 :: 		break;
	GOTO        L_get_char77
;TestProject.c,376 :: 		case 9:
L_get_char87:
;TestProject.c,377 :: 		num = '9';
	MOVLW       57
	MOVWF       get_char_num_L0+0 
;TestProject.c,378 :: 		break;
	GOTO        L_get_char77
;TestProject.c,379 :: 		case 0xa:
L_get_char88:
;TestProject.c,380 :: 		num = 'A';
	MOVLW       65
	MOVWF       get_char_num_L0+0 
;TestProject.c,381 :: 		break;
	GOTO        L_get_char77
;TestProject.c,382 :: 		case 0xb:
L_get_char89:
;TestProject.c,383 :: 		num = 'B';
	MOVLW       66
	MOVWF       get_char_num_L0+0 
;TestProject.c,384 :: 		break;
	GOTO        L_get_char77
;TestProject.c,385 :: 		case 0xc:
L_get_char90:
;TestProject.c,386 :: 		num = 'C';
	MOVLW       67
	MOVWF       get_char_num_L0+0 
;TestProject.c,387 :: 		break;
	GOTO        L_get_char77
;TestProject.c,388 :: 		case 0xd:
L_get_char91:
;TestProject.c,389 :: 		num = 'D';
	MOVLW       68
	MOVWF       get_char_num_L0+0 
;TestProject.c,390 :: 		break;
	GOTO        L_get_char77
;TestProject.c,391 :: 		case 0xe:
L_get_char92:
;TestProject.c,392 :: 		num = 'E';
	MOVLW       69
	MOVWF       get_char_num_L0+0 
;TestProject.c,393 :: 		break;
	GOTO        L_get_char77
;TestProject.c,394 :: 		case 0xf:
L_get_char93:
;TestProject.c,395 :: 		num = 'F';
	MOVLW       70
	MOVWF       get_char_num_L0+0 
;TestProject.c,396 :: 		break;
	GOTO        L_get_char77
;TestProject.c,397 :: 		}
L_get_char76:
	MOVLW       0
	XORWF       FARG_get_char_ch+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__get_char224
	MOVLW       0
	XORWF       FARG_get_char_ch+0, 0 
L__get_char224:
	BTFSC       STATUS+0, 2 
	GOTO        L_get_char78
	MOVLW       0
	XORWF       FARG_get_char_ch+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__get_char225
	MOVLW       1
	XORWF       FARG_get_char_ch+0, 0 
L__get_char225:
	BTFSC       STATUS+0, 2 
	GOTO        L_get_char79
	MOVLW       0
	XORWF       FARG_get_char_ch+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__get_char226
	MOVLW       2
	XORWF       FARG_get_char_ch+0, 0 
L__get_char226:
	BTFSC       STATUS+0, 2 
	GOTO        L_get_char80
	MOVLW       0
	XORWF       FARG_get_char_ch+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__get_char227
	MOVLW       3
	XORWF       FARG_get_char_ch+0, 0 
L__get_char227:
	BTFSC       STATUS+0, 2 
	GOTO        L_get_char81
	MOVLW       0
	XORWF       FARG_get_char_ch+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__get_char228
	MOVLW       4
	XORWF       FARG_get_char_ch+0, 0 
L__get_char228:
	BTFSC       STATUS+0, 2 
	GOTO        L_get_char82
	MOVLW       0
	XORWF       FARG_get_char_ch+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__get_char229
	MOVLW       5
	XORWF       FARG_get_char_ch+0, 0 
L__get_char229:
	BTFSC       STATUS+0, 2 
	GOTO        L_get_char83
	MOVLW       0
	XORWF       FARG_get_char_ch+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__get_char230
	MOVLW       6
	XORWF       FARG_get_char_ch+0, 0 
L__get_char230:
	BTFSC       STATUS+0, 2 
	GOTO        L_get_char84
	MOVLW       0
	XORWF       FARG_get_char_ch+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__get_char231
	MOVLW       7
	XORWF       FARG_get_char_ch+0, 0 
L__get_char231:
	BTFSC       STATUS+0, 2 
	GOTO        L_get_char85
	MOVLW       0
	XORWF       FARG_get_char_ch+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__get_char232
	MOVLW       8
	XORWF       FARG_get_char_ch+0, 0 
L__get_char232:
	BTFSC       STATUS+0, 2 
	GOTO        L_get_char86
	MOVLW       0
	XORWF       FARG_get_char_ch+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__get_char233
	MOVLW       9
	XORWF       FARG_get_char_ch+0, 0 
L__get_char233:
	BTFSC       STATUS+0, 2 
	GOTO        L_get_char87
	MOVLW       0
	XORWF       FARG_get_char_ch+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__get_char234
	MOVLW       10
	XORWF       FARG_get_char_ch+0, 0 
L__get_char234:
	BTFSC       STATUS+0, 2 
	GOTO        L_get_char88
	MOVLW       0
	XORWF       FARG_get_char_ch+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__get_char235
	MOVLW       11
	XORWF       FARG_get_char_ch+0, 0 
L__get_char235:
	BTFSC       STATUS+0, 2 
	GOTO        L_get_char89
	MOVLW       0
	XORWF       FARG_get_char_ch+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__get_char236
	MOVLW       12
	XORWF       FARG_get_char_ch+0, 0 
L__get_char236:
	BTFSC       STATUS+0, 2 
	GOTO        L_get_char90
	MOVLW       0
	XORWF       FARG_get_char_ch+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__get_char237
	MOVLW       13
	XORWF       FARG_get_char_ch+0, 0 
L__get_char237:
	BTFSC       STATUS+0, 2 
	GOTO        L_get_char91
	MOVLW       0
	XORWF       FARG_get_char_ch+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__get_char238
	MOVLW       14
	XORWF       FARG_get_char_ch+0, 0 
L__get_char238:
	BTFSC       STATUS+0, 2 
	GOTO        L_get_char92
	MOVLW       0
	XORWF       FARG_get_char_ch+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__get_char239
	MOVLW       15
	XORWF       FARG_get_char_ch+0, 0 
L__get_char239:
	BTFSC       STATUS+0, 2 
	GOTO        L_get_char93
L_get_char77:
;TestProject.c,398 :: 		return num;
	MOVF        get_char_num_L0+0, 0 
	MOVWF       R0 
;TestProject.c,399 :: 		}
L_end_get_char:
	RETURN      0
; end of _get_char

_oct_to_dec:

;TestProject.c,402 :: 		int oct_to_dec(long int number) {
;TestProject.c,403 :: 		unsigned long int num_new = 0;
	CLRF        oct_to_dec_num_new_L0+0 
	CLRF        oct_to_dec_num_new_L0+1 
	CLRF        oct_to_dec_num_new_L0+2 
	CLRF        oct_to_dec_num_new_L0+3 
	MOVLW       1
	MOVWF       oct_to_dec_stepen_L0+0 
	MOVLW       0
	MOVWF       oct_to_dec_stepen_L0+1 
;TestProject.c,406 :: 		while (number > 0) {
L_oct_to_dec94:
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       FARG_oct_to_dec_number+3, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__oct_to_dec241
	MOVF        FARG_oct_to_dec_number+2, 0 
	SUBLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L__oct_to_dec241
	MOVF        FARG_oct_to_dec_number+1, 0 
	SUBLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L__oct_to_dec241
	MOVF        FARG_oct_to_dec_number+0, 0 
	SUBLW       0
L__oct_to_dec241:
	BTFSC       STATUS+0, 0 
	GOTO        L_oct_to_dec95
;TestProject.c,407 :: 		last_dig = (number % 10) * stepen;
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVWF       R6 
	MOVWF       R7 
	MOVF        FARG_oct_to_dec_number+0, 0 
	MOVWF       R0 
	MOVF        FARG_oct_to_dec_number+1, 0 
	MOVWF       R1 
	MOVF        FARG_oct_to_dec_number+2, 0 
	MOVWF       R2 
	MOVF        FARG_oct_to_dec_number+3, 0 
	MOVWF       R3 
	CALL        _Div_32x32_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVF        R10, 0 
	MOVWF       R2 
	MOVF        R11, 0 
	MOVWF       R3 
	MOVF        oct_to_dec_stepen_L0+0, 0 
	MOVWF       R4 
	MOVF        oct_to_dec_stepen_L0+1, 0 
	MOVWF       R5 
	MOVLW       0
	BTFSC       oct_to_dec_stepen_L0+1, 7 
	MOVLW       255
	MOVWF       R6 
	MOVWF       R7 
	CALL        _Mul_32x32_U+0, 0
;TestProject.c,408 :: 		num_new = num_new + last_dig;
	MOVF        R0, 0 
	ADDWF       oct_to_dec_num_new_L0+0, 1 
	MOVF        R1, 0 
	ADDWFC      oct_to_dec_num_new_L0+1, 1 
	MOVF        R2, 0 
	ADDWFC      oct_to_dec_num_new_L0+2, 1 
	MOVF        R3, 0 
	ADDWFC      oct_to_dec_num_new_L0+3, 1 
;TestProject.c,409 :: 		number /= 10;
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVWF       R6 
	MOVWF       R7 
	MOVF        FARG_oct_to_dec_number+0, 0 
	MOVWF       R0 
	MOVF        FARG_oct_to_dec_number+1, 0 
	MOVWF       R1 
	MOVF        FARG_oct_to_dec_number+2, 0 
	MOVWF       R2 
	MOVF        FARG_oct_to_dec_number+3, 0 
	MOVWF       R3 
	CALL        _Div_32x32_S+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_oct_to_dec_number+0 
	MOVF        R1, 0 
	MOVWF       FARG_oct_to_dec_number+1 
	MOVF        R2, 0 
	MOVWF       FARG_oct_to_dec_number+2 
	MOVF        R3, 0 
	MOVWF       FARG_oct_to_dec_number+3 
;TestProject.c,410 :: 		stepen *= 8;
	MOVLW       3
	MOVWF       R0 
	MOVF        R0, 0 
L__oct_to_dec242:
	BZ          L__oct_to_dec243
	RLCF        oct_to_dec_stepen_L0+0, 1 
	BCF         oct_to_dec_stepen_L0+0, 0 
	RLCF        oct_to_dec_stepen_L0+1, 1 
	ADDLW       255
	GOTO        L__oct_to_dec242
L__oct_to_dec243:
;TestProject.c,411 :: 		}
	GOTO        L_oct_to_dec94
L_oct_to_dec95:
;TestProject.c,412 :: 		return num_new;
	MOVF        oct_to_dec_num_new_L0+0, 0 
	MOVWF       R0 
	MOVF        oct_to_dec_num_new_L0+1, 0 
	MOVWF       R1 
;TestProject.c,413 :: 		}
L_end_oct_to_dec:
	RETURN      0
; end of _oct_to_dec

_dec_to_oct:

;TestProject.c,416 :: 		int dec_to_oct(long int number) {
;TestProject.c,417 :: 		long int num_new = 0;
	CLRF        dec_to_oct_num_new_L0+0 
	CLRF        dec_to_oct_num_new_L0+1 
	CLRF        dec_to_oct_num_new_L0+2 
	CLRF        dec_to_oct_num_new_L0+3 
	MOVLW       78
	MOVWF       dec_to_oct_res_L0+0 
	MOVLW       78
	MOVWF       dec_to_oct_res_L0+1 
	MOVLW       78
	MOVWF       dec_to_oct_res_L0+2 
	MOVLW       78
	MOVWF       dec_to_oct_res_L0+3 
	MOVLW       78
	MOVWF       dec_to_oct_res_L0+4 
	MOVLW       78
	MOVWF       dec_to_oct_res_L0+5 
	MOVLW       1
	MOVWF       dec_to_oct_stepen_L0+0 
	MOVLW       0
	MOVWF       dec_to_oct_stepen_L0+1 
	CLRF        dec_to_oct_i_L0+0 
	CLRF        dec_to_oct_i_L0+1 
	CLRF        dec_to_oct_n_L0+0 
	CLRF        dec_to_oct_n_L0+1 
;TestProject.c,420 :: 		if(number == 0){
	MOVLW       0
	MOVWF       R0 
	XORWF       FARG_dec_to_oct_number+3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__dec_to_oct245
	MOVF        R0, 0 
	XORWF       FARG_dec_to_oct_number+2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__dec_to_oct245
	MOVF        R0, 0 
	XORWF       FARG_dec_to_oct_number+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__dec_to_oct245
	MOVF        FARG_dec_to_oct_number+0, 0 
	XORLW       0
L__dec_to_oct245:
	BTFSS       STATUS+0, 2 
	GOTO        L_dec_to_oct96
;TestProject.c,421 :: 		lcd_char('0');
	MOVLW       48
	MOVWF       FARG_lcd_char_dat+0 
	CALL        _lcd_char+0, 0
;TestProject.c,422 :: 		}
L_dec_to_oct96:
;TestProject.c,423 :: 		while (number > 0) {
L_dec_to_oct97:
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       FARG_dec_to_oct_number+3, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__dec_to_oct246
	MOVF        FARG_dec_to_oct_number+2, 0 
	SUBLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L__dec_to_oct246
	MOVF        FARG_dec_to_oct_number+1, 0 
	SUBLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L__dec_to_oct246
	MOVF        FARG_dec_to_oct_number+0, 0 
	SUBLW       0
L__dec_to_oct246:
	BTFSC       STATUS+0, 0 
	GOTO        L_dec_to_oct98
;TestProject.c,424 :: 		long int last_dig = number % 8;
	MOVLW       8
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVWF       R6 
	MOVWF       R7 
	MOVF        FARG_dec_to_oct_number+0, 0 
	MOVWF       R0 
	MOVF        FARG_dec_to_oct_number+1, 0 
	MOVWF       R1 
	MOVF        FARG_dec_to_oct_number+2, 0 
	MOVWF       R2 
	MOVF        FARG_dec_to_oct_number+3, 0 
	MOVWF       R3 
	CALL        _Div_32x32_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVF        R10, 0 
	MOVWF       R2 
	MOVF        R11, 0 
	MOVWF       R3 
	MOVF        R0, 0 
	MOVWF       FLOC__dec_to_oct+2 
	MOVF        R1, 0 
	MOVWF       FLOC__dec_to_oct+3 
	MOVF        R2, 0 
	MOVWF       FLOC__dec_to_oct+4 
	MOVF        R3, 0 
	MOVWF       FLOC__dec_to_oct+5 
	MOVF        FLOC__dec_to_oct+2, 0 
	MOVWF       R0 
	MOVF        FLOC__dec_to_oct+3, 0 
	MOVWF       R1 
	MOVF        FLOC__dec_to_oct+4, 0 
	MOVWF       R2 
	MOVF        FLOC__dec_to_oct+5, 0 
	MOVWF       R3 
	MOVF        dec_to_oct_stepen_L0+0, 0 
	MOVWF       R4 
	MOVF        dec_to_oct_stepen_L0+1, 0 
	MOVWF       R5 
	MOVLW       0
	BTFSC       dec_to_oct_stepen_L0+1, 7 
	MOVLW       255
	MOVWF       R6 
	MOVWF       R7 
	CALL        _Mul_32x32_U+0, 0
;TestProject.c,425 :: 		num_new = num_new + last_dig*stepen;
	MOVF        R0, 0 
	ADDWF       dec_to_oct_num_new_L0+0, 1 
	MOVF        R1, 0 
	ADDWFC      dec_to_oct_num_new_L0+1, 1 
	MOVF        R2, 0 
	ADDWFC      dec_to_oct_num_new_L0+2, 1 
	MOVF        R3, 0 
	ADDWFC      dec_to_oct_num_new_L0+3, 1 
;TestProject.c,426 :: 		number = number / 8;
	MOVLW       8
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVWF       R6 
	MOVWF       R7 
	MOVF        FARG_dec_to_oct_number+0, 0 
	MOVWF       R0 
	MOVF        FARG_dec_to_oct_number+1, 0 
	MOVWF       R1 
	MOVF        FARG_dec_to_oct_number+2, 0 
	MOVWF       R2 
	MOVF        FARG_dec_to_oct_number+3, 0 
	MOVWF       R3 
	CALL        _Div_32x32_S+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_dec_to_oct_number+0 
	MOVF        R1, 0 
	MOVWF       FARG_dec_to_oct_number+1 
	MOVF        R2, 0 
	MOVWF       FARG_dec_to_oct_number+2 
	MOVF        R3, 0 
	MOVWF       FARG_dec_to_oct_number+3 
;TestProject.c,427 :: 		stepen *= 10;
	MOVF        dec_to_oct_stepen_L0+0, 0 
	MOVWF       R0 
	MOVF        dec_to_oct_stepen_L0+1, 0 
	MOVWF       R1 
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVF        R0, 0 
	MOVWF       dec_to_oct_stepen_L0+0 
	MOVF        R1, 0 
	MOVWF       dec_to_oct_stepen_L0+1 
;TestProject.c,428 :: 		res[n] = get_char(last_dig);
	MOVLW       dec_to_oct_res_L0+0
	ADDWF       dec_to_oct_n_L0+0, 0 
	MOVWF       FLOC__dec_to_oct+0 
	MOVLW       hi_addr(dec_to_oct_res_L0+0)
	ADDWFC      dec_to_oct_n_L0+1, 0 
	MOVWF       FLOC__dec_to_oct+1 
	MOVF        FLOC__dec_to_oct+2, 0 
	MOVWF       FARG_get_char_ch+0 
	MOVF        FLOC__dec_to_oct+3, 0 
	MOVWF       FARG_get_char_ch+1 
	CALL        _get_char+0, 0
	MOVFF       FLOC__dec_to_oct+0, FSR1L+0
	MOVFF       FLOC__dec_to_oct+1, FSR1H+0
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;TestProject.c,429 :: 		n ++;
	INFSNZ      dec_to_oct_n_L0+0, 1 
	INCF        dec_to_oct_n_L0+1, 1 
;TestProject.c,430 :: 		}
	GOTO        L_dec_to_oct97
L_dec_to_oct98:
;TestProject.c,431 :: 		for(i = 0; i<n; i++){
	CLRF        dec_to_oct_i_L0+0 
	CLRF        dec_to_oct_i_L0+1 
L_dec_to_oct99:
	MOVLW       128
	XORWF       dec_to_oct_i_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORWF       dec_to_oct_n_L0+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__dec_to_oct247
	MOVF        dec_to_oct_n_L0+0, 0 
	SUBWF       dec_to_oct_i_L0+0, 0 
L__dec_to_oct247:
	BTFSC       STATUS+0, 0 
	GOTO        L_dec_to_oct100
;TestProject.c,432 :: 		if(res[n-1-i]!='N'){
	MOVLW       1
	SUBWF       dec_to_oct_n_L0+0, 0 
	MOVWF       R0 
	MOVLW       0
	SUBWFB      dec_to_oct_n_L0+1, 0 
	MOVWF       R1 
	MOVF        dec_to_oct_i_L0+0, 0 
	SUBWF       R0, 1 
	MOVF        dec_to_oct_i_L0+1, 0 
	SUBWFB      R1, 1 
	MOVLW       dec_to_oct_res_L0+0
	ADDWF       R0, 0 
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(dec_to_oct_res_L0+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	XORLW       78
	BTFSC       STATUS+0, 2 
	GOTO        L_dec_to_oct102
;TestProject.c,433 :: 		lcd_char(res[n-i-1]);
	MOVF        dec_to_oct_i_L0+0, 0 
	SUBWF       dec_to_oct_n_L0+0, 0 
	MOVWF       R0 
	MOVF        dec_to_oct_i_L0+1, 0 
	SUBWFB      dec_to_oct_n_L0+1, 0 
	MOVWF       R1 
	MOVLW       1
	SUBWF       R0, 1 
	MOVLW       0
	SUBWFB      R1, 1 
	MOVLW       dec_to_oct_res_L0+0
	ADDWF       R0, 0 
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(dec_to_oct_res_L0+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_lcd_char_dat+0 
	CALL        _lcd_char+0, 0
;TestProject.c,434 :: 		}
L_dec_to_oct102:
;TestProject.c,431 :: 		for(i = 0; i<n; i++){
	INFSNZ      dec_to_oct_i_L0+0, 1 
	INCF        dec_to_oct_i_L0+1, 1 
;TestProject.c,435 :: 		}
	GOTO        L_dec_to_oct99
L_dec_to_oct100:
;TestProject.c,437 :: 		return num_new;
	MOVF        dec_to_oct_num_new_L0+0, 0 
	MOVWF       R0 
	MOVF        dec_to_oct_num_new_L0+1, 0 
	MOVWF       R1 
;TestProject.c,438 :: 		}
L_end_dec_to_oct:
	RETURN      0
; end of _dec_to_oct

_print_num:

;TestProject.c,440 :: 		void print_num(long int number){
;TestProject.c,441 :: 		unsigned int i = 0, n = 0;
	CLRF        print_num_i_L0+0 
	CLRF        print_num_i_L0+1 
	CLRF        print_num_n_L0+0 
	CLRF        print_num_n_L0+1 
	MOVLW       78
	MOVWF       print_num_result_L0+0 
	MOVLW       78
	MOVWF       print_num_result_L0+1 
	MOVLW       78
	MOVWF       print_num_result_L0+2 
	MOVLW       78
	MOVWF       print_num_result_L0+3 
	MOVLW       78
	MOVWF       print_num_result_L0+4 
	MOVLW       78
	MOVWF       print_num_result_L0+5 
;TestProject.c,443 :: 		if(number == 0){
	MOVLW       0
	MOVWF       R0 
	XORWF       FARG_print_num_number+3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__print_num249
	MOVF        R0, 0 
	XORWF       FARG_print_num_number+2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__print_num249
	MOVF        R0, 0 
	XORWF       FARG_print_num_number+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__print_num249
	MOVF        FARG_print_num_number+0, 0 
	XORLW       0
L__print_num249:
	BTFSS       STATUS+0, 2 
	GOTO        L_print_num103
;TestProject.c,444 :: 		lcd_char('0');
	MOVLW       48
	MOVWF       FARG_lcd_char_dat+0 
	CALL        _lcd_char+0, 0
;TestProject.c,445 :: 		}
L_print_num103:
;TestProject.c,446 :: 		while(number > 0){
L_print_num104:
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       FARG_print_num_number+3, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__print_num250
	MOVF        FARG_print_num_number+2, 0 
	SUBLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L__print_num250
	MOVF        FARG_print_num_number+1, 0 
	SUBLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L__print_num250
	MOVF        FARG_print_num_number+0, 0 
	SUBLW       0
L__print_num250:
	BTFSC       STATUS+0, 0 
	GOTO        L_print_num105
;TestProject.c,447 :: 		result[n] = get_char(number%10);
	MOVLW       print_num_result_L0+0
	ADDWF       print_num_n_L0+0, 0 
	MOVWF       FLOC__print_num+0 
	MOVLW       hi_addr(print_num_result_L0+0)
	ADDWFC      print_num_n_L0+1, 0 
	MOVWF       FLOC__print_num+1 
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVWF       R6 
	MOVWF       R7 
	MOVF        FARG_print_num_number+0, 0 
	MOVWF       R0 
	MOVF        FARG_print_num_number+1, 0 
	MOVWF       R1 
	MOVF        FARG_print_num_number+2, 0 
	MOVWF       R2 
	MOVF        FARG_print_num_number+3, 0 
	MOVWF       R3 
	CALL        _Div_32x32_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVF        R10, 0 
	MOVWF       R2 
	MOVF        R11, 0 
	MOVWF       R3 
	MOVF        R0, 0 
	MOVWF       FARG_get_char_ch+0 
	MOVF        R1, 0 
	MOVWF       FARG_get_char_ch+1 
	CALL        _get_char+0, 0
	MOVFF       FLOC__print_num+0, FSR1L+0
	MOVFF       FLOC__print_num+1, FSR1H+0
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;TestProject.c,448 :: 		number = number / 10;
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVWF       R6 
	MOVWF       R7 
	MOVF        FARG_print_num_number+0, 0 
	MOVWF       R0 
	MOVF        FARG_print_num_number+1, 0 
	MOVWF       R1 
	MOVF        FARG_print_num_number+2, 0 
	MOVWF       R2 
	MOVF        FARG_print_num_number+3, 0 
	MOVWF       R3 
	CALL        _Div_32x32_S+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_print_num_number+0 
	MOVF        R1, 0 
	MOVWF       FARG_print_num_number+1 
	MOVF        R2, 0 
	MOVWF       FARG_print_num_number+2 
	MOVF        R3, 0 
	MOVWF       FARG_print_num_number+3 
;TestProject.c,449 :: 		n++;
	INFSNZ      print_num_n_L0+0, 1 
	INCF        print_num_n_L0+1, 1 
;TestProject.c,450 :: 		};
	GOTO        L_print_num104
L_print_num105:
;TestProject.c,451 :: 		for(i = 0; i<n; i++){
	CLRF        print_num_i_L0+0 
	CLRF        print_num_i_L0+1 
L_print_num106:
	MOVF        print_num_n_L0+1, 0 
	SUBWF       print_num_i_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__print_num251
	MOVF        print_num_n_L0+0, 0 
	SUBWF       print_num_i_L0+0, 0 
L__print_num251:
	BTFSC       STATUS+0, 0 
	GOTO        L_print_num107
;TestProject.c,452 :: 		if(result[n-1-i]!='N'){
	MOVLW       1
	SUBWF       print_num_n_L0+0, 0 
	MOVWF       R0 
	MOVLW       0
	SUBWFB      print_num_n_L0+1, 0 
	MOVWF       R1 
	MOVF        print_num_i_L0+0, 0 
	SUBWF       R0, 1 
	MOVF        print_num_i_L0+1, 0 
	SUBWFB      R1, 1 
	MOVLW       print_num_result_L0+0
	ADDWF       R0, 0 
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(print_num_result_L0+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	XORLW       78
	BTFSC       STATUS+0, 2 
	GOTO        L_print_num109
;TestProject.c,453 :: 		lcd_char(result[n-i-1]);
	MOVF        print_num_i_L0+0, 0 
	SUBWF       print_num_n_L0+0, 0 
	MOVWF       R0 
	MOVF        print_num_i_L0+1, 0 
	SUBWFB      print_num_n_L0+1, 0 
	MOVWF       R1 
	MOVLW       1
	SUBWF       R0, 1 
	MOVLW       0
	SUBWFB      R1, 1 
	MOVLW       print_num_result_L0+0
	ADDWF       R0, 0 
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(print_num_result_L0+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_lcd_char_dat+0 
	CALL        _lcd_char+0, 0
;TestProject.c,454 :: 		}
L_print_num109:
;TestProject.c,451 :: 		for(i = 0; i<n; i++){
	INFSNZ      print_num_i_L0+0, 1 
	INCF        print_num_i_L0+1, 1 
;TestProject.c,455 :: 		}
	GOTO        L_print_num106
L_print_num107:
;TestProject.c,456 :: 		}
L_end_print_num:
	RETURN      0
; end of _print_num

_USART_Init:

;TestProject.c,458 :: 		void USART_Init()
;TestProject.c,460 :: 		TRISC.B6 = 1;
	BSF         TRISC+0, 6 
;TestProject.c,461 :: 		TRISC.B7 = 1;
	BSF         TRISC+0, 7 
;TestProject.c,462 :: 		SPBRG=16;  //baud rate=9600, SPBRG = 10M/64*(9600+1)
	MOVLW       16
	MOVWF       SPBRG+0 
;TestProject.c,463 :: 		TXSTA=0b00100000;
	MOVLW       32
	MOVWF       TXSTA+0 
;TestProject.c,464 :: 		RCSTA=0b10010000;
	MOVLW       144
	MOVWF       RCSTA+0 
;TestProject.c,465 :: 		}
L_end_USART_Init:
	RETURN      0
; end of _USART_Init

_USART_TxChar:

;TestProject.c,467 :: 		unsigned char USART_TxChar(char data_in)
;TestProject.c,469 :: 		if(PIR1.TXIF==1) {
	BTFSS       PIR1+0, 4 
	GOTO        L_USART_TxChar110
;TestProject.c,470 :: 		TXREG = data_in;
	MOVF        FARG_USART_TxChar_data_in+0, 0 
	MOVWF       TXREG+0 
;TestProject.c,471 :: 		return true;
	MOVLW       1
	MOVWF       R0 
	GOTO        L_end_USART_TxChar
;TestProject.c,472 :: 		};
L_USART_TxChar110:
;TestProject.c,473 :: 		return false;
	CLRF        R0 
;TestProject.c,474 :: 		}
L_end_USART_TxChar:
	RETURN      0
; end of _USART_TxChar

_USART_RxChar:

;TestProject.c,476 :: 		char USART_RxChar()
;TestProject.c,478 :: 		if(RCSTA.OERR)
	BTFSS       RCSTA+0, 1 
	GOTO        L_USART_RxChar111
;TestProject.c,480 :: 		LATC.B5 = 0;//CREN = 0;
	BCF         LATC+0, 5 
;TestProject.c,481 :: 		nop();
	NOP
;TestProject.c,482 :: 		LATC.B5 = 1;//CREN=1;
	BSF         LATC+0, 5 
;TestProject.c,483 :: 		}
L_USART_RxChar111:
;TestProject.c,484 :: 		return(RCREG);
	MOVF        RCREG+0, 0 
	MOVWF       R0 
;TestProject.c,485 :: 		}
L_end_USART_RxChar:
	RETURN      0
; end of _USART_RxChar

_clear_all:

;TestProject.c,487 :: 		void clear_all(){
;TestProject.c,488 :: 		number1.byte0 = 0;
	CLRF        _number1+0 
	CLRF        _number1+1 
	CLRF        _number1+2 
	CLRF        _number1+3 
;TestProject.c,489 :: 		number1.byte1 = 0;
	CLRF        _number1+4 
	CLRF        _number1+5 
	CLRF        _number1+6 
	CLRF        _number1+7 
;TestProject.c,490 :: 		number1.byte2 = 0;
	CLRF        _number1+8 
	CLRF        _number1+9 
	CLRF        _number1+10 
	CLRF        _number1+11 
;TestProject.c,491 :: 		number1.counter = 0;
	CLRF        _number1+12 
	CLRF        _number1+13 
	CLRF        _number1+14 
	CLRF        _number1+15 
;TestProject.c,493 :: 		number2.byte0 = 0;
	CLRF        _number2+0 
	CLRF        _number2+1 
	CLRF        _number2+2 
	CLRF        _number2+3 
;TestProject.c,494 :: 		number2.byte1 = 0;
	CLRF        _number2+4 
	CLRF        _number2+5 
	CLRF        _number2+6 
	CLRF        _number2+7 
;TestProject.c,495 :: 		number2.byte2 = 0;
	CLRF        _number2+8 
	CLRF        _number2+9 
	CLRF        _number2+10 
	CLRF        _number2+11 
;TestProject.c,496 :: 		number2.counter = 0;
	CLRF        _number2+12 
	CLRF        _number2+13 
	CLRF        _number2+14 
	CLRF        _number2+15 
;TestProject.c,497 :: 		}
L_end_clear_all:
	RETURN      0
; end of _clear_all

_decodPressedKey:

;TestProject.c,499 :: 		void decodPressedKey(unsigned char key) {
;TestProject.c,501 :: 		switch (state) {
	GOTO        L_decodPressedKey112
;TestProject.c,502 :: 		case WAIT_FIRST_DIGIT:
L_decodPressedKey114:
;TestProject.c,504 :: 		lcd_char(key);
	MOVF        FARG_decodPressedKey_key+0, 0 
	MOVWF       FARG_lcd_char_dat+0 
	CALL        _lcd_char+0, 0
;TestProject.c,505 :: 		if((number1.counter<3)&&(key!='+' && key!='-' && key!='*' && key!='/' && key!='8' && key!='9' && key!='=')){
	MOVLW       128
	XORWF       _number1+15, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__decodPressedKey257
	MOVLW       0
	SUBWF       _number1+14, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__decodPressedKey257
	MOVLW       0
	SUBWF       _number1+13, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__decodPressedKey257
	MOVLW       3
	SUBWF       _number1+12, 0 
L__decodPressedKey257:
	BTFSC       STATUS+0, 0 
	GOTO        L_decodPressedKey119
	MOVF        FARG_decodPressedKey_key+0, 0 
	XORLW       43
	BTFSC       STATUS+0, 2 
	GOTO        L_decodPressedKey119
	MOVF        FARG_decodPressedKey_key+0, 0 
	XORLW       45
	BTFSC       STATUS+0, 2 
	GOTO        L_decodPressedKey119
	MOVF        FARG_decodPressedKey_key+0, 0 
	XORLW       42
	BTFSC       STATUS+0, 2 
	GOTO        L_decodPressedKey119
	MOVF        FARG_decodPressedKey_key+0, 0 
	XORLW       47
	BTFSC       STATUS+0, 2 
	GOTO        L_decodPressedKey119
	MOVF        FARG_decodPressedKey_key+0, 0 
	XORLW       56
	BTFSC       STATUS+0, 2 
	GOTO        L_decodPressedKey119
	MOVF        FARG_decodPressedKey_key+0, 0 
	XORLW       57
	BTFSC       STATUS+0, 2 
	GOTO        L_decodPressedKey119
	MOVF        FARG_decodPressedKey_key+0, 0 
	XORLW       61
	BTFSC       STATUS+0, 2 
	GOTO        L_decodPressedKey119
L__decodPressedKey194:
L__decodPressedKey193:
;TestProject.c,506 :: 		data_in = get_num(key);
	MOVF        FARG_decodPressedKey_key+0, 0 
	MOVWF       FARG_get_num_ch+0 
	CALL        _get_num+0, 0
	MOVF        R0, 0 
	MOVWF       decodPressedKey_data_in_L0+0 
;TestProject.c,507 :: 		if(number1.counter == 2)
	MOVLW       0
	MOVWF       R0 
	XORWF       _number1+15, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__decodPressedKey258
	MOVF        R0, 0 
	XORWF       _number1+14, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__decodPressedKey258
	MOVF        R0, 0 
	XORWF       _number1+13, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__decodPressedKey258
	MOVF        _number1+12, 0 
	XORLW       2
L__decodPressedKey258:
	BTFSS       STATUS+0, 2 
	GOTO        L_decodPressedKey120
;TestProject.c,509 :: 		number1.byte0 = data_in;
	MOVF        decodPressedKey_data_in_L0+0, 0 
	MOVWF       _number1+0 
	MOVLW       0
	MOVWF       _number1+1 
	MOVWF       _number1+2 
	MOVWF       _number1+3 
;TestProject.c,510 :: 		number1.counter ++;
	MOVLW       1
	ADDWF       _number1+12, 0 
	MOVWF       R0 
	MOVLW       0
	ADDWFC      _number1+13, 0 
	MOVWF       R1 
	MOVLW       0
	ADDWFC      _number1+14, 0 
	MOVWF       R2 
	MOVLW       0
	ADDWFC      _number1+15, 0 
	MOVWF       R3 
	MOVF        R0, 0 
	MOVWF       _number1+12 
	MOVF        R1, 0 
	MOVWF       _number1+13 
	MOVF        R2, 0 
	MOVWF       _number1+14 
	MOVF        R3, 0 
	MOVWF       _number1+15 
;TestProject.c,511 :: 		state = WAIT_OPERATION;
	MOVLW       1
	MOVWF       _state+0 
;TestProject.c,512 :: 		}
L_decodPressedKey120:
;TestProject.c,513 :: 		if(number1.counter == 1)
	MOVLW       0
	MOVWF       R0 
	XORWF       _number1+15, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__decodPressedKey259
	MOVF        R0, 0 
	XORWF       _number1+14, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__decodPressedKey259
	MOVF        R0, 0 
	XORWF       _number1+13, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__decodPressedKey259
	MOVF        _number1+12, 0 
	XORLW       1
L__decodPressedKey259:
	BTFSS       STATUS+0, 2 
	GOTO        L_decodPressedKey121
;TestProject.c,515 :: 		number1.byte1 = data_in;
	MOVF        decodPressedKey_data_in_L0+0, 0 
	MOVWF       _number1+4 
	MOVLW       0
	MOVWF       _number1+5 
	MOVWF       _number1+6 
	MOVWF       _number1+7 
;TestProject.c,516 :: 		number1.counter ++;
	MOVLW       1
	ADDWF       _number1+12, 0 
	MOVWF       R0 
	MOVLW       0
	ADDWFC      _number1+13, 0 
	MOVWF       R1 
	MOVLW       0
	ADDWFC      _number1+14, 0 
	MOVWF       R2 
	MOVLW       0
	ADDWFC      _number1+15, 0 
	MOVWF       R3 
	MOVF        R0, 0 
	MOVWF       _number1+12 
	MOVF        R1, 0 
	MOVWF       _number1+13 
	MOVF        R2, 0 
	MOVWF       _number1+14 
	MOVF        R3, 0 
	MOVWF       _number1+15 
;TestProject.c,517 :: 		}
L_decodPressedKey121:
;TestProject.c,518 :: 		if(number1.counter == 0)
	MOVLW       0
	MOVWF       R0 
	XORWF       _number1+15, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__decodPressedKey260
	MOVF        R0, 0 
	XORWF       _number1+14, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__decodPressedKey260
	MOVF        R0, 0 
	XORWF       _number1+13, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__decodPressedKey260
	MOVF        _number1+12, 0 
	XORLW       0
L__decodPressedKey260:
	BTFSS       STATUS+0, 2 
	GOTO        L_decodPressedKey122
;TestProject.c,520 :: 		number1.byte2 = data_in;
	MOVF        decodPressedKey_data_in_L0+0, 0 
	MOVWF       _number1+8 
	MOVLW       0
	MOVWF       _number1+9 
	MOVWF       _number1+10 
	MOVWF       _number1+11 
;TestProject.c,521 :: 		number1.counter ++;
	MOVLW       1
	ADDWF       _number1+12, 0 
	MOVWF       R0 
	MOVLW       0
	ADDWFC      _number1+13, 0 
	MOVWF       R1 
	MOVLW       0
	ADDWFC      _number1+14, 0 
	MOVWF       R2 
	MOVLW       0
	ADDWFC      _number1+15, 0 
	MOVWF       R3 
	MOVF        R0, 0 
	MOVWF       _number1+12 
	MOVF        R1, 0 
	MOVWF       _number1+13 
	MOVF        R2, 0 
	MOVWF       _number1+14 
	MOVF        R3, 0 
	MOVWF       _number1+15 
;TestProject.c,522 :: 		}
L_decodPressedKey122:
;TestProject.c,523 :: 		}
	GOTO        L_decodPressedKey123
L_decodPressedKey119:
;TestProject.c,525 :: 		if((key=='+' || key=='-' || key=='*' || key=='/')&&number1.counter>0){
	MOVF        FARG_decodPressedKey_key+0, 0 
	XORLW       43
	BTFSC       STATUS+0, 2 
	GOTO        L__decodPressedKey192
	MOVF        FARG_decodPressedKey_key+0, 0 
	XORLW       45
	BTFSC       STATUS+0, 2 
	GOTO        L__decodPressedKey192
	MOVF        FARG_decodPressedKey_key+0, 0 
	XORLW       42
	BTFSC       STATUS+0, 2 
	GOTO        L__decodPressedKey192
	MOVF        FARG_decodPressedKey_key+0, 0 
	XORLW       47
	BTFSC       STATUS+0, 2 
	GOTO        L__decodPressedKey192
	GOTO        L_decodPressedKey128
L__decodPressedKey192:
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       _number1+15, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__decodPressedKey261
	MOVF        _number1+14, 0 
	SUBLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L__decodPressedKey261
	MOVF        _number1+13, 0 
	SUBLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L__decodPressedKey261
	MOVF        _number1+12, 0 
	SUBLW       0
L__decodPressedKey261:
	BTFSC       STATUS+0, 0 
	GOTO        L_decodPressedKey128
L__decodPressedKey191:
;TestProject.c,526 :: 		operation = key;
	MOVF        FARG_decodPressedKey_key+0, 0 
	MOVWF       _operation+0 
;TestProject.c,527 :: 		state = WAIT_SECOND_DIGIT;
	MOVLW       2
	MOVWF       _state+0 
;TestProject.c,529 :: 		}
	GOTO        L_decodPressedKey129
L_decodPressedKey128:
;TestProject.c,531 :: 		lcd_string("Wrong Input");
	MOVLW       ?lstr1_TestProject+0
	MOVWF       FARG_lcd_string_str+0 
	MOVLW       hi_addr(?lstr1_TestProject+0)
	MOVWF       FARG_lcd_string_str+1 
	CALL        _lcd_string+0, 0
;TestProject.c,532 :: 		nop();
	NOP
;TestProject.c,533 :: 		nop();
	NOP
;TestProject.c,534 :: 		lcd_Command(0b00000001);
	MOVLW       1
	MOVWF       FARG_lcd_Command_cmd+0 
	CALL        _lcd_Command+0, 0
;TestProject.c,535 :: 		state = WAIT_FIRST_DIGIT;
	CLRF        _state+0 
;TestProject.c,536 :: 		clear_all();
	CALL        _clear_all+0, 0
;TestProject.c,537 :: 		}
L_decodPressedKey129:
;TestProject.c,538 :: 		}
L_decodPressedKey123:
;TestProject.c,539 :: 		break;
	GOTO        L_decodPressedKey113
;TestProject.c,541 :: 		case WAIT_SECOND_DIGIT:
L_decodPressedKey130:
;TestProject.c,543 :: 		lcd_char(key);
	MOVF        FARG_decodPressedKey_key+0, 0 
	MOVWF       FARG_lcd_char_dat+0 
	CALL        _lcd_char+0, 0
;TestProject.c,544 :: 		if((number2.counter<3)&&(key!='+' && key!='-' && key!='*' && key!='/' && key!='8' && key!='9' && key!='=')){
	MOVLW       128
	XORWF       _number2+15, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__decodPressedKey262
	MOVLW       0
	SUBWF       _number2+14, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__decodPressedKey262
	MOVLW       0
	SUBWF       _number2+13, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__decodPressedKey262
	MOVLW       3
	SUBWF       _number2+12, 0 
L__decodPressedKey262:
	BTFSC       STATUS+0, 0 
	GOTO        L_decodPressedKey135
	MOVF        FARG_decodPressedKey_key+0, 0 
	XORLW       43
	BTFSC       STATUS+0, 2 
	GOTO        L_decodPressedKey135
	MOVF        FARG_decodPressedKey_key+0, 0 
	XORLW       45
	BTFSC       STATUS+0, 2 
	GOTO        L_decodPressedKey135
	MOVF        FARG_decodPressedKey_key+0, 0 
	XORLW       42
	BTFSC       STATUS+0, 2 
	GOTO        L_decodPressedKey135
	MOVF        FARG_decodPressedKey_key+0, 0 
	XORLW       47
	BTFSC       STATUS+0, 2 
	GOTO        L_decodPressedKey135
	MOVF        FARG_decodPressedKey_key+0, 0 
	XORLW       56
	BTFSC       STATUS+0, 2 
	GOTO        L_decodPressedKey135
	MOVF        FARG_decodPressedKey_key+0, 0 
	XORLW       57
	BTFSC       STATUS+0, 2 
	GOTO        L_decodPressedKey135
	MOVF        FARG_decodPressedKey_key+0, 0 
	XORLW       61
	BTFSC       STATUS+0, 2 
	GOTO        L_decodPressedKey135
L__decodPressedKey190:
L__decodPressedKey189:
;TestProject.c,545 :: 		data_in = get_num(key);
	MOVF        FARG_decodPressedKey_key+0, 0 
	MOVWF       FARG_get_num_ch+0 
	CALL        _get_num+0, 0
	MOVF        R0, 0 
	MOVWF       decodPressedKey_data_in_L0+0 
;TestProject.c,546 :: 		if(number2.counter == 2)
	MOVLW       0
	MOVWF       R0 
	XORWF       _number2+15, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__decodPressedKey263
	MOVF        R0, 0 
	XORWF       _number2+14, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__decodPressedKey263
	MOVF        R0, 0 
	XORWF       _number2+13, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__decodPressedKey263
	MOVF        _number2+12, 0 
	XORLW       2
L__decodPressedKey263:
	BTFSS       STATUS+0, 2 
	GOTO        L_decodPressedKey136
;TestProject.c,548 :: 		number2.byte0 = data_in;
	MOVF        decodPressedKey_data_in_L0+0, 0 
	MOVWF       _number2+0 
	MOVLW       0
	MOVWF       _number2+1 
	MOVWF       _number2+2 
	MOVWF       _number2+3 
;TestProject.c,549 :: 		number2.counter ++;
	MOVLW       1
	ADDWF       _number2+12, 0 
	MOVWF       R0 
	MOVLW       0
	ADDWFC      _number2+13, 0 
	MOVWF       R1 
	MOVLW       0
	ADDWFC      _number2+14, 0 
	MOVWF       R2 
	MOVLW       0
	ADDWFC      _number2+15, 0 
	MOVWF       R3 
	MOVF        R0, 0 
	MOVWF       _number2+12 
	MOVF        R1, 0 
	MOVWF       _number2+13 
	MOVF        R2, 0 
	MOVWF       _number2+14 
	MOVF        R3, 0 
	MOVWF       _number2+15 
;TestProject.c,550 :: 		state = DO_OPERATION;
	MOVLW       3
	MOVWF       _state+0 
;TestProject.c,551 :: 		lcd_char('=');
	MOVLW       61
	MOVWF       FARG_lcd_char_dat+0 
	CALL        _lcd_char+0, 0
;TestProject.c,552 :: 		}
L_decodPressedKey136:
;TestProject.c,553 :: 		if(number2.counter == 1)
	MOVLW       0
	MOVWF       R0 
	XORWF       _number2+15, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__decodPressedKey264
	MOVF        R0, 0 
	XORWF       _number2+14, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__decodPressedKey264
	MOVF        R0, 0 
	XORWF       _number2+13, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__decodPressedKey264
	MOVF        _number2+12, 0 
	XORLW       1
L__decodPressedKey264:
	BTFSS       STATUS+0, 2 
	GOTO        L_decodPressedKey137
;TestProject.c,555 :: 		number2.byte1 = data_in;
	MOVF        decodPressedKey_data_in_L0+0, 0 
	MOVWF       _number2+4 
	MOVLW       0
	MOVWF       _number2+5 
	MOVWF       _number2+6 
	MOVWF       _number2+7 
;TestProject.c,556 :: 		number2.counter ++;
	MOVLW       1
	ADDWF       _number2+12, 0 
	MOVWF       R0 
	MOVLW       0
	ADDWFC      _number2+13, 0 
	MOVWF       R1 
	MOVLW       0
	ADDWFC      _number2+14, 0 
	MOVWF       R2 
	MOVLW       0
	ADDWFC      _number2+15, 0 
	MOVWF       R3 
	MOVF        R0, 0 
	MOVWF       _number2+12 
	MOVF        R1, 0 
	MOVWF       _number2+13 
	MOVF        R2, 0 
	MOVWF       _number2+14 
	MOVF        R3, 0 
	MOVWF       _number2+15 
;TestProject.c,557 :: 		}
L_decodPressedKey137:
;TestProject.c,558 :: 		if(number2.counter == 0)
	MOVLW       0
	MOVWF       R0 
	XORWF       _number2+15, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__decodPressedKey265
	MOVF        R0, 0 
	XORWF       _number2+14, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__decodPressedKey265
	MOVF        R0, 0 
	XORWF       _number2+13, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__decodPressedKey265
	MOVF        _number2+12, 0 
	XORLW       0
L__decodPressedKey265:
	BTFSS       STATUS+0, 2 
	GOTO        L_decodPressedKey138
;TestProject.c,560 :: 		number2.byte2 = data_in;
	MOVF        decodPressedKey_data_in_L0+0, 0 
	MOVWF       _number2+8 
	MOVLW       0
	MOVWF       _number2+9 
	MOVWF       _number2+10 
	MOVWF       _number2+11 
;TestProject.c,561 :: 		number2.counter ++;
	MOVLW       1
	ADDWF       _number2+12, 0 
	MOVWF       R0 
	MOVLW       0
	ADDWFC      _number2+13, 0 
	MOVWF       R1 
	MOVLW       0
	ADDWFC      _number2+14, 0 
	MOVWF       R2 
	MOVLW       0
	ADDWFC      _number2+15, 0 
	MOVWF       R3 
	MOVF        R0, 0 
	MOVWF       _number2+12 
	MOVF        R1, 0 
	MOVWF       _number2+13 
	MOVF        R2, 0 
	MOVWF       _number2+14 
	MOVF        R3, 0 
	MOVWF       _number2+15 
;TestProject.c,562 :: 		}
L_decodPressedKey138:
;TestProject.c,563 :: 		}
	GOTO        L_decodPressedKey139
L_decodPressedKey135:
;TestProject.c,565 :: 		if(key=='=' && number2.counter>0){
	MOVF        FARG_decodPressedKey_key+0, 0 
	XORLW       61
	BTFSS       STATUS+0, 2 
	GOTO        L_decodPressedKey142
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       _number2+15, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__decodPressedKey266
	MOVF        _number2+14, 0 
	SUBLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L__decodPressedKey266
	MOVF        _number2+13, 0 
	SUBLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L__decodPressedKey266
	MOVF        _number2+12, 0 
	SUBLW       0
L__decodPressedKey266:
	BTFSC       STATUS+0, 0 
	GOTO        L_decodPressedKey142
L__decodPressedKey188:
;TestProject.c,566 :: 		state = DO_OPERATION;
	MOVLW       3
	MOVWF       _state+0 
;TestProject.c,568 :: 		}
	GOTO        L_decodPressedKey143
L_decodPressedKey142:
;TestProject.c,570 :: 		lcd_string("Wrong Input");
	MOVLW       ?lstr2_TestProject+0
	MOVWF       FARG_lcd_string_str+0 
	MOVLW       hi_addr(?lstr2_TestProject+0)
	MOVWF       FARG_lcd_string_str+1 
	CALL        _lcd_string+0, 0
;TestProject.c,571 :: 		nop();
	NOP
;TestProject.c,572 :: 		nop();
	NOP
;TestProject.c,573 :: 		lcd_Command(0b00000001);
	MOVLW       1
	MOVWF       FARG_lcd_Command_cmd+0 
	CALL        _lcd_Command+0, 0
;TestProject.c,574 :: 		state = WAIT_FIRST_DIGIT;
	CLRF        _state+0 
;TestProject.c,575 :: 		clear_all();
	CALL        _clear_all+0, 0
;TestProject.c,576 :: 		}
L_decodPressedKey143:
;TestProject.c,577 :: 		}
L_decodPressedKey139:
;TestProject.c,578 :: 		break;
	GOTO        L_decodPressedKey113
;TestProject.c,580 :: 		case WAIT_OPERATION:
L_decodPressedKey144:
;TestProject.c,582 :: 		lcd_char(key);
	MOVF        FARG_decodPressedKey_key+0, 0 
	MOVWF       FARG_lcd_char_dat+0 
	CALL        _lcd_char+0, 0
;TestProject.c,583 :: 		if(key=='+' || key=='-' || key=='*' || key=='/'){
	MOVF        FARG_decodPressedKey_key+0, 0 
	XORLW       43
	BTFSC       STATUS+0, 2 
	GOTO        L__decodPressedKey187
	MOVF        FARG_decodPressedKey_key+0, 0 
	XORLW       45
	BTFSC       STATUS+0, 2 
	GOTO        L__decodPressedKey187
	MOVF        FARG_decodPressedKey_key+0, 0 
	XORLW       42
	BTFSC       STATUS+0, 2 
	GOTO        L__decodPressedKey187
	MOVF        FARG_decodPressedKey_key+0, 0 
	XORLW       47
	BTFSC       STATUS+0, 2 
	GOTO        L__decodPressedKey187
	GOTO        L_decodPressedKey147
L__decodPressedKey187:
;TestProject.c,584 :: 		operation = key;
	MOVF        FARG_decodPressedKey_key+0, 0 
	MOVWF       _operation+0 
;TestProject.c,585 :: 		state = WAIT_SECOND_DIGIT;
	MOVLW       2
	MOVWF       _state+0 
;TestProject.c,586 :: 		}
	GOTO        L_decodPressedKey148
L_decodPressedKey147:
;TestProject.c,588 :: 		lcd_string("Wrong Input");
	MOVLW       ?lstr3_TestProject+0
	MOVWF       FARG_lcd_string_str+0 
	MOVLW       hi_addr(?lstr3_TestProject+0)
	MOVWF       FARG_lcd_string_str+1 
	CALL        _lcd_string+0, 0
;TestProject.c,589 :: 		nop();
	NOP
;TestProject.c,590 :: 		nop();
	NOP
;TestProject.c,591 :: 		lcd_Command(0b00000001);
	MOVLW       1
	MOVWF       FARG_lcd_Command_cmd+0 
	CALL        _lcd_Command+0, 0
;TestProject.c,592 :: 		state = WAIT_FIRST_DIGIT;
	CLRF        _state+0 
;TestProject.c,593 :: 		clear_all();
	CALL        _clear_all+0, 0
;TestProject.c,594 :: 		}
L_decodPressedKey148:
;TestProject.c,595 :: 		break;
	GOTO        L_decodPressedKey113
;TestProject.c,597 :: 		}
L_decodPressedKey112:
	MOVF        _state+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_decodPressedKey114
	MOVF        _state+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_decodPressedKey130
	MOVF        _state+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_decodPressedKey144
L_decodPressedKey113:
;TestProject.c,598 :: 		}
L_end_decodPressedKey:
	RETURN      0
; end of _decodPressedKey

_executeOperation:

;TestProject.c,600 :: 		void executeOperation(termStruct key1, termStruct key2, unsigned char op){
;TestProject.c,601 :: 		long int num1_oct, num2_oct, num1_dec, num2_dec, res_oct = 0, res_dec = 0, t =0;
	CLRF        executeOperation_res_dec_L0+0 
	CLRF        executeOperation_res_dec_L0+1 
	CLRF        executeOperation_res_dec_L0+2 
	CLRF        executeOperation_res_dec_L0+3 
;TestProject.c,603 :: 		if(key1.counter == 1){
	MOVLW       0
	MOVWF       R0 
	XORWF       FARG_executeOperation_key1+15, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__executeOperation268
	MOVF        R0, 0 
	XORWF       FARG_executeOperation_key1+14, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__executeOperation268
	MOVF        R0, 0 
	XORWF       FARG_executeOperation_key1+13, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__executeOperation268
	MOVF        FARG_executeOperation_key1+12, 0 
	XORLW       1
L__executeOperation268:
	BTFSS       STATUS+0, 2 
	GOTO        L_executeOperation149
;TestProject.c,604 :: 		num1_oct = key1.byte2;
	MOVF        FARG_executeOperation_key1+8, 0 
	MOVWF       executeOperation_num1_oct_L0+0 
	MOVF        FARG_executeOperation_key1+9, 0 
	MOVWF       executeOperation_num1_oct_L0+1 
	MOVF        FARG_executeOperation_key1+10, 0 
	MOVWF       executeOperation_num1_oct_L0+2 
	MOVF        FARG_executeOperation_key1+11, 0 
	MOVWF       executeOperation_num1_oct_L0+3 
;TestProject.c,605 :: 		}
	GOTO        L_executeOperation150
L_executeOperation149:
;TestProject.c,606 :: 		else if(key1.counter == 2){
	MOVLW       0
	MOVWF       R0 
	XORWF       FARG_executeOperation_key1+15, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__executeOperation269
	MOVF        R0, 0 
	XORWF       FARG_executeOperation_key1+14, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__executeOperation269
	MOVF        R0, 0 
	XORWF       FARG_executeOperation_key1+13, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__executeOperation269
	MOVF        FARG_executeOperation_key1+12, 0 
	XORLW       2
L__executeOperation269:
	BTFSS       STATUS+0, 2 
	GOTO        L_executeOperation151
;TestProject.c,607 :: 		num1_oct = key1.byte2*10+key1.byte1;
	MOVF        FARG_executeOperation_key1+8, 0 
	MOVWF       R0 
	MOVF        FARG_executeOperation_key1+9, 0 
	MOVWF       R1 
	MOVF        FARG_executeOperation_key1+10, 0 
	MOVWF       R2 
	MOVF        FARG_executeOperation_key1+11, 0 
	MOVWF       R3 
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVWF       R6 
	MOVWF       R7 
	CALL        _Mul_32x32_U+0, 0
	MOVF        FARG_executeOperation_key1+4, 0 
	ADDWF       R0, 0 
	MOVWF       executeOperation_num1_oct_L0+0 
	MOVF        FARG_executeOperation_key1+5, 0 
	ADDWFC      R1, 0 
	MOVWF       executeOperation_num1_oct_L0+1 
	MOVF        FARG_executeOperation_key1+6, 0 
	ADDWFC      R2, 0 
	MOVWF       executeOperation_num1_oct_L0+2 
	MOVF        FARG_executeOperation_key1+7, 0 
	ADDWFC      R3, 0 
	MOVWF       executeOperation_num1_oct_L0+3 
;TestProject.c,608 :: 		}
	GOTO        L_executeOperation152
L_executeOperation151:
;TestProject.c,610 :: 		num1_oct = key1.byte2*100+key1.byte1*10+key1.byte0;
	MOVF        FARG_executeOperation_key1+8, 0 
	MOVWF       R0 
	MOVF        FARG_executeOperation_key1+9, 0 
	MOVWF       R1 
	MOVF        FARG_executeOperation_key1+10, 0 
	MOVWF       R2 
	MOVF        FARG_executeOperation_key1+11, 0 
	MOVWF       R3 
	MOVLW       100
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVWF       R6 
	MOVWF       R7 
	CALL        _Mul_32x32_U+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__executeOperation+0 
	MOVF        R1, 0 
	MOVWF       FLOC__executeOperation+1 
	MOVF        R2, 0 
	MOVWF       FLOC__executeOperation+2 
	MOVF        R3, 0 
	MOVWF       FLOC__executeOperation+3 
	MOVF        FARG_executeOperation_key1+4, 0 
	MOVWF       R0 
	MOVF        FARG_executeOperation_key1+5, 0 
	MOVWF       R1 
	MOVF        FARG_executeOperation_key1+6, 0 
	MOVWF       R2 
	MOVF        FARG_executeOperation_key1+7, 0 
	MOVWF       R3 
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVWF       R6 
	MOVWF       R7 
	CALL        _Mul_32x32_U+0, 0
	MOVF        R0, 0 
	ADDWF       FLOC__executeOperation+0, 0 
	MOVWF       executeOperation_num1_oct_L0+0 
	MOVF        R1, 0 
	ADDWFC      FLOC__executeOperation+1, 0 
	MOVWF       executeOperation_num1_oct_L0+1 
	MOVF        R2, 0 
	ADDWFC      FLOC__executeOperation+2, 0 
	MOVWF       executeOperation_num1_oct_L0+2 
	MOVF        R3, 0 
	ADDWFC      FLOC__executeOperation+3, 0 
	MOVWF       executeOperation_num1_oct_L0+3 
	MOVF        FARG_executeOperation_key1+0, 0 
	ADDWF       executeOperation_num1_oct_L0+0, 1 
	MOVF        FARG_executeOperation_key1+1, 0 
	ADDWFC      executeOperation_num1_oct_L0+1, 1 
	MOVF        FARG_executeOperation_key1+2, 0 
	ADDWFC      executeOperation_num1_oct_L0+2, 1 
	MOVF        FARG_executeOperation_key1+3, 0 
	ADDWFC      executeOperation_num1_oct_L0+3, 1 
;TestProject.c,611 :: 		}
L_executeOperation152:
L_executeOperation150:
;TestProject.c,613 :: 		if(key2.counter == 1){
	MOVLW       0
	MOVWF       R0 
	XORWF       FARG_executeOperation_key2+15, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__executeOperation270
	MOVF        R0, 0 
	XORWF       FARG_executeOperation_key2+14, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__executeOperation270
	MOVF        R0, 0 
	XORWF       FARG_executeOperation_key2+13, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__executeOperation270
	MOVF        FARG_executeOperation_key2+12, 0 
	XORLW       1
L__executeOperation270:
	BTFSS       STATUS+0, 2 
	GOTO        L_executeOperation153
;TestProject.c,614 :: 		num2_oct = key2.byte2;
	MOVF        FARG_executeOperation_key2+8, 0 
	MOVWF       executeOperation_num2_oct_L0+0 
	MOVF        FARG_executeOperation_key2+9, 0 
	MOVWF       executeOperation_num2_oct_L0+1 
	MOVF        FARG_executeOperation_key2+10, 0 
	MOVWF       executeOperation_num2_oct_L0+2 
	MOVF        FARG_executeOperation_key2+11, 0 
	MOVWF       executeOperation_num2_oct_L0+3 
;TestProject.c,615 :: 		}
	GOTO        L_executeOperation154
L_executeOperation153:
;TestProject.c,616 :: 		else if(key2.counter == 2){
	MOVLW       0
	MOVWF       R0 
	XORWF       FARG_executeOperation_key2+15, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__executeOperation271
	MOVF        R0, 0 
	XORWF       FARG_executeOperation_key2+14, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__executeOperation271
	MOVF        R0, 0 
	XORWF       FARG_executeOperation_key2+13, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__executeOperation271
	MOVF        FARG_executeOperation_key2+12, 0 
	XORLW       2
L__executeOperation271:
	BTFSS       STATUS+0, 2 
	GOTO        L_executeOperation155
;TestProject.c,617 :: 		num2_oct = key2.byte2*10+key2.byte1;
	MOVF        FARG_executeOperation_key2+8, 0 
	MOVWF       R0 
	MOVF        FARG_executeOperation_key2+9, 0 
	MOVWF       R1 
	MOVF        FARG_executeOperation_key2+10, 0 
	MOVWF       R2 
	MOVF        FARG_executeOperation_key2+11, 0 
	MOVWF       R3 
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVWF       R6 
	MOVWF       R7 
	CALL        _Mul_32x32_U+0, 0
	MOVF        FARG_executeOperation_key2+4, 0 
	ADDWF       R0, 0 
	MOVWF       executeOperation_num2_oct_L0+0 
	MOVF        FARG_executeOperation_key2+5, 0 
	ADDWFC      R1, 0 
	MOVWF       executeOperation_num2_oct_L0+1 
	MOVF        FARG_executeOperation_key2+6, 0 
	ADDWFC      R2, 0 
	MOVWF       executeOperation_num2_oct_L0+2 
	MOVF        FARG_executeOperation_key2+7, 0 
	ADDWFC      R3, 0 
	MOVWF       executeOperation_num2_oct_L0+3 
;TestProject.c,618 :: 		}
	GOTO        L_executeOperation156
L_executeOperation155:
;TestProject.c,620 :: 		num2_oct = key2.byte2*100+key2.byte1*10+key2.byte0;
	MOVF        FARG_executeOperation_key2+8, 0 
	MOVWF       R0 
	MOVF        FARG_executeOperation_key2+9, 0 
	MOVWF       R1 
	MOVF        FARG_executeOperation_key2+10, 0 
	MOVWF       R2 
	MOVF        FARG_executeOperation_key2+11, 0 
	MOVWF       R3 
	MOVLW       100
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVWF       R6 
	MOVWF       R7 
	CALL        _Mul_32x32_U+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__executeOperation+0 
	MOVF        R1, 0 
	MOVWF       FLOC__executeOperation+1 
	MOVF        R2, 0 
	MOVWF       FLOC__executeOperation+2 
	MOVF        R3, 0 
	MOVWF       FLOC__executeOperation+3 
	MOVF        FARG_executeOperation_key2+4, 0 
	MOVWF       R0 
	MOVF        FARG_executeOperation_key2+5, 0 
	MOVWF       R1 
	MOVF        FARG_executeOperation_key2+6, 0 
	MOVWF       R2 
	MOVF        FARG_executeOperation_key2+7, 0 
	MOVWF       R3 
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVWF       R6 
	MOVWF       R7 
	CALL        _Mul_32x32_U+0, 0
	MOVF        R0, 0 
	ADDWF       FLOC__executeOperation+0, 0 
	MOVWF       executeOperation_num2_oct_L0+0 
	MOVF        R1, 0 
	ADDWFC      FLOC__executeOperation+1, 0 
	MOVWF       executeOperation_num2_oct_L0+1 
	MOVF        R2, 0 
	ADDWFC      FLOC__executeOperation+2, 0 
	MOVWF       executeOperation_num2_oct_L0+2 
	MOVF        R3, 0 
	ADDWFC      FLOC__executeOperation+3, 0 
	MOVWF       executeOperation_num2_oct_L0+3 
	MOVF        FARG_executeOperation_key2+0, 0 
	ADDWF       executeOperation_num2_oct_L0+0, 1 
	MOVF        FARG_executeOperation_key2+1, 0 
	ADDWFC      executeOperation_num2_oct_L0+1, 1 
	MOVF        FARG_executeOperation_key2+2, 0 
	ADDWFC      executeOperation_num2_oct_L0+2, 1 
	MOVF        FARG_executeOperation_key2+3, 0 
	ADDWFC      executeOperation_num2_oct_L0+3, 1 
;TestProject.c,621 :: 		}
L_executeOperation156:
L_executeOperation154:
;TestProject.c,623 :: 		if((num2_oct == 0)&&(op=='/')){
	MOVLW       0
	MOVWF       R0 
	XORWF       executeOperation_num2_oct_L0+3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__executeOperation272
	MOVF        R0, 0 
	XORWF       executeOperation_num2_oct_L0+2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__executeOperation272
	MOVF        R0, 0 
	XORWF       executeOperation_num2_oct_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__executeOperation272
	MOVF        executeOperation_num2_oct_L0+0, 0 
	XORLW       0
L__executeOperation272:
	BTFSS       STATUS+0, 2 
	GOTO        L_executeOperation159
	MOVF        FARG_executeOperation_op+0, 0 
	XORLW       47
	BTFSS       STATUS+0, 2 
	GOTO        L_executeOperation159
L__executeOperation195:
;TestProject.c,624 :: 		lcd_string("Error");
	MOVLW       ?lstr4_TestProject+0
	MOVWF       FARG_lcd_string_str+0 
	MOVLW       hi_addr(?lstr4_TestProject+0)
	MOVWF       FARG_lcd_string_str+1 
	CALL        _lcd_string+0, 0
;TestProject.c,625 :: 		nop();
	NOP
;TestProject.c,626 :: 		nop();
	NOP
;TestProject.c,627 :: 		lcd_Command(0b00000001);
	MOVLW       1
	MOVWF       FARG_lcd_Command_cmd+0 
	CALL        _lcd_Command+0, 0
;TestProject.c,628 :: 		state = WAIT_FIRST_DIGIT;
	CLRF        _state+0 
;TestProject.c,629 :: 		clear_all();
	CALL        _clear_all+0, 0
;TestProject.c,630 :: 		}
	GOTO        L_executeOperation160
L_executeOperation159:
;TestProject.c,632 :: 		num1_dec = oct_to_dec(num1_oct);
	MOVF        executeOperation_num1_oct_L0+0, 0 
	MOVWF       FARG_oct_to_dec_number+0 
	MOVF        executeOperation_num1_oct_L0+1, 0 
	MOVWF       FARG_oct_to_dec_number+1 
	MOVF        executeOperation_num1_oct_L0+2, 0 
	MOVWF       FARG_oct_to_dec_number+2 
	MOVF        executeOperation_num1_oct_L0+3, 0 
	MOVWF       FARG_oct_to_dec_number+3 
	CALL        _oct_to_dec+0, 0
	MOVF        R0, 0 
	MOVWF       executeOperation_num1_dec_L0+0 
	MOVF        R1, 0 
	MOVWF       executeOperation_num1_dec_L0+1 
	MOVLW       0
	BTFSC       R1, 7 
	MOVLW       255
	MOVWF       executeOperation_num1_dec_L0+2 
	MOVWF       executeOperation_num1_dec_L0+3 
;TestProject.c,633 :: 		num2_dec = oct_to_dec(num2_oct);
	MOVF        executeOperation_num2_oct_L0+0, 0 
	MOVWF       FARG_oct_to_dec_number+0 
	MOVF        executeOperation_num2_oct_L0+1, 0 
	MOVWF       FARG_oct_to_dec_number+1 
	MOVF        executeOperation_num2_oct_L0+2, 0 
	MOVWF       FARG_oct_to_dec_number+2 
	MOVF        executeOperation_num2_oct_L0+3, 0 
	MOVWF       FARG_oct_to_dec_number+3 
	CALL        _oct_to_dec+0, 0
	MOVF        R0, 0 
	MOVWF       executeOperation_num2_dec_L0+0 
	MOVF        R1, 0 
	MOVWF       executeOperation_num2_dec_L0+1 
	MOVLW       0
	BTFSC       R1, 7 
	MOVLW       255
	MOVWF       executeOperation_num2_dec_L0+2 
	MOVWF       executeOperation_num2_dec_L0+3 
;TestProject.c,635 :: 		switch(op)
	GOTO        L_executeOperation161
;TestProject.c,637 :: 		case '+':
L_executeOperation163:
;TestProject.c,638 :: 		res_dec = num1_dec+num2_dec;
	MOVF        executeOperation_num2_dec_L0+0, 0 
	ADDWF       executeOperation_num1_dec_L0+0, 0 
	MOVWF       executeOperation_res_dec_L0+0 
	MOVF        executeOperation_num2_dec_L0+1, 0 
	ADDWFC      executeOperation_num1_dec_L0+1, 0 
	MOVWF       executeOperation_res_dec_L0+1 
	MOVF        executeOperation_num2_dec_L0+2, 0 
	ADDWFC      executeOperation_num1_dec_L0+2, 0 
	MOVWF       executeOperation_res_dec_L0+2 
	MOVF        executeOperation_num2_dec_L0+3, 0 
	ADDWFC      executeOperation_num1_dec_L0+3, 0 
	MOVWF       executeOperation_res_dec_L0+3 
;TestProject.c,639 :: 		break;
	GOTO        L_executeOperation162
;TestProject.c,640 :: 		case '-':
L_executeOperation164:
;TestProject.c,641 :: 		res_dec = num1_dec-num2_dec;
	MOVF        executeOperation_num1_dec_L0+0, 0 
	MOVWF       executeOperation_res_dec_L0+0 
	MOVF        executeOperation_num1_dec_L0+1, 0 
	MOVWF       executeOperation_res_dec_L0+1 
	MOVF        executeOperation_num1_dec_L0+2, 0 
	MOVWF       executeOperation_res_dec_L0+2 
	MOVF        executeOperation_num1_dec_L0+3, 0 
	MOVWF       executeOperation_res_dec_L0+3 
	MOVF        executeOperation_num2_dec_L0+0, 0 
	SUBWF       executeOperation_res_dec_L0+0, 1 
	MOVF        executeOperation_num2_dec_L0+1, 0 
	SUBWFB      executeOperation_res_dec_L0+1, 1 
	MOVF        executeOperation_num2_dec_L0+2, 0 
	SUBWFB      executeOperation_res_dec_L0+2, 1 
	MOVF        executeOperation_num2_dec_L0+3, 0 
	SUBWFB      executeOperation_res_dec_L0+3, 1 
;TestProject.c,642 :: 		break;
	GOTO        L_executeOperation162
;TestProject.c,643 :: 		case '*':
L_executeOperation165:
;TestProject.c,644 :: 		res_dec = num1_dec*num2_dec;
	MOVF        executeOperation_num1_dec_L0+0, 0 
	MOVWF       R0 
	MOVF        executeOperation_num1_dec_L0+1, 0 
	MOVWF       R1 
	MOVF        executeOperation_num1_dec_L0+2, 0 
	MOVWF       R2 
	MOVF        executeOperation_num1_dec_L0+3, 0 
	MOVWF       R3 
	MOVF        executeOperation_num2_dec_L0+0, 0 
	MOVWF       R4 
	MOVF        executeOperation_num2_dec_L0+1, 0 
	MOVWF       R5 
	MOVF        executeOperation_num2_dec_L0+2, 0 
	MOVWF       R6 
	MOVF        executeOperation_num2_dec_L0+3, 0 
	MOVWF       R7 
	CALL        _Mul_32x32_U+0, 0
	MOVF        R0, 0 
	MOVWF       executeOperation_res_dec_L0+0 
	MOVF        R1, 0 
	MOVWF       executeOperation_res_dec_L0+1 
	MOVF        R2, 0 
	MOVWF       executeOperation_res_dec_L0+2 
	MOVF        R3, 0 
	MOVWF       executeOperation_res_dec_L0+3 
;TestProject.c,645 :: 		break;
	GOTO        L_executeOperation162
;TestProject.c,646 :: 		case '/':
L_executeOperation166:
;TestProject.c,647 :: 		res_dec = num1_dec/num2_dec;
	MOVF        executeOperation_num2_dec_L0+0, 0 
	MOVWF       R4 
	MOVF        executeOperation_num2_dec_L0+1, 0 
	MOVWF       R5 
	MOVF        executeOperation_num2_dec_L0+2, 0 
	MOVWF       R6 
	MOVF        executeOperation_num2_dec_L0+3, 0 
	MOVWF       R7 
	MOVF        executeOperation_num1_dec_L0+0, 0 
	MOVWF       R0 
	MOVF        executeOperation_num1_dec_L0+1, 0 
	MOVWF       R1 
	MOVF        executeOperation_num1_dec_L0+2, 0 
	MOVWF       R2 
	MOVF        executeOperation_num1_dec_L0+3, 0 
	MOVWF       R3 
	CALL        _Div_32x32_S+0, 0
	MOVF        R0, 0 
	MOVWF       executeOperation_res_dec_L0+0 
	MOVF        R1, 0 
	MOVWF       executeOperation_res_dec_L0+1 
	MOVF        R2, 0 
	MOVWF       executeOperation_res_dec_L0+2 
	MOVF        R3, 0 
	MOVWF       executeOperation_res_dec_L0+3 
;TestProject.c,648 :: 		break;
	GOTO        L_executeOperation162
;TestProject.c,649 :: 		}
L_executeOperation161:
	MOVF        FARG_executeOperation_op+0, 0 
	XORLW       43
	BTFSC       STATUS+0, 2 
	GOTO        L_executeOperation163
	MOVF        FARG_executeOperation_op+0, 0 
	XORLW       45
	BTFSC       STATUS+0, 2 
	GOTO        L_executeOperation164
	MOVF        FARG_executeOperation_op+0, 0 
	XORLW       42
	BTFSC       STATUS+0, 2 
	GOTO        L_executeOperation165
	MOVF        FARG_executeOperation_op+0, 0 
	XORLW       47
	BTFSC       STATUS+0, 2 
	GOTO        L_executeOperation166
L_executeOperation162:
;TestProject.c,650 :: 		if(res_dec<0){
	MOVLW       128
	XORWF       executeOperation_res_dec_L0+3, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__executeOperation273
	MOVLW       0
	SUBWF       executeOperation_res_dec_L0+2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__executeOperation273
	MOVLW       0
	SUBWF       executeOperation_res_dec_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__executeOperation273
	MOVLW       0
	SUBWF       executeOperation_res_dec_L0+0, 0 
L__executeOperation273:
	BTFSC       STATUS+0, 0 
	GOTO        L_executeOperation167
;TestProject.c,651 :: 		lcd_char('-');
	MOVLW       45
	MOVWF       FARG_lcd_char_dat+0 
	CALL        _lcd_char+0, 0
;TestProject.c,653 :: 		t = -res_dec;
	CLRF        R0 
	CLRF        R1 
	CLRF        R2 
	CLRF        R3 
	MOVF        executeOperation_res_dec_L0+0, 0 
	SUBWF       R0, 1 
	MOVF        executeOperation_res_dec_L0+1, 0 
	SUBWFB      R1, 1 
	MOVF        executeOperation_res_dec_L0+2, 0 
	SUBWFB      R2, 1 
	MOVF        executeOperation_res_dec_L0+3, 0 
	SUBWFB      R3, 1 
;TestProject.c,654 :: 		res_dec=t;
	MOVF        R0, 0 
	MOVWF       executeOperation_res_dec_L0+0 
	MOVF        R1, 0 
	MOVWF       executeOperation_res_dec_L0+1 
	MOVF        R2, 0 
	MOVWF       executeOperation_res_dec_L0+2 
	MOVF        R3, 0 
	MOVWF       executeOperation_res_dec_L0+3 
;TestProject.c,655 :: 		}
L_executeOperation167:
;TestProject.c,656 :: 		res_oct = dec_to_oct(res_dec);
	MOVF        executeOperation_res_dec_L0+0, 0 
	MOVWF       FARG_dec_to_oct_number+0 
	MOVF        executeOperation_res_dec_L0+1, 0 
	MOVWF       FARG_dec_to_oct_number+1 
	MOVF        executeOperation_res_dec_L0+2, 0 
	MOVWF       FARG_dec_to_oct_number+2 
	MOVF        executeOperation_res_dec_L0+3, 0 
	MOVWF       FARG_dec_to_oct_number+3 
	CALL        _dec_to_oct+0, 0
;TestProject.c,657 :: 		}
L_executeOperation160:
;TestProject.c,658 :: 		}
L_end_executeOperation:
	RETURN      0
; end of _executeOperation

_main:

;TestProject.c,661 :: 		void main(){
;TestProject.c,662 :: 		IRCF2_bit = 1;
	BSF         IRCF2_bit+0, BitPos(IRCF2_bit+0) 
;TestProject.c,663 :: 		IRCF1_bit = 1;
	BSF         IRCF1_bit+0, BitPos(IRCF1_bit+0) 
;TestProject.c,664 :: 		IRCF0_bit = 1;
	BSF         IRCF0_bit+0, BitPos(IRCF0_bit+0) 
;TestProject.c,666 :: 		lcd_Init();
	CALL        _lcd_Init+0, 0
;TestProject.c,667 :: 		TRISB = 0b00001111;
	MOVLW       15
	MOVWF       TRISB+0 
;TestProject.c,669 :: 		TRISC = 0;
	CLRF        TRISC+0 
;TestProject.c,670 :: 		LATC = 0;
	CLRF        LATC+0 
;TestProject.c,672 :: 		SSPCON1.SSPEN = 0;
	BCF         SSPCON1+0, 5 
;TestProject.c,674 :: 		USART_Init();
	CALL        _USART_Init+0, 0
;TestProject.c,675 :: 		delay_ms(50);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_main168:
	DECFSZ      R13, 1, 1
	BRA         L_main168
	DECFSZ      R12, 1, 1
	BRA         L_main168
	NOP
	NOP
;TestProject.c,677 :: 		currentKeyState = backKeyState;
	MOVLW       8
	MOVWF       R0 
	MOVLW       _currentKeyState+0
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(_currentKeyState+0)
	MOVWF       FSR1L+1 
	MOVLW       _backKeyState+0
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(_backKeyState+0)
	MOVWF       FSR0L+1 
L_main169:
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
	DECF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_main169
;TestProject.c,679 :: 		state = WAIT_FIRST_DIGIT;
	CLRF        _state+0 
;TestProject.c,681 :: 		TMR0L = 0xe0;
	MOVLW       224
	MOVWF       TMR0L+0 
;TestProject.c,682 :: 		TMR0H = 0xb1;
	MOVLW       177
	MOVWF       TMR0H+0 
;TestProject.c,683 :: 		T0CON = 0b10001000;
	MOVLW       136
	MOVWF       T0CON+0 
;TestProject.c,685 :: 		INTCON.TMR0IE = 1;
	BSF         INTCON+0, 5 
;TestProject.c,686 :: 		INTCON.PEIE = 1;
	BSF         INTCON+0, 6 
;TestProject.c,690 :: 		while(1)
L_main170:
;TestProject.c,692 :: 		currentKeyState = answer_key_state();
	MOVLW       FLOC__main+0
	MOVWF       R0 
	MOVLW       hi_addr(FLOC__main+0)
	MOVWF       R1 
	CALL        _answer_key_state+0, 0
	MOVLW       8
	MOVWF       R0 
	MOVLW       _currentKeyState+0
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(_currentKeyState+0)
	MOVWF       FSR1L+1 
	MOVLW       FLOC__main+0
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(FLOC__main+0)
	MOVWF       FSR0L+1 
L_main172:
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
	DECF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_main172
;TestProject.c,694 :: 		if((currentKeyState.b4 != backKeyState.b4) || (currentKeyState.b5 != backKeyState.b5) || (currentKeyState.b6 != backKeyState.b6) || (currentKeyState.b7 != backKeyState.b7)){
	MOVLW       255
	ANDWF       _currentKeyState+0, 0 
	MOVWF       R3 
	MOVF        _currentKeyState+1, 0 
	MOVWF       R4 
	MOVLW       255
	ANDWF       R4, 1 
	MOVLW       255
	ANDWF       _backKeyState+0, 0 
	MOVWF       R1 
	MOVF        _backKeyState+1, 0 
	MOVWF       R2 
	MOVLW       255
	ANDWF       R2, 1 
	MOVF        R4, 0 
	XORWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main275
	MOVF        R1, 0 
	XORWF       R3, 0 
L__main275:
	BTFSS       STATUS+0, 2 
	GOTO        L__main196
	MOVLW       255
	ANDWF       _currentKeyState+2, 0 
	MOVWF       R3 
	MOVF        _currentKeyState+3, 0 
	MOVWF       R4 
	MOVLW       255
	ANDWF       R4, 1 
	MOVLW       255
	ANDWF       _backKeyState+2, 0 
	MOVWF       R1 
	MOVF        _backKeyState+3, 0 
	MOVWF       R2 
	MOVLW       255
	ANDWF       R2, 1 
	MOVF        R4, 0 
	XORWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main276
	MOVF        R1, 0 
	XORWF       R3, 0 
L__main276:
	BTFSS       STATUS+0, 2 
	GOTO        L__main196
	MOVLW       255
	ANDWF       _currentKeyState+4, 0 
	MOVWF       R3 
	MOVF        _currentKeyState+5, 0 
	MOVWF       R4 
	MOVLW       255
	ANDWF       R4, 1 
	MOVLW       255
	ANDWF       _backKeyState+4, 0 
	MOVWF       R1 
	MOVF        _backKeyState+5, 0 
	MOVWF       R2 
	MOVLW       255
	ANDWF       R2, 1 
	MOVF        R4, 0 
	XORWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main277
	MOVF        R1, 0 
	XORWF       R3, 0 
L__main277:
	BTFSS       STATUS+0, 2 
	GOTO        L__main196
	MOVLW       255
	ANDWF       _currentKeyState+6, 0 
	MOVWF       R3 
	MOVF        _currentKeyState+7, 0 
	MOVWF       R4 
	MOVLW       255
	ANDWF       R4, 1 
	MOVLW       255
	ANDWF       _backKeyState+6, 0 
	MOVWF       R1 
	MOVF        _backKeyState+7, 0 
	MOVWF       R2 
	MOVLW       255
	ANDWF       R2, 1 
	MOVF        R4, 0 
	XORWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main278
	MOVF        R1, 0 
	XORWF       R3, 0 
L__main278:
	BTFSS       STATUS+0, 2 
	GOTO        L__main196
	GOTO        L_main175
L__main196:
;TestProject.c,695 :: 		T0CON.TMR0ON = 0;
	BCF         T0CON+0, 7 
;TestProject.c,696 :: 		TMR0L = 0xe0;
	MOVLW       224
	MOVWF       TMR0L+0 
;TestProject.c,697 :: 		TMR0H = 0xb1;
	MOVLW       177
	MOVWF       TMR0H+0 
;TestProject.c,698 :: 		INTCON.TMR0IF = 0;
	BCF         INTCON+0, 2 
;TestProject.c,699 :: 		T0CON.TMR0ON = 1;
	BSF         T0CON+0, 7 
;TestProject.c,700 :: 		}
L_main175:
;TestProject.c,701 :: 		backKeyState = currentKeyState;
	MOVLW       8
	MOVWF       R0 
	MOVLW       _backKeyState+0
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(_backKeyState+0)
	MOVWF       FSR1L+1 
	MOVLW       _currentKeyState+0
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(_currentKeyState+0)
	MOVWF       FSR0L+1 
L_main176:
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
	DECF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_main176
;TestProject.c,703 :: 		if(INTCON.TMR0IF){
	BTFSS       INTCON+0, 2 
	GOTO        L_main177
;TestProject.c,704 :: 		T0CON.TMR0ON = 0;
	BCF         T0CON+0, 7 
;TestProject.c,705 :: 		INTCON.TMR0IF = 0;
	BCF         INTCON+0, 2 
;TestProject.c,706 :: 		counter_ ++;
	INFSNZ      _counter_+0, 1 
	INCF        _counter_+1, 1 
;TestProject.c,707 :: 		buf = read_key_state(currentKeyState);
	MOVLW       8
	MOVWF       R0 
	MOVLW       FARG_read_key_state_cur_state+0
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(FARG_read_key_state_cur_state+0)
	MOVWF       FSR1L+1 
	MOVLW       _currentKeyState+0
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(_currentKeyState+0)
	MOVWF       FSR0L+1 
L_main178:
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
	DECF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_main178
	CALL        _read_key_state+0, 0
	MOVF        R0, 0 
	MOVWF       _buf+0 
;TestProject.c,708 :: 		if (buf != 'N') {
	MOVF        R0, 0 
	XORLW       78
	BTFSC       STATUS+0, 2 
	GOTO        L_main179
;TestProject.c,710 :: 		decodPressedKey(buf);
	MOVF        _buf+0, 0 
	MOVWF       FARG_decodPressedKey_key+0 
	CALL        _decodPressedKey+0, 0
;TestProject.c,711 :: 		};
L_main179:
;TestProject.c,713 :: 		}
L_main177:
;TestProject.c,714 :: 		LATC = counter_;
	MOVF        _counter_+0, 0 
	MOVWF       LATC+0 
;TestProject.c,720 :: 		if (PIR1.RCIF) {
	BTFSS       PIR1+0, 5 
	GOTO        L_main180
;TestProject.c,721 :: 		buf = USART_RxChar();
	CALL        _USART_RxChar+0, 0
	MOVF        R0, 0 
	MOVWF       _buf+0 
;TestProject.c,722 :: 		decodPressedKey(buf);
	MOVF        R0, 0 
	MOVWF       FARG_decodPressedKey_key+0 
	CALL        _decodPressedKey+0, 0
;TestProject.c,723 :: 		}
L_main180:
;TestProject.c,724 :: 		if( buf == 'C'){
	MOVF        _buf+0, 0 
	XORLW       67
	BTFSS       STATUS+0, 2 
	GOTO        L_main181
;TestProject.c,725 :: 		lcd_Command(0b00000001);
	MOVLW       1
	MOVWF       FARG_lcd_Command_cmd+0 
	CALL        _lcd_Command+0, 0
;TestProject.c,726 :: 		clear_all();
	CALL        _clear_all+0, 0
;TestProject.c,727 :: 		}
L_main181:
;TestProject.c,728 :: 		if (state == DO_OPERATION) {
	MOVF        _state+0, 0 
	XORLW       3
	BTFSS       STATUS+0, 2 
	GOTO        L_main182
;TestProject.c,729 :: 		executeOperation(number1,number2,operation);
	MOVLW       16
	MOVWF       R0 
	MOVLW       FARG_executeOperation_key1+0
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(FARG_executeOperation_key1+0)
	MOVWF       FSR1L+1 
	MOVLW       _number1+0
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(_number1+0)
	MOVWF       FSR0L+1 
L_main183:
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
	DECF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_main183
	MOVLW       16
	MOVWF       R0 
	MOVLW       FARG_executeOperation_key2+0
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(FARG_executeOperation_key2+0)
	MOVWF       FSR1L+1 
	MOVLW       _number2+0
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(_number2+0)
	MOVWF       FSR0L+1 
L_main184:
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
	DECF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_main184
	MOVF        _operation+0, 0 
	MOVWF       FARG_executeOperation_op+0 
	CALL        _executeOperation+0, 0
;TestProject.c,730 :: 		clear_all();
	CALL        _clear_all+0, 0
;TestProject.c,731 :: 		state = WAIT_FIRST_DIGIT;
	CLRF        _state+0 
;TestProject.c,732 :: 		}
L_main182:
;TestProject.c,733 :: 		}
	GOTO        L_main170
;TestProject.c,735 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
