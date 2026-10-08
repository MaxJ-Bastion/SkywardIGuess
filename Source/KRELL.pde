class KRELL {
  int x, y, xs, ys, camX, camY, diam, health, maxHealth, rx, ry, rxs, rys;
  PImage krell, krellmap;
  float angle, oldAngle, newAngle;
  PVector move;
  Timer ktimer;

  KRELL() {
    //x=width/2;
    //y=height/2;
    krell = loadImage("krell.png");
    krellmap = loadImage("krell.png");
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


  void mapdisplay() {

    pushMatrix();
    translate(x*.025, y*.025);

    rotate(radians(oldAngle*(180/PI)+90));
    krellmap.resize(30, 30);
    image(krellmap, 0, 0);
    // krell.resize(100,100);
    popMatrix();
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



class BKRELL {
  int x, y, xs, ys, camX, camY, diam, health, maxHealth, rx, ry, rxs, rys,ax,ay;
  PImage bkrell, bkrellmap, arr;
  float angle;
  PVector move;
  boolean shoot, hasBeenHit;
  Timer ktimer;

  BKRELL() {
    //x=width/2;
    //y=height/2;
    bkrell = loadImage("KBomber.png");
    bkrellmap = loadImage("KBomber.png");
    arr= loadImage("karrow.png");
    camX=0;
    camY=0;
    xs=level+3;
    ys=level+3;
    x=int (random (-20000, 20000));
    y=int (random (-20000, 20000));
    diam=150;
    maxHealth=level*2+10;
    health=maxHealth;
    angle = atan2(mbot.y - y, mbot.x - x);
    ktimer=new Timer(500);
    ktimer.start();
    rx=int(random(-10000, 10000));
    ry=int(random(-10000, 10000));
    rxs=30;
    rys=30;
    hasBeenHit=false;
  }

  void display() {
    pushMatrix();
    translate(x, y);
    //oldAngle=angle;

    angle = atan2(detritus.y - y, detritus.x - x);
    // newAngle=(oldAngle-angle)/2;
    //if (oldAngle<angle)oldAngle+=.05;
    //else if (oldAngle>angle) oldAngle-=.05;





    rotate(radians(angle*(180/PI)+90));
    imageMode(CENTER);
    bkrell.resize(diam, diam);
    image(bkrell, 0, 0);


    popMatrix();
    fill(50);
    // rectMode(CENTER);
    rect(x-50, y+60, 50, 5);
    rectMode(CORNER);
    float scale = 50/maxHealth;
    fill(255, 0, 0);
    rect(x-50, y+60, health*scale, 5);
  }


  void mapdisplay() {

    pushMatrix();
    translate(x*.025, y*.025);

    rotate(radians(angle*(180/PI)+90));
    bkrellmap.resize(30, 30);
    image(bkrellmap, 0, 0);
    // krell.resize(100,100);
    popMatrix();
  }

  void move() {

    PVector me = new PVector(x, y);
    PVector target = new PVector (detritus.x, detritus.y);
    move = PVector.sub(target, me);

    move.normalize();
    move.mult(xs);

    //float d=dist(x, y, detritus.x, detritus.y);
    //if (d>500) {
    //  //x+=move.x;
    //  //y+=move.y;
    //  x+=cos(oldAngle)*xs;
    //  y+=sin(oldAngle)*xs;
    //} else {
    float d = dist (x, y, detritus.x, detritus.y);
    if (d>700) {
      x+=move.x;
      y+=move.y;
      shoot=false;
    }else shoot=true;
    // else {
    //  float r= random(1, 5);
    //  x+=r;
    //  y+=r;
    //}
    //  float dodge = random(-5, 5);
    //  x+=dodge;
    //  y+=dodge;
    //}
  }
  
  void arrow() {
ax=x;
ay=y;
ax = constrain (ax,mbot.x-width/2+100-int(mbot.move.x),mbot.x+width/2-100-int(mbot.move.x));
ay = constrain (ay,mbot.y-height/2+100-int(mbot.move.y),mbot.y+height/2-100-int(mbot.move.y));
fill(255);
arr.resize(20,20);

pushMatrix();
translate(ax,ay);
float angle =(atan2(y - mbot.y, x - mbot.x));
rotate(radians(angle*(180/PI)+90));
image(arr,0,0);


popMatrix();


//circle(ax,ay,10);
}

boolean isOnScreen () {
if (x<mbot.x+width/2&&x>mbot.x-width/2&&y<mbot.y+height/2&&y>mbot.y-height/2) return true; else return false;


}
  
}











class EKRELL {
  int x, y, xs, ys, camX, camY, diam, health, maxHealth, rx, ry, rxs, rys;
  PImage krell, krellmap;
  float angle, oldAngle, newAngle;
  PVector move;
  Timer ktimer;

  EKRELL(BKRELL bob) {
    //x=width/2;
    //y=height/2;
    krell = loadImage("EKRELL.png");
    krellmap = loadImage("EKRELL.png");
    camX=0;
    camY=0;
    xs=20;
    ys=20;
    x=bob.x;
    y=bob.y;
    diam=100;
    maxHealth=level*2+10;
    health=maxHealth;
    angle = atan2(mbot.y - y, mbot.x - x);
    ktimer=new Timer(400);
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


  void mapdisplay() {

    pushMatrix();
    translate(x*.025, y*.025);

    rotate(radians(oldAngle*(180/PI)+90));
    krellmap.resize(30, 30);
    image(krellmap, 0, 0);
    // krell.resize(100,100);
    popMatrix();
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
