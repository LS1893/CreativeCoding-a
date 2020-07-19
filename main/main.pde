import geomerative.*;

int dotSize = 3;
RShape svg;
int density = 3;
ArrayList<Dot> dots;
PVector vMouse = new PVector();

void setup(){
  size(1000, 1000);
  frameRate(120);
  background(0);
  RG.init(this);
  svg = RG.loadShape("example.svg");
  svg.scale(5);
  dots = new ArrayList<Dot>();
  
  for(int i = 0 ;i<1000;i++){
    for(int j = 0; j<1000 ;j++){
      if(random(0,100) <= density && svg.contains(i, j)){
        dots.add(new Dot(i, j, dotSize));
      }
    }
  }
}



void draw(){
  vMouse.x = mouseX;
  vMouse.y = mouseY;
  //background(0);
  clear();
  for(Dot d : dots){
    d.move(frameCount);
    d.drawDot();
  }
  //shape(svg, width/2, height / 2, 700, 900);
  
  //svg.draw();
}
