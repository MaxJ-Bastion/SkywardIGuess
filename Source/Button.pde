// Kenneth Kaptie
// BUTTON CLASS
// -------------------------------------------
class Button {
  String label, pic,text;
  float x, y, w, h;
  PImage grug;
  boolean on;

  Button(String label, String text, float x, float y, float w, float h, String pic,boolean on) {
    this.label = label;
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.pic = pic;
    this.text=text;
    this.on=on;

  }

  void display() {
    fill(50);
rect(x,y-10,w*4,h+20);
    grug = loadImage(pic);
    fill(255);
    stroke(0);



 
      grug.resize(int(w), int(h));
      imageMode(CORNER);

    

    image(grug, x, y);
    fill(0);
    textAlign(LEFT);
    textSize(30);
    text(label, x+w+w/2, y+40);
    textSize(20);
text(text,x+w+w/2,y+70);

if(!on) {
    fill(50,50,200,100);
rect(x,y-10,w*4,h+20);
}

if(clicked()) {
    fill(255,30);
rect(x,y-10,w*4,h+20);

}
    //rect(x, y, w, h, 10);
  }

  boolean clicked() {

    return (mouseX > x && mouseX < x+w*4 && mouseY > y && mouseY < y+h);
  }
}
