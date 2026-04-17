class KRELL {
int x,y,xs, ys,camX,camY;
PImage krell;
float angle,oldAngle,newAngle;

  KRELL() {
  //x=width/2;
  //y=height/2;
  krell = loadImage("krell.png");
  camX=0;
  camY=0;
  xs=10;
  ys=10;
  x=0;
  y=0;
      angle = atan2(mbot.y - y, mbot.x - x);
  }
  
  void display(){
    pushMatrix();
    translate(x,y);
    oldAngle=angle;
    angle = atan2(mbot.y - y, mbot.x - x);
    newAngle=(oldAngle-angle)/2;
    rotate(radians(angle*(180/PI)+90));
    imageMode(CENTER);
image(krell,0,0);
  popMatrix();
  }
  
  void move() {
      PVector me = new PVector(x, y);
      PVector target = new PVector (mbot.x, mbot.y);
      PVector move = PVector.sub(target, me);
      
      move.normalize();
      move.mult(xs);
      x+=move.x;
      y+=move.y;
  
  
  }
  
  
  
  
}
