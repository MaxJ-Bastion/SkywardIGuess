class DLaser {
  int x, y, w, h, speed;
  boolean nm;
  PImage l1;
 // PVector lezgo;
  float angle;
  
  DLaser() {
  //this.x = x;
  //this.y = y;
  x=detritus.x;
  y=detritus.y;
  w = 50;
  h =50;
  speed = 5;
    // lezgo = mbot.move;
 l1 = loadImage ("destructor.png");
//angle = mbot.angle;

  }

  void display (KRELL k) {
pushMatrix();
     //translate(mbot.camX,mbot.camY);
      //translate(mbot.x,mbot.y);
      translate(x,y);
      angle = (atan2(k.y - detritus.y, k.x - detritus.x));
    rotate(radians(angle*(180/PI)+90));
    imageMode (CENTER);
    l1.resize (w,h);
  image (l1,0,0);
  popMatrix();
  }
  
  void move(KRELL k) {
    
    
      PVector me = new PVector(detritus.x, detritus.y);
      PVector target = new PVector (k.x, k.y);
      PVector move =  PVector.sub(target, me);
      
      move.normalize();
      move.mult(15);
x+=move.x;
y+=move.y;

    //lezgo.mult(1.2);
     //     x+=lezgo.x;
     // y+=lezgo.y;
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
      if (y > detritus.y + height|y < detritus.y - height|x < detritus.x - width|x > detritus.x + width) { 
    return true;
      } else {return false;}
  }
  
  
  //  boolean intersectA (Asteroid aster) {
  //  float d = dist(x,y,aster.x,aster.y);
  //  if (d<aster.diam) {
  //      return true;
  //  } else {return false;}
  //}
  
      boolean intersectK (KRELL k) {
    float d = dist(x,y,k.x,k.y);
    if (d<k.diam) {
        return true;
    } else {return false;}
  }
}
