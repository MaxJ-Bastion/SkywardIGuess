//Maxwell Johnson| April 1, 2026 | Tank Game (Skyward themed)
MBOT mbot;
//Laser laser;
//Planet planet;
ArrayList<Planet> planets = new ArrayList<Planet>();
ArrayList<Star> stars = new ArrayList<Star>();
ArrayList<Laser> lasers = new ArrayList<Laser>();
int camX, camY;
void setup() {
  fullScreen();
//size(800,800);
background(15,15,50);
mbot= new MBOT();
//laser=new Laser(0,0);
planets.add( new Planet("planet.png"));
planets.add( new Planet("roshar.png"));
planets.add( new Planet("deathworld.png"));
planets.add( new Planet("detritus.png"));
planets.add( new Planet("vibeworld.png"));
planets.add( new Planet("lightworld.png"));
//planets.add( new Planet());
//planets.add( new Planet());
//planets.add( new Planet());
//planets.add( new Planet());
//planets.add(new Planet());

  for (int i = 0; i < 1000; i++) {
    stars.add(new Star());
  }
}

void draw() {
  
    camX = width/2-mbot.x;
  camY = height/2-mbot.y;
background(15,15,50);
  pushMatrix();
  translate(mbot.camX, mbot.camY);
//laser.display();
  // WORLD OBJECTS
  //fill(255);
  //rect(100,100,100,100);

 //stars.add (new Star());

    //Display and Remove stars
    for (int i = 0; i < stars.size(); i++) {
      //if (stars.size()<500)stars.add (new Star());
      Star star = stars.get(i);
            float d = dist(star.x,star.y,mbot.x,mbot.y);

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
    
    for(int  i = 0; i<planets.size();i++) {
      Planet planet = planets.get(i);
planet.display();
if (planet.noTouchie()) {
PVector getOut = mbot.move;
getOut.mult(-1);
      mbot.x+=getOut.x;
      mbot.y+=getOut.y;
}
    }

for(int  i = 0; i<lasers.size();i++) {
      Laser laser = lasers.get(i);
laser.display();
laser.move();
      if (laser.outOfBounds()) {
        lasers.remove(laser);
        i--;
      }

println("Laser :" +lasers.size());
//float d = dist(planet.x,planet.y,p.x,p.y);
//if () planets.add (new Planet());
}

    
  popMatrix();
mbot.display();
mbot.move();



}



void mouseClicked() {
lasers.add(new Laser(mbot.x,mbot.y));


}
