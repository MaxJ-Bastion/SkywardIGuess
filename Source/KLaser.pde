class KLaser {
  int x, y, w, h, speed;
  boolean nm;
  PImage l1;
  PVector lezgo;
  float angle;
  
  KLaser(int x, int y,KRELL k) {
  this.x = x;
  this.y = y;
  w = 50;
  h =50;
  speed = 5;
     lezgo = k.move;
 l1 = loadImage ("klaser.png");
angle = k.angle;

  }

  void display () {
pushMatrix();
     //translate(mbot.camX,mbot.camY);
      //translate(mbot.x,mbot.y);
      translate(x,y);
    rotate(radians(angle*(180/PI)+90));
    imageMode (CENTER);
    l1.resize (w,h);
  image (l1,0,0);
  popMatrix();
  }
  
  void move() {
    


    lezgo.mult(1.01);
          x+=lezgo.x;
      y+=lezgo.y;
  //y-=speed;
  }
  
  //boolean intersect (Rock r) {
  //  float d = dist(x,y,r.x,r.y);
  //  if (d<r.diam) {
  //      return true;
  //  } else {return false;}
  //}
  //  boolean intersectO (Oven o) {
  //  float d = dist(x,y,o.x,o.y);
  //  if (d<o.diam/2) {
  //      return true;
  //  } else {return false;}
  //}
    boolean outOfBounds () {
      if (y > mbot.y + height|y < mbot.y - height|x < mbot.x - width|x > mbot.x + width) { 
    return true;
      } else {return false;}
  }
  
  

  
      boolean intersect () {
    float d = dist(x,y,mbot.x,mbot.y);
    if (d<50) {
        return true;
    } else {return false;}
  }
}
