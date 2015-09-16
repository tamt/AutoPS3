/* UART Example, any character received on either the real
   serial port, or USB serial (or emulated serial to the
   Arduino Serial Monitor when using non-serial USB types)
   is printed as a message to both ports.

   This example code is in the public domain.
*/

// set this to the hardware serial port you wish to use
#define HWSERIAL Serial1

void setup() {
	Serial.begin(9600);
  HWSERIAL.begin(38400);
  Keyboard.begin();

  delay(1000);
  Serial.print("KEY_LEFT: ");
  Serial.println(KEY_LEFT, DEC);
  Serial.print("KEY_RIGHT: ");
  Serial.println(KEY_RIGHT, DEC);
  Serial.print("KEY_UP: ");
  Serial.println(KEY_UP, DEC);
  Serial.print("KEY_DOWN: ");
  Serial.println(KEY_DOWN, DEC);
  Serial.print("KEY_ENTER: ");
  Serial.println(KEY_ENTER, DEC);
  Serial.print("KEY_ESC: ");
  Serial.println(KEY_ESC, DEC);
  Serial.print("KEY_BACKSPACE: ");
  Serial.println(KEY_BACKSPACE, DEC);
}

void loop() {
  int incomingByte;
        
	if (Serial.available() > 0) {
		incomingByte = Serial.read();
		Serial.print("USB received: ");
		Serial.println(incomingByte, DEC);
    HWSERIAL.print("USB received:");
    HWSERIAL.println(incomingByte, DEC);
    //Keyboard.println(incomingByte, DEC);
	}
 
	if (HWSERIAL.available() > 0) {
    incomingByte = HWSERIAL.read();
     
      Serial.print("UART raw received: ");
      Serial.println(incomingByte, DEC);
      HWSERIAL.print("UART raw received:");
      HWSERIAL.println(incomingByte, DEC);
      
    if(incomingByte == 215){
      Keyboard.press(KEY_RIGHT);
      delay(8);
      Keyboard.release(KEY_RIGHT);
    }else if(incomingByte == 216){
      Keyboard.press(KEY_LEFT);
      delay(8);
      Keyboard.release(KEY_LEFT);
    }else if(incomingByte == 217){
      Keyboard.press(KEY_DOWN);
      delay(8);
      Keyboard.release(KEY_DOWN);
    }else if(incomingByte == 218){
      Keyboard.press(KEY_UP);
      delay(8);
      Keyboard.release(KEY_UP);
    }else if(incomingByte == 212){
      Keyboard.press(KEY_DELETE);
      delay(8);
      Keyboard.release(KEY_DELETE);
    }else if(incomingByte == 194){
      Keyboard.press(KEY_F1);
      delay(8);
      Keyboard.release(KEY_F1);
    }else if(incomingByte == 195){
      Keyboard.press(KEY_F2);
      delay(8);
      Keyboard.release(KEY_F2);
    }else if(incomingByte == 196){
      Keyboard.press(KEY_F3);
      delay(8);
      Keyboard.release(KEY_F3);
    }else if(incomingByte == 197){
      Keyboard.press(KEY_F4);
      delay(8);
      Keyboard.release(KEY_F4);
    }else if(incomingByte == 177){
      Keyboard.press(KEY_ESC);
      delay(8);
      Keyboard.release(KEY_ESC);
    }else if(incomingByte == 178){
      Keyboard.press(KEY_BACKSPACE);
      delay(8);
      Keyboard.release(KEY_BACKSPACE);
    }else if(incomingByte == 179){
      Keyboard.press(KEY_TAB);
      delay(8);
      Keyboard.release(KEY_TAB);
    }else if(incomingByte == 206){
      Keyboard.set_modifier(MODIFIERKEY_SHIFT);
      Keyboard.send_now();
      Keyboard.set_key1(KEY_BACKSPACE);
      Keyboard.send_now();

      delay(100);

      Keyboard.set_modifier(0);
      Keyboard.set_key1(0);
      Keyboard.send_now();
    }else if(incomingByte == 207){
      Keyboard.set_modifier(MODIFIERKEY_GUI);
      Keyboard.send_now();

      delay(100);

      Keyboard.set_modifier(0);
      Keyboard.send_now();
    }else{
      Serial.print("UART received: ");
      Serial.println(incomingByte, DEC);
      HWSERIAL.print("UART received:");
      HWSERIAL.println(incomingByte, DEC);
      if(incomingByte==34){
        incomingByte=64;
      }else if(incomingByte == 64){
        incomingByte=34;
      }
      Keyboard.write(incomingByte);
    }
	}
 
}

