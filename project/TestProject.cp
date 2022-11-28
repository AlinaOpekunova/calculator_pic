#line 1 "C:/BIV194/biv193/TestProject.c"
#line 1 "c:/program files (x86)/mikroelectronika/mikroc pro for pic/include/stdio.h"
#line 1 "c:/program files (x86)/mikroelectronika/mikroc pro for pic/include/string.h"





void * memchr(void *p, char n, unsigned int v);
int memcmp(void *s1, void *s2, int n);
void * memcpy(void * d1, void * s1, int n);
void * memmove(void * to, void * from, int n);
void * memset(void * p1, char character, int n);
char * strcat(char * to, char * from);
char * strchr(char * ptr, char chr);
int strcmp(char * s1, char * s2);
char * strcpy(char * to, char * from);
int strlen(char * s);
char * strncat(char * to, char * from, int size);
char * strncpy(char * to, char * from, int size);
int strspn(char * str1, char * str2);
char strcspn(char * s1, char * s2);
int strncmp(char * s1, char * s2, char len);
char * strpbrk(char * s1, char * s2);
char * strrchr(char *ptr, char chr);
char * strstr(char * s1, char * s2);
char * strtok(char * s1, char * s2);
#line 17 "C:/BIV194/biv193/TestProject.c"
typedef union {
 unsigned char byte;
 struct {
 unsigned char bit0: 1;
 unsigned char bit1: 1;
 unsigned char bit2: 1;
 unsigned char bit3: 1;
 unsigned char bit4: 1;
 unsigned char bit5: 1;
 unsigned char bit6: 1;
 unsigned char bit7: 1;
 };
 struct {
 unsigned char lowNibble: 4;
 unsigned char highNibble: 4;
 };
} MyByte;

typedef union {
 long int byte;
 struct {
 long int byte0;
 long int byte1;
 long int byte2;
 long int counter;
 };
} termStruct;

enum State_program{
 WAIT_FIRST_DIGIT,
 WAIT_OPERATION,
 WAIT_SECOND_DIGIT,
 DO_OPERATION} state;

typedef union {
 unsigned char byte;
 struct {
 unsigned char b4: 0b11101111;
 unsigned char b5: 0b11011111;
 unsigned char b6: 0b10111111;
 unsigned char b7: 0b01111111;
 };
} key_state;

char operation;
char buf = 'N';
termStruct number1;
termStruct number2;
key_state currentKeyState;
key_state backKeyState;

key_state answer_key_state(){
key_state cur_state;
 LATB.B5 = 1;
 LATB.B6 = 1;
 LATB.B7 = 1;
 LATB.B4 = 0;
 nop();
 nop();
 cur_state.b4 = PORTB;
 LATB.B4 = 1;
 LATB.B5 = 0;
 nop();
 nop();
 cur_state.b5 = PORTB;
 LATB.B5 = 1;
 LATB.B6 = 0;
 nop();
 nop();
 cur_state.b6 = PORTB;
 LATB.B6 = 1;
 LATB.B7 = 0;
 nop();
 nop();
 cur_state.b7 = PORTB;
 LATB.B7 = 1;
 return cur_state;
}

unsigned char read_key_state(key_state cur_state){
 unsigned char def = 'N';
 unsigned char num = cur_state.b4;
 switch(num){
 case 0b11100111:
 def = 0x2b;
 break;
 case 0b11101011:
 def = 0x33;
 break;
 case 0b11101101:
 def = 0x32;
 break;
 case 0b11101110:
 def = 0x31;
 break;
 }
 num = cur_state.b5;
 switch(num){
 case 0b11010111:
 def = '-';
 break;
 case 0b11011011:
 def = 0x36;
 break;
 case 0b11011101:
 def = 0x35;
 break;
 case 0b11011110:
 def = 0x34;
 break;
 }
 num = cur_state.b6;
 switch(num){
 case 0b10110111:
 def = 0x2a;
 break;
 case 0b10111011:
 def = 0x39;
 break;
 case 0b10111101:
 def = 0x38;
 break;
 case 0b10111110:
 def = 0x37;
 break;
 }
 num = cur_state.b7;
 switch(num){
 case 0b01110111:
 def = 0x2f;
 break;
 case 0b01111011:
 def = 0x3d;
 break;
 case 0b01111101:
 def = 0x30;
 break;
 case 0b01111110:
 def = 0x43;
 break;
 }
 return def;
}

unsigned char keypad_readkey()
{
 LATB.B4 = 1;
 LATB.B5 = 1;
 LATB.B6 = 1;
 LATB.B7 = 1;
 delay_ms(5);

 LATB.B4 = 0;
 delay_ms(100);
 if(PORTB.B0 == 0) {return 0x31;}
 if(PORTB.B1 == 0) {return 0x32;}
 if(PORTB.B2 == 0) {return 0x33;}
 if(PORTB.B3 == 0) {return 0x2B;}
 LATB.B4 = 1;
 LATB.B5 = 0;
 LATB.B6 = 1;
 LATB.B7 = 1;
 delay_ms(100);
 if(PORTB.B0 == 0) {return 0x34;}
 if(PORTB.B1 == 0) {return 0x35;}
 if(PORTB.B2 == 0) {return 0x36;}
 if(PORTB.B3 == 0) {return '-';}

 LATB.B4 = 1;
 LATB.B5 = 1;
 LATB.B6 = 0;
 LATB.B7 = 1;
 delay_ms(100);
 if(PORTB.B0 == 0) {return 0x37;}
 if(PORTB.B1 == 0) {return 0x38;}
 if(PORTB.B2 == 0) {return 0x39;}
 if(PORTB.B3 == 0) {return 0x2A;}

 LATB.B4 = 1;
 LATB.B5 = 1;
 LATB.B6 = 1;
 LATB.B7 = 0;
 delay_ms(100);
 if(PORTB.B0 == 0) {return 0x43;}
 if(PORTB.B1 == 0) {return 0x30;}
 if(PORTB.B2 == 0) {return 0x3D;}
 if(PORTB.B3 == 0) {return 0x2F;}
 LATB.B7 = 1;
 return 'N';
}

void lcd_print(unsigned char dat){
 MyByte a;
 a.byte = dat;
  LATA.B5  = 1;
 nop();
 LATD.B7 = a.bit7;
 LATD.B6 = a.bit6;
 LATD.B5 = a.bit5;
 LATD.B4 = a.bit4;
 nop();
  LATA.B5  = 0;
 nop();
  LATA.B5  = 1;
 nop();
 LATD.B7 = a.bit3;
 LATD.B6 = a.bit2;
 LATD.B5 = a.bit1;
 LATD.B4 = a.bit0;
 nop();
  LATA.B5  = 0;
 nop();
}

void lcd_char(unsigned char dat){
  LATA.B4  = 1;
 delay_ms(1);
 lcd_print(dat);
}

void lcd_Command(unsigned char cmd){
  LATA.B4  = 0;
 delay_ms(1);
 lcd_print(cmd);
}

void lcd_string(char *str)
{ unsigned char i = 0;
 while(str[i]!='\0')
 {
 lcd_char(str[i]);
 i++;
 }
}

void LCD_Command_first(){
  LATA.B4  = 0;
  LATA.B5  = 1;
 delay_ms(1);
 LATD.B7 = 0;
 LATD.B6 = 0;
 LATD.B5 = 1;
 LATD.B4 = 1;
  LATA.B5  = 0;
 delay_ms(1);
}

void lcd_Init(){
 ADCON1 = 0b0001111;

 TRISA.B5 = 0;
 TRISA.B4 = 0;

 TRISD = 0;
 delay_ms(20);

 LCD_Command_first();
 delay_us(40);
 LCD_Command_first();
 delay_us(40);
 LCD_Command_first();
 lcd_Command(0b00101000);
 delay_ms(2);
 lcd_Command(0b00001111);
 delay_ms(2);
 lcd_Command(0b00000001);
 delay_ms(2);
 lcd_Command(0b00000110);
}

 int get_num(char ch)
{
 int num = 0;
 switch(ch)
 {
 case '0':
 num = 0;
 break;
 case '1':
 num = 1;
 break;
 case '2':
 num = 2;
 break;
 case '3':
 num = 3;
 break;
 case '4':
 num = 4;
 break;
 case '5':
 num = 5;
 break;
 case '6':
 num = 6;
 break;
 case '7':
 num = 7;
 break;
 case '8':
 num = 8;
 break;
 case '9':
 num = 9;
 break;
 case 'A':
 num = 0xA;
 break;
 case 'B':
 num = 0xb;
 break;
 case 'C':
 num = 0xc;
 break;
 case 'D':
 num = 0xd;
 break;
 case 'E':
 num = 0xe;
 break;
 case 'F':
 num = 0xf;
 break;
 }
 return num;
}

char get_char(int ch)
{
 char num = 'N';
 switch(ch)
 {
 case 0:
 num = '0';
 break;
 case 1:
 num = '1';
 break;
 case 2:
 num = '2';
 break;
 case 3:
 num = '3';
 break;
 case 4:
 num = '4';
 break;
 case 5:
 num = '5';
 break;
 case 6:
 num = '6';
 break;
 case 7:
 num = '7';
 break;
 case 8:
 num = '8';
 break;
 case 9:
 num = '9';
 break;
 case 0xa:
 num = 'A';
 break;
 case 0xb:
 num = 'B';
 break;
 case 0xc:
 num = 'C';
 break;
 case 0xd:
 num = 'D';
 break;
 case 0xe:
 num = 'E';
 break;
 case 0xf:
 num = 'F';
 break;
 }
 return num;
}
void print_num(long int number);

int oct_to_dec(long int number) {
 unsigned long int num_new = 0;
 unsigned long int last_dig = 0;
 int stepen = 1;
 while (number > 0) {
 last_dig = (number % 10) * stepen;
 num_new = num_new + last_dig;
 number /= 10;
 stepen *= 8;
 }
 return num_new;
}


int dec_to_oct(long int number) {
 long int num_new = 0;
 unsigned char res[6] = {'N','N','N','N','N','N'};
 int stepen = 1, i = 0, n = 0;
 if(number == 0){
 lcd_char('0');
 }
 while (number > 0) {
 long int last_dig = number % 8;
 num_new = num_new + last_dig*stepen;
 number = number / 8;
 stepen *= 10;
 res[n] = get_char(last_dig);
 n ++;
 }
 for(i = 0; i<n; i++){
 if(res[n-1-i]!='N'){
 lcd_char(res[n-i-1]);
 }
 }

 return num_new;
}

void print_num(long int number){
 unsigned int i = 0, n = 0;
 char result[6] = {'N','N','N','N','N','N'};
 if(number == 0){
 lcd_char('0');
 }
 while(number > 0){
 result[n] = get_char(number%10);
 number = number / 10;
 n++;
 };
 for(i = 0; i<n; i++){
 if(result[n-1-i]!='N'){
 lcd_char(result[n-i-1]);
 }
 }
}

void USART_Init()
{
 TRISC.B6 = 1;
 TRISC.B7 = 1;
 SPBRG=16;
 TXSTA=0b00100000;
 RCSTA=0b10010000;
}

unsigned char USART_TxChar(char data_in)
{
 if(PIR1.TXIF==1) {
 TXREG = data_in;
 return  1 ;
 };
 return  0 ;
}

char USART_RxChar()
{
 if(RCSTA.OERR)
 {
 LATC.B5 = 0;
 nop();
 LATC.B5 = 1;
 }
 return(RCREG);
}

void clear_all(){
 number1.byte0 = 0;
 number1.byte1 = 0;
 number1.byte2 = 0;
 number1.counter = 0;

 number2.byte0 = 0;
 number2.byte1 = 0;
 number2.byte2 = 0;
 number2.counter = 0;
 }

void decodPressedKey(unsigned char key) {
 char data_in;
 switch (state) {
 case WAIT_FIRST_DIGIT:
 {
 lcd_char(key);
 if((number1.counter<3)&&(key!='+' && key!='-' && key!='*' && key!='/' && key!='8' && key!='9' && key!='=')){
 data_in = get_num(key);
 if(number1.counter == 2)
 {
 number1.byte0 = data_in;
 number1.counter ++;
 state = WAIT_OPERATION;
 }
 if(number1.counter == 1)
 {
 number1.byte1 = data_in;
 number1.counter ++;
 }
 if(number1.counter == 0)
 {
 number1.byte2 = data_in;
 number1.counter ++;
 }
 }
 else{
 if((key=='+' || key=='-' || key=='*' || key=='/')&&number1.counter>0){
 operation = key;
 state = WAIT_SECOND_DIGIT;

 }
 else{
 lcd_string("Wrong Input");
 nop();
 nop();
 lcd_Command(0b00000001);
 state = WAIT_FIRST_DIGIT;
 clear_all();
 }
 }
 break;
 }
 case WAIT_SECOND_DIGIT:
 {
 lcd_char(key);
 if((number2.counter<3)&&(key!='+' && key!='-' && key!='*' && key!='/' && key!='8' && key!='9' && key!='=')){
 data_in = get_num(key);
 if(number2.counter == 2)
 {
 number2.byte0 = data_in;
 number2.counter ++;
 state = DO_OPERATION;
 lcd_char('=');
 }
 if(number2.counter == 1)
 {
 number2.byte1 = data_in;
 number2.counter ++;
 }
 if(number2.counter == 0)
 {
 number2.byte2 = data_in;
 number2.counter ++;
 }
 }
 else{
 if(key=='=' && number2.counter>0){
 state = DO_OPERATION;

 }
 else{
 lcd_string("Wrong Input");
 nop();
 nop();
 lcd_Command(0b00000001);
 state = WAIT_FIRST_DIGIT;
 clear_all();
 }
 }
 break;
 }
 case WAIT_OPERATION:
 {
 lcd_char(key);
 if(key=='+' || key=='-' || key=='*' || key=='/'){
 operation = key;
 state = WAIT_SECOND_DIGIT;
 }
 else{
 lcd_string("Wrong Input");
 nop();
 nop();
 lcd_Command(0b00000001);
 state = WAIT_FIRST_DIGIT;
 clear_all();
 }
 break;
 }
 }
}

void executeOperation(termStruct key1, termStruct key2, unsigned char op){
 long int num1_oct, num2_oct, num1_dec, num2_dec, res_oct = 0, res_dec = 0, t =0;

 if(key1.counter == 1){
 num1_oct = key1.byte2;
 }
 else if(key1.counter == 2){
 num1_oct = key1.byte2*10+key1.byte1;
 }
 else {
 num1_oct = key1.byte2*100+key1.byte1*10+key1.byte0;
 }

 if(key2.counter == 1){
 num2_oct = key2.byte2;
 }
 else if(key2.counter == 2){
 num2_oct = key2.byte2*10+key2.byte1;
 }
 else{
 num2_oct = key2.byte2*100+key2.byte1*10+key2.byte0;
 }

 if((num2_oct == 0)&&(op=='/')){
 lcd_string("Error");
 nop();
 nop();
 lcd_Command(0b00000001);
 state = WAIT_FIRST_DIGIT;
 clear_all();
 }
 else{
 num1_dec = oct_to_dec(num1_oct);
 num2_dec = oct_to_dec(num2_oct);

 switch(op)
 {
 case '+':
 res_dec = num1_dec+num2_dec;
 break;
 case '-':
 res_dec = num1_dec-num2_dec;
 break;
 case '*':
 res_dec = num1_dec*num2_dec;
 break;
 case '/':
 res_dec = num1_dec/num2_dec;
 break;
 }
 if(res_dec<0){
 lcd_char('-');

 t = -res_dec;
 res_dec=t;
 }
 res_oct = dec_to_oct(res_dec);
 }
}
int counter_ = 0;
int counter_2 = 0;
void main(){
 IRCF2_bit = 1;
 IRCF1_bit = 1;
 IRCF0_bit = 1;

 lcd_Init();
 TRISB = 0b00001111;

 TRISC = 0;
 LATC = 0;

 SSPCON1.SSPEN = 0;

 USART_Init();
 delay_ms(50);

 currentKeyState = backKeyState;

 state = WAIT_FIRST_DIGIT;

 TMR0L = 0xe0;
 TMR0H = 0xb1;
 T0CON = 0b10001000;

 INTCON.TMR0IE = 1;
 INTCON.PEIE = 1;



 while(1)
 {
 currentKeyState = answer_key_state();

 if((currentKeyState.b4 != backKeyState.b4) || (currentKeyState.b5 != backKeyState.b5) || (currentKeyState.b6 != backKeyState.b6) || (currentKeyState.b7 != backKeyState.b7)){
 T0CON.TMR0ON = 0;
 TMR0L = 0xe0;
 TMR0H = 0xb1;
 INTCON.TMR0IF = 0;
 T0CON.TMR0ON = 1;
 }
 backKeyState = currentKeyState;

 if(INTCON.TMR0IF){
 T0CON.TMR0ON = 0;
 INTCON.TMR0IF = 0;
 counter_ ++;
 buf = read_key_state(currentKeyState);
 if (buf != 'N') {

 decodPressedKey(buf);
 };

 }
 LATC = counter_;





 if (PIR1.RCIF) {
 buf = USART_RxChar();
 decodPressedKey(buf);
 }
 if( buf == 'C'){
 lcd_Command(0b00000001);
 clear_all();
 }
 if (state == DO_OPERATION) {
 executeOperation(number1,number2,operation);
 clear_all();
 state = WAIT_FIRST_DIGIT;
 }
 }
 while(1) {} ;
 }
