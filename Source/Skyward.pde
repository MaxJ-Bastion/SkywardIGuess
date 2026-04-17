//Maxwell Johnson| April 1, 2026 | Tank Game (Skyward themed)
MBOT mbot;
KRELL krell;
//Asteroid aster;
//Laser laser;
//Planet planet;
ArrayList<Planet> planets = new ArrayList<Planet>();
ArrayList<Star> stars = new ArrayList<Star>();
ArrayList<Laser> lasers = new ArrayList<Laser>();
ArrayList<Asteroid> asters = new ArrayList<Asteroid>();
int camX, camY,realCamX,realCamY,oldX,oldY,moveX,moveY,time;
void setup() {
  fullScreen();
  //size(800,800);
  background(15, 15, 50);
  mbot= new MBOT();
  krell = new KRELL();
  //laser=new Laser(0,0);
  //aster=new Asteroid();
  planets.add( new Planet("planet.png"));
  planets.add( new Planet("roshar.png"));
  planets.add( new Planet("deathworld.png"));
  planets.add( new Planet("detritus.png"));
  planets.add( new Planet("vibeworld.png"));
  planets.add( new Planet("lightworld.png"));
  planets.add( new Planet("clarkplanet1.png"));
  planets.add( new Planet("ringodeath.png"));
  //planets.add( new Planet());
  //planets.add( new Planet());
  //planets.add(new Planet());
realCamX=0;
realCamX=0;
time=0;
  for (int i = 0; i < 1000; i++) {
    stars.add(new Star());
  }
}

void draw() {

  camX = width/2-mbot.x;
  camY = height/2-mbot.y;
  
  
  oldX=realCamX;
  oldY=realCamY;
  moveX=(mbot.camX-oldX)/3;
  moveY=(mbot.camY-oldY)/3;
  realCamX+=moveX;
  realCamY+=moveY;
  
  background(15, 15, 50);
  pushMatrix();
  translate(realCamX,realCamY);
  //translate(mbot.camX, mbot.camY);
  //laser.display();
  // WORLD OBJECTS
  //fill(255);
  //rect(100,100,100,100);

  //stars.add (new Star());

  //Display and Remove stars
  for (int i = 0; i < stars.size(); i++) {
    //if (stars.size()<500)stars.add (new Star());
    Star star = stars.get(i);
    float d = dist(star.x, star.y, mbot.x, mbot.y);

    star.display();


    if (star.x < mbot.x - width) star.x += width * 2;
    if (star.x > mbot.x + width) star.x -= width * 2;
    if (star.y < mbot.y - height) star.y += height * 2;
    if (star.y > mbot.y + height) star.y -= height * 2;
    //star.move();
    //if (d>width/2+200) {
    //  stars.remove(star);
    //  stars. add (new Star());
    //  //i--;
    //}
    //println("Stars :" +stars.size());
    

  }
  
   if(asters.size()<20) asters.add (new Asteroid());
  for (int  i = 0; i<asters.size(); i++) {
    Asteroid aster = asters.get(i);
    aster.display();
    aster.move();
    
    if(aster.noTouchie()) {
            PVector getOut = mbot.move;
      getOut.mult(-3);
      mbot.x+=getOut.x;
      mbot.y+=getOut.y;
   // asters.remove(aster);
    
    }
    //if (laser.outOfBounds()) {
    //  lasers.remove(laser);
    //  i--;
    //}

   // println("Laser :" +lasers.size());
    //float d = dist(planet.x,planet.y,p.x,p.y);
    //if () planets.add (new Planet());
  }

  for (int  i = 0; i<planets.size(); i++) {
    Planet planet = planets.get(i);
    planet.display();
    if (planet.noTouchie()) {
      PVector getOut = mbot.move;
      getOut.mult(-2);
      mbot.x+=getOut.x;
      mbot.y+=getOut.y;
    }
  }
if(mousePressed&&lasers.size()<100&&(frameCount-time)>10) {
lasers.add (new Laser(mbot.x,mbot.y));
time=frameCount;
}
  for (int  i = 0; i<lasers.size(); i++) {
    Laser laser = lasers.get(i);
    laser.display();
    laser.move();
    //if (laser.outOfBounds()) {pppppppp
    //  lasers.remove(laser);
    //  i--;
    //}
    if (laser.outOfBounds()&&lasers.size()>1) {
    lasers.remove(laser);
    }

      for (int  j = 0; j<asters.size(); j++) {
    Asteroid aster = asters.get(j);
    if (laser.intersect(aster)&&lasers.size()>0) {
    lasers.remove(laser);
    i--;
    aster.health--;
    if (aster.health ==0){
    asters.remove(aster);
    j--;
    } else aster.diam/=2;
    }
    
  }

    println("Asteroids :" +asters.size());
    //float d = dist(planet.x,planet.y,p.x,p.y);
    //if () planets.add (new Planet());
  }
       krell.display();
       krell.move();


  popMatrix();
  mbot.display();
  mbot.move();


}



//void mouseClicked() {
//  lasers.add(new Laser(mbot.x, mbot.y));
//}
