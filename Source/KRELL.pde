class KRELL {
int x,y,xs, ys,camX,camY,diam,health;
PImage krell;
float angle,oldAngle,newAngle;
PVector move;
Timer ktimer;

  KRELL() {
  //x=width/2;
  //y=height/2;
  krell = loadImage("krell.png");
  camX=0;
  camY=0;
  xs=8;
  ys=8;
  x=int (random (-20000, 20000));
  y=int (random (-20000, 20000));
  diam=100;
  health=level*2+8;
      angle = atan2(mbot.y - y, mbot.x - x);
      ktimer=new Timer(1000);
      ktimer.start();
  }
  
  void display(){
    pushMatrix();
    translate(x,y);
    oldAngle=angle;
    angle = atan2(mbot.y - y, mbot.x - x);
    newAngle=(angle/100+oldAngle*99/100);
    rotate(radians(newAngle*(180/PI)+90));
    imageMode(CENTER);
    krell.resize(diam,diam);
image(krell,0,0);
  popMatrix();
  }
  
  void move() {
      PVector me = new PVector(x, y);
      PVector target = new PVector (mbot.x, mbot.y);
      move = PVector.sub(target, me);
      
      move.normalize();
      move.mult(xs);
      
      float d=dist(x,y,mbot.x,mbot.y);
      //run
      if (health<3) {
            x-=move.x;
      y-=move.y;
      }
      //average
      else if(d>500) {
      x+=move.x;
      y+=move.y;
      } else
      //dodge
      {
            x-=move.x;
      y-=move.y;
      float dodge = random(-5,5);
      x+=dodge;
      y+=dodge;
      
      }
  
  if (d>5000) {
  health=level*2;
  
  }
  }
  
  boolean fighting() {
  float d=dist(x,y,mbot.x,mbot.y);
      if(d<1000) { return true;
      } else return false;
  
  }
  
  
}
