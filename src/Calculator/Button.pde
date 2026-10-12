class Button {
  // member variables
  float x,y,w,h;
  color c1,c2;
  char val;
  boolean hover;
  
  // constructor
  Button(float x, float y, char val) {
    this.x = x;
    this.y = y;
    w = 60;
    h = 60;
    c1 = color(#1D088C);
    c2 = color(#856FF2);
    this.val = val;
    hover = false;
  }
  
  // member methods
  void display() {
    if(hover==true) {
      fill(c1);
    } else {
      fill(c2);
    }
    rectMode(CENTER);
    rect(x,y,w,h,10);
    fill(225);
    textAlign(CENTER,CENTER);
    textSize(24);
    text(val,x,y-6);
  }
  
  void mouseOver(float tempX, float tempY ) {
    if(tempX > x-w/2 && tempX < x+w/2 && tempY > y-h/2 && tempY < y+h/2) {
      hover = true;
    } else {
      hover = false;
    }
  }
}
