class Laser {
  int x, y, w, h, speed;
  boolean nm;
  PImage l1;
  PVector lezgo;
  
  Laser(int x, int y) {
  this.x = x;
  this.y = y;
  w = 50;
  h =50;
  speed = 5;
     lezgo = mbot.move;
 l1 = loadImage ("destructor.png");


  }

  void display () {
    imageMode (CENTER);
    l1.resize (w,h);
  image (l1,x,y);
  }
  
  void move() {
    

    lezgo.mult(1.5);
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
      if (y < mbot.y + height|y < mbot.y - height|x < mbot.x - width|x < mbot.x + width) { 
    return true;
      } else {return false;}
  }
}
