//Maxwell Johnson| April 1, 2026 | Tank Game (Skyward themed)
MBOT mbot;
Box box;
Planet detritus;
Button arrowb, healthb, cytob, sheildb;
//KRELL krell;
Timer sheildt, kr, dt, textt;
//Asteroid aster;
//Laser laser;
//Planet planet;
ArrayList<Planet> planets = new ArrayList<Planet>();
ArrayList<KRELL> bads = new ArrayList<KRELL>();
ArrayList<Star> stars = new ArrayList<Star>();
ArrayList<Laser> lasers = new ArrayList<Laser>();
ArrayList<DLaser> dls = new ArrayList<DLaser>();
ArrayList<KLaser> klasers = new ArrayList<KLaser>();
ArrayList<Asteroid> asters = new ArrayList<Asteroid>();
ArrayList<Pup> puppies = new ArrayList<Pup>();
int camX, camY, realCamX, realCamY, oldX, oldY, moveX, moveY, time, score, level, unl, xp,armor;
boolean fast, s, port, detdef, pow,invis,cvis, mb, start, ar,sup;
PImage he, she, am, cy, back, det;
char screen;
void setup() {
  fullScreen();
  //size(800,800);
  background(15, 15, 50);
  mbot= new MBOT();
  box = new Box("MBOT:", "Those KRELL really look like bad news, let's go find some planets to give us the technology and training", "that we need to stop them from destroying Detritus!!!", "johnson_tank.png", 1050, 100);
  arrowb = new Button( "Planetary Locator", "5000 XP", 100, 100, 100, 100, "arrow.png");
  healthb = new Button( "Repairs", "1000XP", 100, 250, 100, 100, "hpup.png");
  cytob = new Button( "Cytonic Recharge", "1000 XP", 100, 400, 100, 100, "cytopup.png");
  sheildb = new Button( "Sheild Upgrade", "5000 XP", 100, 550, 100, 100, "spup.png");

  // krell = new KRELL();
  //laser=new Laser(0,0);
  //aster=new Asteroid();
  detritus = new Planet("detritus.png", 0, 0);
  planets.add( new Planet("rockyp.png", int (random (-20000, 12000)), int (random (-20000, 20000))));
  planets.add( new Planet("roshar.png", int (random (-20000, 20000)), int (random (-20000, 20000))));
  planets.add( new Planet("deathworld.png", int (random (-20000, 20000)), int (random (-20000, 20000))));
  //planets.add( new Planet("detritus.png", 0, 0));
  planets.add( new Planet("vibeworld.png", int (random (-20000, 20000)), int (random (-20000, 20000))));
  planets.add( new Planet("lightworld.png", int (random (-20000, 20000)), int (random (-20000, 20000))));
  planets.add( new Planet("clarkplanet1.png", int (random (-20000, 20000)), int (random (-20000, 20000))));
  planets.add( new Planet("ringodeath.png", int (random (-20000, 20000)), int (random (-20000, 20000))));
  planets.add( new Planet("desertp.png", int (random (-20000, 20000)), int (random (-20000, 20000))));
  // bads.add(new KRELL());
  //planets.add( new Planet());
  //planets.add( new Planet());
  //planets.add(new Planet());
  realCamX=0;
  realCamX=0;
  time=0;
  sheildt=new Timer(5000);
  //  kltime=new Timer(500);
  // kltime.start();
  kr=new Timer(100);
  kr.start();
  textt=new Timer(10000);
  textt.start();
  dt=new Timer(2000);
  dt.start();
  det=loadImage("detritus.png");
  for (int i = 0; i < 1000; i++) {
    stars.add(new Star());
  }

  score=0;
  level=0;
  unl=2;
  pow=false;
  mb=false;
  start=false;
  ar=false;
  sup=false;
  invis=false;
  cvis=false;
  armor=1;
  he= loadImage("hpup.png");
  she=loadImage("spup.png");
  am=loadImage("apup.png");
  cy= loadImage("cytopup.png");
  back=loadImage("SkyBack.png");

  he.resize(40, 40);
  she.resize(40, 40);
  am.resize(40, 40);
  cy.resize(40, 40);
  screen='s';
  xp=0000;
}

void draw() {
  switch(screen) {
  case 's':
    startScreen();
    break;
  case 'p':
    game();
    break;
  case 'd':
    detBase();
    break;
  }
}


void startScreen() {
  background(back);
}

void game() {

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
  //  if(dt.isFinished()&&detdef==true) {
  //  dls.add (new DLaser());
  //dt.start();
  //}

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
        mbot.sheild-=(1/armor);
        sheildt.start();
      } else
        mbot.health-=(1/armor);
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


  for (int  i = 0; i<puppies.size(); i++) {
    Pup p = puppies.get(i);
    p.display();


    if (p.noTouchie()) {
      if (p.type =='h') {
        mbot.health+=10;
        if (mbot.health>100) mbot.health=100;
      }

      if (p.type =='a') {
        mbot.ammo=mbot.mammo;

      }

      if (p.type =='c') {
        mbot.cyto+=10;
        if (mbot.cyto>100) mbot.cyto=100;
      }



      puppies.remove(p);
    }
  }

  for (int  i = 0; i<planets.size(); i++) {
    Planet planet = planets.get(i);
    planet.display();
    if (planet.touched==false&&ar==true)planet.arrow();
    //if(detdef) {


    //}

    if (planet.noTouchie()) {
      PVector getOut = mbot.move;
      getOut.mult(-2);
      mbot.x+=getOut.x;
      mbot.y+=getOut.y;
      planet.touched=true;
      if (planet.name=="roshar.png") {
        textt.start();
        box = new Box("MBOT:", "Great job finding Roshar! I think this Fabrial shield tech will really help us not be killed by the KRELL. Unfortunately, it seems like", " this planet is completely devoid of mushrooms, which is sad, we should come back with some later as a thank you.", "johnson_tank.png", 1250, 100);
        s=true;
      } else if (planet.name=="vibeworld.png") {
        textt.start();
        box = new Box("MBOT:", "There should be a new control on your console, Spensa. You should be able to right click to Overburn and speed up. I'm honestly a little insulted you feel you need", " something like this, because I was already the coolest fastest ship ever. At least, that's what I would feel if I could feel insulted, and wasn't simulating it with a subroutine.", "johnson_tank.png", 1600, 100);
        fast=true;
      } else if (planet.name=="lightworld.png") {
        textt.start();
        box = new Box("Spensa:", "Woah. MBOT, I think I can use this training to instantly teleport back to Detritus when I hit the spacebar at the edge of the map.", "It will probably take some of my cytonic energy, but it should be useful if we need to get back to defend Detritus in a hurry.", "spensa.png", 1275, 100);
        port=true;
      } else if (planet.name=="deathworld.png") {
        detdef=true;
      } else if (planet.name=="ringodeath.png") {
        textt.start();
        box = new Box("MBOT:", "Hmmmmm.... Not sure how I feel about this. I am obviously just a mushroom research vessel, but it seems we will now be able to", "defend those mushrooms far more effectively, as that planet just upgraded my destructors.", "johnson_tank.png", 1250, 100);
        pow=true;
      } else if (planet.name=="desertp.png") {
        textt.start();
        box = new Box("Spensa:", "Finally! Jorgan's been casually holding it over me that he can use mindblades and I can't. I think with the training from that planet, I", " can make them now by pressing the spacebar. I think it'll take a lot of my cytonic energy, but it should be a useful weapon.", "spensa.png", 1300, 100);
        mb=true;
      } else if (planet.name=="clarkplanet1.png") {
        textt.start();
        box = new Box("Spensa:", "This should be cool, I think I can use cytonic projections to turn invisible when I'm holding z. I can't wait to see the looks on those", " KRELL faces when they get attacked out of nowhere.", "spensa.png", 1300, 100);
        cvis=true;
      } else if (planet.name=="rockyp.png") {
        textt.start();
        box = new Box("MBOT:", " Check out the new armor, Spensa. Nothing the KRELL can throw at us is getting through my new fit. I found that word in a old database of human slang,", " I've been waiting all day for a chance to use it.", "johnson_tank.png", 1300, 100);
        if (armor<2) armor+=1;
      }
    }
  }
  if (mousePressed&&lasers.size()<100&&(frameCount-time)>10&&mouseButton==LEFT&&mbot.ammo>0) {
    lasers.add (new Laser(mbot.x, mbot.y));
    time=frameCount;
    mbot.ammo-=1;
  }
  for (int  i = 0; i<lasers.size(); i++) {
    if (i>0) {
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
          if (pow==true) {
            aster.health-=5;
          } else
            aster.health--;
          if (aster.health <=0) {
            asters.remove(aster);
            j--;
            score+=100;
            float r = int(random(0, 1));
            puppies.add(new Pup( aster.x, aster.y, 'a'));
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
          if (pow ==true) {
            k.health-=3;
          } else
            k.health--;
          if (k.health <=0) {
            bads.remove(k);
            j--;
            score+=1000;
            xp+=1000 ;

            float r=random(0, 10);
            if (r<1) {
              textt.start();
              box = new Box("Spensa:", "DIE, KRELLish scum!!! Your ashes will surely float in space for", "eternity, and you grandchilren will weep for your utter demise!", "spensa.png", 700, 100);
            } else  if (r<2) {
              textt.start();
              box = new Box("MBOT:", "Nice shot Spensa. Your weird fleshy brain is good for something after all!", "", "johnson_tank.png", 800, 75);
            } else  if (r<3) {
              textt.start();
              box = new Box("MBOT:", "*Malevolent AI death noises*", "...Do you like my new subroutine?", "johnson_tank.png", 600, 100);
            } else  if (r<4) {
              textt.start();
              box = new Box("Quirk:", "Spin, leave some for the rest of us!", "", "cytopup.png", 800, 75);
            } else  if (r<5) {
              textt.start();
              box = new Box("Doomslug:", "Chirp!", "", "cytopup.png", 500, 75);
            } else  if (r<6) {
              textt.start();
              box = new Box("Jorgan:", "What on earth are you doing Spensa?! That manuver was incredibly reckless.", "...Good job.", "cytopup.png", 800, 100);
            } else  if (r<7) {
              textt.start();
              box = new Box("Rig:", "Looks like those new controls are working, tell me if there's something you need to tweak.", "", "cytopup.png", 1000, 75);
            } else  if (r<8) {
              textt.start();
              box = new Box("Cobb:", "Remember your training Spensa, stop hunting for glory with destructors blazing.", "That said, keep up the good work. ***** those ***** *****", "cytopup.png", 1000, 100);
            } else  if (r<9) {
              textt.start();
              box = new Box("Gran Gran:", "Next time, try it with your eyes closed. Should be more fun", "", "cytopup.png", 800, 75);
            } else  if (r<10) {
              textt.start();
              box = new Box("Boomslug:", "BOOM!", "", "cytopup.png", 500, 75);
            } else  if (r<11) {
              textt.start();
              box = new Box("FM:", "Nice going Spin! Let's get that next one together", "", "cytopup.png", 700, 75);
            } else  if (r<12) {
              textt.start();
              box = new Box("MBOT:", "That explosion looked kind of like a mushroom", "", "johnson_tank.png", 600, 75);
            } else  if (r<13) {
              textt.start();
              box = new Box("Spensa:", "Boom! That puts me in the lead! Eat it, Jorgan!", "", "spensa.png", 600, 75);
            } else  if (r<14) {
              textt.start();
              box = new Box("Ironsides:", "We thank the valiant warriors that today defend Detritus", "", "cytopup.png", 800, 75);
            } else  if (r<15) {
              textt.start();
              box = new Box("Doomslug:", "Die KRELL scum!!! :)", "", "cytopup.png", 500, 75);
            }


            if (random(0, 1)>.25)
              puppies.add(new Pup( k.x, k.y, 'h'));
            else puppies.add(new Pup( k.x, k.y, 'c'));

            // unl--;
          }
        }
      }
      println("Asteroids :" +asters.size());
      //float d = dist(planet.x,planet.y,p.x,p.y);
      //if () planets.add (new Planet());
    }
  }


  //if (unl == 0)
  //{level+=1;
  //unl=level;

  //}



  for (int  i = 0; i<dls.size(); i++) {
    DLaser d = dls.get(i);

    //if (laser.outOfBounds()) {pppppppp
    //  lasers.remove(laser);
    //  i--;
    //}
    if (d.outOfBounds()&&dls.size()>1) {
      dls.remove(d);
    }

    for (int  j = 0; j<bads.size(); j++) {


      KRELL k = bads.get(j);
      float go=dist(0, 0, k.x, k.y);

      if (go<1500&&detdef==true) {
        d.display(k);
        d.move(k);
        if (d.intersectK(k)&&dls.size()>0) {
          dls.remove(d);
          i--;
          //k.health--;
          //if (k.health ==0) {
          bads.remove(k);
          j--;
          // score+=1000;
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
      if (mbot.sheild>0&&s==true) {
        mbot.sheild-=(5/armor);
        sheildt.start();
      } else
        mbot.health-=(5/armor);
    }

    println("Asteroids :" +asters.size());
    //float d = dist(planet.x,planet.y,p.x,p.y);
    //if () planets.add (new Planet());
  }





  //if (kr.isFinished()) {
  //  bads.add(new KRELL());
  //  bads.add(new KRELL());
  //  bads.add(new KRELL());
  //  bads.add(new KRELL());
  //  bads.add(new KRELL());
  //  bads.add(new KRELL());

  //  kr=new Timer(60000);
  //  kr.start();
  //  level+=1;
  //}
  if (bads.size()<level+1) {
    bads.add(new KRELL());
  }

  level=int(score/5000)+1;


  for (int  i = 0; i<bads.size(); i++) {
    KRELL k = bads.get(i);
    k.display();
    k.move();

    if (k.fighting()&&k.ktimer.isFinished()&&invis==false) {
      klasers.add (new KLaser(k.x, k.y, k));
      k.ktimer.start();
    }


    float d = dist(k.x, k.y, mbot.x, mbot.y);
    if (d<mbot.blades) {
      bads.remove(k);
    }
  }
  //krell.display();
  //krell.move();
  detritus.display();
  if (detritus.noTouchie()) {
    PVector getOut = mbot.move;
    getOut.mult(-2);
    mbot.x+=getOut.x;
    mbot.y+=getOut.y;
    if (mousePressed)
      screen='d';
  }

  popMatrix();
  mbot.display();
  mbot.move();

  scoreBoard();
  if (textt.isFinished()==false)
    box.display();
}




void scoreBoard() {
  rectMode(CORNER);
  if(invis==true){
  fill(50,50,255,50);
  rect(0,0,width,height);
  }
  fill(127, 127);
  rect(0, height-100, width, 100);
  textSize(50);
  fill(200, 200, 50);
  text("Score: "+score, 100, height-40);
  text("Level:" +level, 500, height-40);
  text(mbot.x/85+", "+mbot.y/-85, width-200, height-40);

  imageMode(CENTER);
  //health
  fill(255, 10, 10);
  rect(50, height-450, 10, 300 );

  fill(10, 255, 10);
  if (mbot.health>0)
    rect(50, height-(150+mbot.health*3), 10, mbot.health*3 );
  image(he, 55, height-120);
  //sheild

  if (s==true) {
    if (sheildt.isFinished()&&mbot.sheild<50) {
      if(!sup)
      mbot.sheild+=.05;
      else
      mbot.sheild+=1;
    }

    fill(10, 10, 10);
    rect(85, height-450, 10, 300 );

    fill(70, 100, 255);
    if (mbot.sheild*6>0)
      rect(85, height-(150+mbot.sheild*6), 10, mbot.sheild*6 );

    image(she, 90, height-120);
  }


  //ammo
  fill(50);
  rect(width-50, height-450, 10, 300 );

  fill(200, 150, 30);
  if (mbot.ammo>0){
  float scale=300/mbot.mammo;
    rect(width-50, height-(150+mbot.ammo*scale), 10, mbot.ammo*scale );
  }
  image(am, width-45, height-120);

  //cyto
  fill(50);
  rect(width-85, height-450, 10, 300 );
  if (mbot.wait<frameCount-1000)
    fill(50, 0, 250);
  else fill (50, 200, 100);
  if (mbot.cyto>0)
    rect(width-85, height-(150+mbot.cyto*3), 10, mbot.cyto*3 );

  image(cy, width-80, height-120);
}

void detBase () {
  background (50, 50, 100);
  //pushMatrix();
  //translate(width/2,height/2);
  det.resize(1000, 1000);
  imageMode(CENTER);
  image(det, width/2, height/2);
  //popMatrix();
  mbot.ammo=mbot.mammo;
  textAlign(CENTER, CENTER);
  textSize(100);
  fill(255);
  text("Press 'e' to leave", width/2, height-100);
  text("XP:"+xp, width-200, 100);
  arrowb.display();
  if (arrowb.clicked()&&xp>4999&&ar==false&&mousePressed) {
    ar=true;
    xp-=5000;
  }
  healthb.display();
  cytob.display();
  sheildb.display();
  if (keyPressed&&key=='e') {
    mbot.x=300;
    mbot.y=300;
    screen='p';
  }
}

void mouseClicked() {
  if (screen=='s') screen= 'p';
  
  
  
    if (healthb.clicked()&&xp>999&&mbot.health<100) {
    mbot.health=100;
    xp-=1000;
  }  if (cytob.clicked()&&xp>999&&mbot.cyto<100) {
    mbot.cyto=100;
    xp-=1000;
  }
    if (sheildb.clicked()&&xp>4999&&sup==false&&s==true) {
    sup=true;
    xp-=5000;
    sheildt=new Timer(2000);
  }
}

void keyPressed() {
if(key=='z'&&cvis==true) {
invis=true;
mbot.cyto-=.3;
}
}

void keyReleased() {
if(key=='z') {
invis=false;
}

}
