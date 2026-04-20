//Maxwell Johnson| April 1, 2026 | Tank Game (Skyward themed)
MBOT mbot;
//KRELL krell;
Timer sheildt,kltime,kr;
//Asteroid aster;
//Laser laser;
//Planet planet;
ArrayList<Planet> planets = new ArrayList<Planet>();
ArrayList<KRELL> bads = new ArrayList<KRELL>();
ArrayList<Star> stars = new ArrayList<Star>();
ArrayList<Laser> lasers = new ArrayList<Laser>();
ArrayList<KLaser> klasers = new ArrayList<KLaser>();
ArrayList<Asteroid> asters = new ArrayList<Asteroid>();
int camX, camY, realCamX, realCamY, oldX, oldY, moveX, moveY, time, score,level;
boolean fast,s,port;
void setup() {
  fullScreen();
  //size(800,800);
  background(15, 15, 50);
  mbot= new MBOT();
 // krell = new KRELL();
  //laser=new Laser(0,0);
  //aster=new Asteroid();
  planets.add( new Planet("planet.png", int (random (-8000, 8000)), int (random (-8000, 8000))));
  planets.add( new Planet("roshar.png", int (random (-8000, 8000)), int (random (-8000, 8000))));
  planets.add( new Planet("deathworld.png", int (random (-8000, 8000)), int (random (-8000, 8000))));
  planets.add( new Planet("detritus.png", 0, 0));
  planets.add( new Planet("vibeworld.png", int (random (-8000, 8000)), int (random (-8000, 8000))));
  planets.add( new Planet("lightworld.png", 1500,1500));
  planets.add( new Planet("clarkplanet1.png", int (random (-8000, 8000)), int (random (-8000, 8000))));
  planets.add( new Planet("ringodeath.png", int (random (-8000, 8000)), int (random (-8000, 8000))));
// bads.add(new KRELL());
  //planets.add( new Planet());
  //planets.add( new Planet());
  //planets.add(new Planet());
  realCamX=0;
  realCamX=0;
  time=0;
  sheildt=new Timer(2000);
  kltime=new Timer(500);
  kltime.start();
  kr=new Timer(10000);
  kr.start();
  for (int i = 0; i < 1000; i++) {
    stars.add(new Star());
  }

  score=0;
  level=1;
}

void draw() {

  camX = width/2-mbot.x;
  camY = height/2-mbot.y;

//level =int(score/5000);

  oldX=realCamX;
  oldY=realCamY;
  moveX=(mbot.camX-oldX)/3;
  moveY=(mbot.camY-oldY)/3;
  realCamX+=moveX;
  realCamY+=moveY;

  background(15, 15, 50);
  pushMatrix();
  translate(realCamX, realCamY);
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

  if (asters.size()<20) asters.add (new Asteroid());
  for (int  i = 0; i<asters.size(); i++) {
    Asteroid aster = asters.get(i);
    aster.display();
    aster.move();

    if (aster.noTouchie()) {
      PVector getOut = mbot.move;
      getOut.mult(-3);
      mbot.x+=getOut.x;
      mbot.y+=getOut.y;
      if (mbot.sheild>0&&s==true) {
        mbot.sheild-=1;
        sheildt.start();
      } else
      mbot.health-=1;
      sheildt.start();
      // asters.remove(aster);
    }
    //if (laser.outOfBounds()) {
    //  lasers.remove(laser);
    //  i--;
    //}

    // println("Laser000000000000000000000000000000000000 :" +lasers.size());
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
      
      if(planet.name=="roshar.png") {s=true;}
      else if(planet.name=="vibeworld.png") {fast=true;}
      else if(planet.name=="lightworld.png") {port=true;}
    }
  }
  if (mousePressed&&lasers.size()<100&&(frameCount-time)>10) {
    lasers.add (new Laser(mbot.x, mbot.y));
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
      if (laser.intersectA(aster)&&lasers.size()>0) {
        lasers.remove(laser);
        i--;
        aster.health--;
        if (aster.health ==0) {
          asters.remove(aster);
          j--;
          score+=100;
        } else {
          aster.diam/=2;
          score+=100;
        }
      }
    }
    
    for (int  j = 0; j<bads.size(); j++) {
      KRELL k = bads.get(j);
      if (laser.intersectK(k)&&lasers.size()>0) {
        lasers.remove(laser);
        i--;
        k.health--;
        if (k.health ==0) {
          bads.remove(k);
          j--;
          score+=1000;
      }
    }
    }
    println("Asteroids :" +asters.size());
    //float d = dist(planet.x,planet.y,p.x,p.y);
    //if () planets.add (new Planet());
  }
  
  
  
  
  
  
 
  for (int  i = 0; i<klasers.size(); i++) {
    KLaser kl = klasers.get(i);
    kl.display();
    kl.move();
    //if (laser.outOfBounds()) {pppppppp
    //  lasers.remove(laser);
    //  i--;
    //}
    if (kl.outOfBounds()&&klasers.size()>1) {
      klasers.remove(kl);
    }



      if (kl.intersect()&&klasers.size()>0) {
        klasers.remove(kl);
        i--;
        if(mbot.sheild>0&&s==true) {mbot.sheild-=5;} else
        mbot.health-=5;
    }
    
    println("Asteroids :" +asters.size());
    //float d = dist(planet.x,planet.y,p.x,p.y);
    //if () planets.add (new Planet());
  }
  
  
  
  
  
  if(kr.isFinished()) { bads.add(new KRELL());bads.add(new KRELL());kr=new Timer(60000/level); kr.start();}
    for (int  i = 0; i<bads.size(); i++) {
      KRELL k = bads.get(i);
      k.display();
      k.move();
      
         if (k.fighting()&&k.ktimer.isFinished()) {
    klasers.add (new KLaser(k.x, k.y,k));
    k.ktimer.start();
  }
    }
  //krell.display();
  //krell.move();


  popMatrix();
  mbot.display();
  mbot.move();

  scoreBoard();
}




void scoreBoard() {
  fill(255);
  text(mbot.x/85+", "+mbot.y/-85,50,50);
  fill(127, 127);
  rect(0, height-100, width, 100);
  textSize(50);
  fill(40, 60, 200);
  text("Score: "+score, 100, height-25);
  text("Level:" +level,500,height-25);
//health
  fill(255, 10, 10);
  rect(50, height-450, 10, 300 );

  fill(10, 255, 10);
  if (mbot.health>0)
    rect(50, height-(150+mbot.health*3), 10, mbot.health*3 );

//sheild

if(s==true) {
if(sheildt.isFinished()&&mbot.sheild<100) {mbot.sheild+=.05;}

  fill(10, 10, 10);
  rect(75, height-450, 10, 300 );

  fill(70, 100, 255);
  if (mbot.sheild*3>0)
    rect(75, height-(150+mbot.sheild*3), 10, mbot.sheild*3 );
}
}
//void mouseClicked() {
//  lasers.add(new Laser(mbot.x, mbot.y));
//}
