class Pup {
  int x, y, diam, xs, ys;
  char type;
  //PVector moves;
  PImage pup;


  Pup(int x, int y, char type) {

    this.x=x;
    this.y=y;
    this.type=type;
    diam = 100;

    xs = int (random (-10, 10));
    ys=int (random (-10, 10));

    
    if (type=='h')
      pup= loadImage("hpup.png");
    else if (type == 'a')
      pup= loadImage("apup.png");
    }

    void display () {

      pup.resize(diam, diam);
      image (pup, x, y);
    }


  boolean noTouchie() {
    float d= dist(x, y, mbot.x, mbot.y);
    if (d <diam/2)return true;
    else return false;
  }
}
