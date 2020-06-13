import java.util.ArrayList;
import java.util.Random;

int diameter = 50;  
color[] colors;
ArrayList<Snake> snakes;
int stepSize = 20;
int maxSnakes = 10;
int height = 1000;
int width = 1000;


void setup() {
   background(0);
  colors = new color[5];
  colors[0] = color(80, 81, 79);
  colors[1] = color(242, 95, 92);
  colors[2] = color(255, 224, 102);
  colors[3] = color(36, 123, 160);
  colors[4] = color(112, 193, 179);
  size(1000, 1000);
  setupSnakes();
}


void setupSnakes(){
   this.snakes = new ArrayList();
  int random = getRandom(1, maxSnakes);
  for(int i = 0; i<random; i++){
    int startX = getRandom(0, width);
    int startY = getRandom(0, height);
    int c = colors[getRandom(0,colors.length - 1)];
    this.snakes.add(new Snake(startX, startY, c, stepSize, diameter));
  }
}

void draw() {
  
  noFill();
  stroke(255, 200);
   
  for(Snake snake : snakes){
     snake.nextX();
     snake.nextY();
     snake.drawSnake();
  }
}

void mouseClicked(){
  clear();
  setupSnakes();
}

int getRandom(int low, int high){
  Random r = new Random();
  int i = r.nextInt(high-low) + low;
  return i;
}


class Snake{
  int x;
  int y;
  color c;
  int stepSize;
  int diameter;
  
 public Snake(int x, int y, color c, int stepSize, int diameter){
  this.x = x;
  this.y = y;
  this.c = c;
  this.stepSize = stepSize;
  this.diameter = diameter;
 }
 
 void nextX(){                                                        
   int n;
   do{
     n = getRandom(0, this.stepSize);
     if(0 == getRandom(0,2)){
       n *= (-1);
     }
   }while(n + this.x >= height || n + this.x <= 0);
   //System.out.println(n);
   this.x += n; 
 }
 
 void nextY(){
   int n;
   do{
     n = getRandom(0, this.stepSize);
     if(0 == getRandom(0,2)){
       n *= (-1);
     }
   }while(n + this.y >= height || n + this.y <= 0);
   this.y += n; 
 }
 
 void setX(int x){
   this.x = x;
 }
 
 void setY(int y){
   this.y = y; 
 }
 
 void drawSnake(){
   noFill();
   stroke(this.c);
   circle(this.x, this.y, this.diameter);
 }
}
