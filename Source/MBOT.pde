class MBOT {
  int x, y, xs, ys, camX, camY, ammo,wait,mammo;
  PImage mbot,mbotc;
  PVector move;
  float angle, sheild,blades,cyto,health;
  

  MBOT() {
    //x=width/2;
    //y=height/2;
    mbot = loadImage("johnson_tank.png");
    mbotc=loadImage("mbotc.png");
    camX=0;
    camY=0;
    xs=20;
    ys=20;
    move = new PVector(0, 0);
blades=0;
    health=100;
    sheild=50;
    mammo=50;
    ammo=50;
    cyto=100;
    wait=0;
    x=300;
    y=300;
  }

  void display() {
    imageMode(CENTER);
  }

  void move() {
    camX = width/2-x;
    camY = height/2-y;
    // float worldMouseX = mouseX - camX;
    //float worldMouseY = mouseY - camY;

    float worldMouseX = mouseX - camX;
    float worldMouseY = mouseY - camY;

    angle = atan2(worldMouseY - y, worldMouseX - x);
    //float angle = atan2(worldMouseY-height/2,worldMouseX-width/2);


    //  camX = width/2;
    //camY = height/2;

    pushMatrix();
    translate(camX, camY);
    translate(x, y);

    rotate(radians(angle*(180/PI)+90));
    if(blades>0) {blades-=50;}
    fill(255);
    circle(0,0,blades);
    if(charging)
    image(mbotc, 0, 0);


  if(!charging){
    image(mbot,0,0);
    PVector si = new PVector(x, y);
    PVector mouse = new PVector (worldMouseX, worldMouseY);
    PVector move2 = PVector.sub(mouse, si);
    move= move2;
    move.normalize();
    if (fast==true&&mousePressed&&mouseButton==RIGHT)
      move.mult(2*xs);
    else move.mult(xs);
    x+=move2.x;
    y+=move2.y;

    if (port==true&&keyPressed&&key==' '&&cyto>5&&bounded()&&wait<frameCount-1000) { 
        x=300;
        y=300;
        cyto-=5;
      wait=frameCount;
    } else if (mb==true&&keyPressed&&key==' '&&cyto>20&&wait<frameCount-1000){
    blades+=2000;
    cyto-=20;
    wait=frameCount;
    }

    x = constrain(x, -20500, 20500);
    y = constrain(y, -20500, 20500);
    // PVector move = new PVector(cos(angle), sin(angle));
    //move.mult(xs);
  }
    //x += move.x;
    //y += move.y;
    popMatrix();
  }
  
  
  boolean bounded() {
        if (x>20499|x<-20499|y>20499|y<-20499) {
return true;
  }else return false;
  }
}
