class Planet {
  int x, y, diam, speed;
  //PVector moves;
  PImage planet;
color c;
  Planet(String name) {
    //x = int (random (-width-mbot.x,width+mbot.x));
    //y = int (random (-height-mbot.y,height+mbot.y));
    x=int (random (-4000,4000));
    y=int (random (-4000,4000));
    //x= mbot.x;
    //y= mbot.y;
    diam = int (random (500, 700));
    speed = 10;
    c = int((random (100, 225)));
    
    
    planet= loadImage(name);
  }

  void display () {
    
    fill (c);
    planet.resize(diam, diam);
    image (planet,x, y);
  }


boolean noTouchie() {
float d= dist(x,y,mbot.x,mbot.y);
if (d <diam/2+20)return true;
else return false;
}

boolean lonelyPlanet() {
float d= dist(x,y,mbot.x,mbot.y);
if (d >1000)return true;
else return false;

}
  //void move() {
  //  moves = mbot.move;
  //  //move.mult (speed);
  //    x-=moves.x;
  //    y-=moves.y;
    
    
  //}

  //boolean reachedBottom () {
  //  if (y> camY+10) {
  //    return true;
  //  } else {
  //    return false;
  //  }
  //}
}
