import controlP5.*;

BgField background;
PGraphics layer1;
PGraphics layer2;
String s;
ControlP5 cp5;
int txtSize;

void setup(){
  size(1900, 1000);
  s = "A";
  txtSize = width/2;
  cp5 = new ControlP5(this);
  
  init();
  cp5.addTextfield("eingabe").setPosition(width/2 - 150, height - 90).setSize(100,40).setAutoClear(false);
  cp5.addSlider("slider").setPosition(width/2 + 50, height - 90).setSize(100, 40).setRange(100, 1000); 
}

void draw(){
  fill(255);
  noStroke();
  rect(width/2 - 200, height-100, 400, 80);
  
}

void init(){
  clear();
  layer1 = createGraphics(width, height);
  layer2 = createGraphics(width, height);
  
  layer1.beginDraw();
  background = new BgField(20, 120, width, height);
  background.display();
  layer1.endDraw();
  
  layer2.beginDraw();
  layer2.translate(width/2, height/2 - 100);
  layer2.noStroke();
  //layer2.fill(255);
  layer2.textSize(txtSize);
  layer2.textAlign(CENTER, CENTER);
  layer2.text(s, 0, 0);
  layer2.endDraw();

  layer2.filter(INVERT);
  layer1.mask(layer2);
 
  image(layer1, 0, 0);
}

void keyReleased(){
 if(key == ENTER){
    s = cp5.get(Textfield.class, "eingabe").getText();
    txtSize = (int)cp5.get(Slider.class, "slider").getValue();
    init();
    init();
  }
}
