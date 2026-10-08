class Planet {
  int x, y, diam, speed,ax,ay, h;
  //PVector moves;
  String name;
  PImage planet,arr, mapplanet;
color c;
boolean touched;
  Planet(String name,int x,int y) {
    //x = int (random (-width-mbot.x,width+mbot.x));
    //y = int (random (-height-mbot.y,height+mbot.y));
    //x=int (random (-4000,4000));
    //y=int (random (-4000,4000));
    this.x=x;
    this.y=y;
    this.name=name;
    
    h= 100;
    //x= mbot.x;
    //y= mbot.y;
    diam = int (random (500, 700));
    speed = 10;
    c = int((random (100, 225)));
    
    arr=loadImage("arrow.png");
    planet= loadImage(name);
    mapplanet=loadImage(name);
    touched=false;
  }

  void display () {
    
    fill (c);
    planet.resize(diam, diam);
    image (planet,x, y);
  }
  
    void displaymap () {
    float xr = height/20500;
float yr=height/20500;
    fill (c);
    mapplanet.resize(100, 100);
    image (mapplanet,(x*.025), (y*.025));
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


void health() {
  textSize(50);
  fill(255);
  text("Detritus",width/2,75);
  rectMode(CORNER);
  fill(50,0,0);
rect (500,100,1000,20);
fill (255,0,0);
rect (500,100,h*10,20);





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
