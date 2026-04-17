class MBOT {
int x,y,xs, ys,camX,camY,health;
PImage mbot;
PVector move;
float angle;

  MBOT() {
  //x=width/2;
  //y=height/2;
  mbot = loadImage("johnson_tank.png");
  camX=0;
  camY=0;
  xs=20;
  ys=20;
  move = new PVector(0,0);
  
  health=100;
  }
  
  void display(){
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
      translate(camX,camY);
      translate(x,y);

    rotate(radians(angle*(180/PI)+90));
    image(mbot,0,0);
 
 

      PVector si = new PVector(x, y);
      PVector mouse = new PVector (worldMouseX, worldMouseY);
      PVector move2 = PVector.sub(mouse, si);
      move= move2;
      move.normalize();
      move.mult(xs);
      x+=move2.x;
      y+=move2.y;
     x = constrain(x, -4500,
      4500);
    y = constrain(y, -4500, 4500);
// PVector move = new PVector(cos(angle), sin(angle));
//move.mult(xs);

//x += move.x;
//y += move.y;
  popMatrix();
  
  
  
  }
  
  
  
  
}
