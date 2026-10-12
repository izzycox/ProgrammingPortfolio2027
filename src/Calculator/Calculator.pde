// Isabella Cox | Sept 14,2026 | Calculator
// Color Palette: #1D088C #221759 #856FF2 #B7A8FF #E1DBFF
String displayVal;
float l, r, result;
char op;
boolean left;
boolean newEntry;

Button[] numButtons = new Button[10];
Button[] opButtons = new Button [14];

void setup() {
  size(390, 660);
  displayVal = "0.0";
  l=0.0;
  r=0.0;
  result=0.0;
  op=' ';
  left=true;
  newEntry = true;
  numButtons[1] = new Button(80, 380, '1');
  numButtons[2] = new Button(160, 380, '2');
  numButtons[3] = new Button(240, 380, '3');
  numButtons[4] = new Button(80, 460, '4');
  numButtons[5] = new Button(160, 460, '5');
  numButtons[6] = new Button(240, 460, '6');
  numButtons[7] = new Button(80, 540, '7');
  numButtons[8] = new Button(160, 540, '8');
  numButtons[9] = new Button(240, 540, '9');
  numButtons[0] = new Button(80, 620, '0');
  opButtons[0] = new Button(320, 540, '+');
  opButtons[1] = new Button(320, 460, '-');
  opButtons[2] = new Button(320, 380, 'x');
  opButtons[3] = new Button(320, 300, '÷');
  opButtons[4] = new Button(160, 620, '.');
  opButtons[5] = new Button(240, 620, '±');
  opButtons[6] = new Button(320, 620, '=');
  opButtons[7] = new Button(240, 300, 'π');
  opButtons[8] = new Button(160, 300, '√');
  opButtons[9] = new Button(80, 300, '%');
  opButtons[10] = new Button(320, 220, 'C');
  opButtons[11] = new Button(240, 220, '⌫');
  opButtons[12] = new Button(160, 220, '>');
  opButtons[13] = new Button(80, 220, '<');
}

void draw() {
  background(#E1DBFF);
  updateDisplay();
  for (int i = 0; i<numButtons.length; i++) {
    numButtons[i].display();
    numButtons[i].mouseOver(mouseX, mouseY);
  }
  for (int i = 0; i<opButtons.length; i++) {
    opButtons[i].display();
    opButtons[i].mouseOver(mouseX, mouseY);
  }
}

void updateDisplay() {
  // background shape
  rect(200, 90, 300, 150, 12);
  // overlay text
  fill(0);
  textAlign(RIGHT);
  textSize(50);
  text(displayVal, width-45, 155);
}

void mouseReleased() {
  //refreush hover for the exact release position
  for (int i = 0; i < numButtons.length; i++) {
    numButtons[i].mouseOver(mouseX, mouseY);
  }
  for (int i = 0; i < opButtons.length; i++) {
    opButtons[i].mouseOver(mouseX, mouseY);
  }
  //number buttons
  for (int i = 0; i < numButtons.length; i++) {
    if (numButtons[i].hover == true){
  handleEvent(numButtons[i].val,true);
    }
  }

  //operator Buttons
  for (int i = 0; i < opButtons.length; i++) {
    if (opButtons[i].hover == true) {
      char clicked = (opButtons[i].val);

      if (clicked == '=') {
        performCalc();
      } else if (clicked == 'q') {
      } else if (clicked == '+' || clicked == '-' || clicked == 'x' || clicked == '÷') {
        op = clicked;
        left = false;
        newEntry = true;
      } else if (clicked == 'C') {
        l = 0.0;
        r = 0.0;
        displayVal = str(0.0);
        op = 'C';
        left = true;
        newEntry = true;
      } else if (clicked == 'π') {
        displayVal = str(PI);
        if (left) {
          l = PI;
        } else {
          r = PI;
        }
      }

      else if (clicked == 'q') {
        if (left == true) {
          l = sq(l);
          displayVal = str(l);
        } else {
          r = sq(r);
          displayVal = str(r);
        }
      } else if (clicked == '.') {
        if (!displayVal.contains(".")) {
          if (left == true) {
            displayVal += ".";
            r = float(displayVal);
          }
        }
      }
    }
    printState();
  }
}

void printState() {
  println(
    "l; " + l +
    "| r; " + r +
    "| result: " + result +
    "| left: " + left +
    "| op: " + op +
    "| display: " + displayVal
    );
}

void performCalc() {
  if (op == '+') {
    result = l + r;
  } else if (op == '-') {
    result = l - r;
  } else if (op == '÷') {
    if (r==0) {
      displayVal = "ERROR";
      newEntry = true;
      return;
    }
    result = l / r;
  } else if (op == 'x') {
    result = l * r;
  } 

  displayVal = str(result);
  println("AFTER CALC -> result: " + result + " | displayVal; " +displayVal);
  l = result;
  r = 0.0;
  left = true;
  newEntry = true;
}

void keyPressed() {
  if(key == '1') {
    println("you hit 1 " + keyCode );
    handleEvent('1',true);
  } else if(key == '2') {
    println("you hit 2 " + keyCode );
    handleEvent('2',true);
  } else if(key == '3') {
    println("you hit 3 " + keyCode );
    handleEvent('3',true);
  } else if(key == '4') {
    println("you hit 4 " + keyCode );
    handleEvent('4',true);
  } else if(key == '5') {
    println("you hit 5 " + keyCode );
    handleEvent('5',true);
  } else if(key == '6') {
    println("you hit 6 " + keyCode );
    handleEvent('6',true);
  } else if(key == '7') {
    println("you hit 7 " + keyCode );
    handleEvent('7',true);
  } else if(key == '8') {
    println("you hit 8 " + keyCode );
    handleEvent('8',true);
  } else if(key == '9') {
    println("you hit 9 " + keyCode );
    handleEvent('9',true);
  } else if(key == '0') {
    println("you hit 0 " + keyCode );
    handleEvent('0',true);
  }else if(key == '+') {
    println("you hit + " + keyCode );
    handleEvent('+',false);
  }else if(key == '-') {
    println("you hit - " + keyCode );
    handleEvent('-',false);
  }else if(key == 'x') {
    println("you hit x " + keyCode );
    handleEvent('x',false);
  }else if(key == '÷') {
    println("you hit ÷ " + keyCode );
    handleEvent('÷',false);
  }
  
}

void handleEvent(char val, boolean isNum) {
  if(isNum == true){
      String digit = str(val);

      if (newEntry || displayVal.equals("0.0")) {
        displayVal = digit;
        newEntry = false;
      } else {
        displayVal += digit;
      }
      if (left) {
        l = float(displayVal);
      } else {
        r = float(displayVal);
      }
    
  } else {
    //other stuff
  }
}
