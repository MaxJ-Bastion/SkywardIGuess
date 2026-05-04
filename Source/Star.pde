class Star {
  int x, y, diam, speed;
  PVector moves;
color c;
  Star() {
    x = int (random (-width-mbot.x,width+mbot.x));
    y = int (random (-height-mbot.y,height+mbot.y));
    diam = int (random (1, 7));
    speed = 10;
    c = int((random (100, 225)));
  }

  void display () {
    fill (c);
    ellipse (x, y, diam, diam);
  }

  void move() {
    moves = mbot.move;
    //move.mult (speed);
      x-=moves.x;
      y-=moves.y;
    
    
  }

  //boolean reachedBottom () {
  //  if (y> camY+10) {
  //    return true;
  //  } else {
  //    return false;
  //  }
  //}
}
