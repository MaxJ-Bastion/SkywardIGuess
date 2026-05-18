class KRELL {
  int x, y, xs, ys, camX, camY, diam, health, maxHealth, rx, ry, rxs, rys;
  PImage krell;
  float angle, oldAngle, newAngle;
  PVector move;
  Timer ktimer;

  KRELL() {
    //x=width/2;
    //y=height/2;
    krell = loadImage("krell.png");
    camX=0;
    camY=0;
    xs=15;
    ys=20;
    x=int (random (-12000, 12000));
    y=int (random (-12000, 12000));
    diam=100;
    maxHealth=level*2+5;
    health=maxHealth;
    angle = atan2(mbot.y - y, mbot.x - x);
    ktimer=new Timer(500);
    ktimer.start();
    rx=int(random(-10000, 10000));
    ry=int(random(-10000, 10000));
    rxs=30;
    rys=30;
  }

  void display() {
    pushMatrix();
    translate(x, y);
    //oldAngle=angle;
    if (invis==false)
      angle = atan2(mbot.y - y, mbot.x - x);
    else
      angle = atan2(ry - y, rx - x);
    // newAngle=(oldAngle-angle)/2;
    //if (oldAngle<angle)oldAngle+=.05;
    //else if (oldAngle>angle) oldAngle-=.05;
    
    float diff = angle - oldAngle;


diff = atan2(sin(diff), cos(diff));

oldAngle += diff * 0.05;
    
    rotate(radians(oldAngle*(180/PI)+90));
    imageMode(CENTER);
    krell.resize(diam, diam);
    image(krell, 0, 0);


    popMatrix();
    fill(50);
    // rectMode(CENTER);
    rect(x-50, y+60, 50, 5);
    rectMode(CORNER);
    float scale = 50/maxHealth;
    fill(255, 0, 0);
    rect(x-50, y+60, health*scale, 5);
  }

  void move() {
    if (invis==false) {
      PVector me = new PVector(x, y);
      PVector target = new PVector (mbot.x, mbot.y);
      move = PVector.sub(target, me);

      move.normalize();
      move.mult(xs);

      float d=dist(x, y, mbot.x, mbot.y);
      if (d>500) {
        //x+=move.x;
        //y+=move.y;
        x+=cos(oldAngle)*xs;
        y+=sin(oldAngle)*xs;
      } else {
        x-=move.x;
        y-=move.y;
        float dodge = random(-5, 5);
        x+=dodge;
        y+=dodge;
      }
    } else {

      PVector me = new PVector(x, y);
      PVector target = new PVector (rx, ry);
      move = PVector.sub(target, me);

      move.normalize();
      move.mult(xs);
      x+=move.x;
      y+=move.y;

      rx+=rxs;
      ry+=rys;
      if (rx>10000||rx<-10000) {
        rxs*=-1;
      }
      if (ry>10000||ry<-10000) {
        rys*=-1;
      }
    }
  }

  boolean fighting() {
    float d=dist(x, y, mbot.x, mbot.y);
    if (d<1000) {
      return true;
    } else return false;
  }
}
