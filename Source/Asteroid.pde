class Asteroid {
  int x, y, diam, xs, ys, health,age;
   
  //PVector moves;
  PImage asteroid;
  color c;
  
  Asteroid() {
    //x = int (random (-width-mbot.x,width+mbot.x));
    //y = int (random (-height-mbot.y,height+mbot.y));
    x=int (random (-4000, 4000));
    y=int (random (-4000, 4000));
    //x= mbot.x;
    //y= mbot.y;
    diam = int (random (50, 200));
    if (diam<125)health=1;
    else health=2;
    xs = int (random (-10, 10));
    ys=int (random (-10, 10));
    // c = int((random (100, 225)));
    // x=0;
    // y=0;
age = 0;
    asteroid= loadImage("astroid.png");
  }

  void display () {
    pushMatrix();
    age+=2;
    // translate(mbot.camX,mbot.camY);
    //translate(mbot.x,mbot.y);
    translate(x, y);
    rotate(radians(age));
    if (age==360)age=0;
    
    //fill (c);
    asteroid.resize(diam, diam);
    image (asteroid, 0, 0);
    popMatrix();
  }


  boolean noTouchie() {
    float d= dist(x, y, mbot.x, mbot.y);
    if (d <diam/2)return true;
    else return false;
  }

  //boolean lonelyPlanet() {
  //float d= dist(x,y,mbot.x,mbot.y);
  //if (d >1000)return true;
  //else return false;

  //}
  void move() {
    x+=xs;
    y+=ys;
    if (x<-4500||x>4500) {
      xs*=-1;
    }
    if (y<-4500||y>4500) {
      ys*=-1;
    }
  }

  //boolean reachedBottom () {
  //  if (y> camY+10) {
  //    return true;
  //  } else {
  //    return false;
  //  }
  //}
}
