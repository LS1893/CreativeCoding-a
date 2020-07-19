class Dot{
  
  PVector vTarget;
  PVector vPos;
  PVector vDesire;
  PVector vVelocity;
  PVector vAcceleration;
  int dotSize;
  
  Dot(int x, int y, int dotSize){
    this.vPos = new PVector(x, y);
    ///this.vTarget = new PVector(x, y);
    this.dotSize = dotSize;
    this.vTarget = new PVector();
    this.vDesire = new PVector();
    this.vVelocity = new PVector(random(0,5),random(0,5));
    this.vAcceleration = new PVector(0, 0);
  }

  void drawDot(){
    noStroke();
    fill(00,200,00);
    circle(this.vPos.x, this.vPos.y, this.dotSize);
    
  }
  
  void move(int fCount){
    
    //vAcceleration.x += noise(fCount / 1000);
    //vAcceleration.y += noise(fCount / 1000);
    
    vVelocity.add(vAcceleration);
    vDesire = vTarget.sub(vPos);
    //PVector vSteering = 
    vPos.add(vDesire.sub(vVelocity));
     
  }
}
