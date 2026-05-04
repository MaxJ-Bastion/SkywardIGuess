class Box {
  int x, y,w,h;
  //PVector moves;
  String name, line1, line2,pic;
  PImage guy;
  Box(String name, String line1, String line2, String pic,int w,int h) {
    //x = int (random (-width-mbot.x,width+mbot.x));
    //y = int (random (-height-mbot.y,height+mbot.y));
    //x=int (random (-4000,4000));
    //y=int (random (-4000,4000));
    this.name=name;
    this.line1=line1;
    this.line2=line2;
    this.pic=pic;
    this.w=w;
    this.h=h;
    //x= mbot.x;
    //y= mbot.y;
    guy=loadImage(pic);

  }

  void display () {
    fill(127,50);
    rect (20,20,w,h);
    fill(255,200);
    square(30,10,120);
    fill(255);
    textSize(30);
    textAlign(LEFT,CENTER);
    text(name,180,40);
    textSize(20);
    textAlign(LEFT,CENTER);
    text(line1,180,70);
    text(line2,180,100);
    guy.resize(120,120);
    image(guy,90,75);
  }
}
