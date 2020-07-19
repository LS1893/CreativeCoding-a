class Column{
  
  final int minimumHeight = 1;
  final int maximumHeight = 30;

  int minCellHeight;
  int maxCellHeight;

  int columnWidth;
  int xStartCoordinate;
  int windowHeight;

  Column(int columnWidth, int xStartCoordinate, int windowHeight){
    this.columnWidth = columnWidth;
    this.xStartCoordinate = xStartCoordinate;
    this.windowHeight = windowHeight;
    init();
  }

  void init(){
    int a = (int)random(this.minimumHeight, this.maximumHeight);
    int b = a * 3;
    
    if(a < b){
      this.maxCellHeight = b;
      this.minCellHeight = a;
    }else{
      this.maxCellHeight = a;
      this.minCellHeight = b;
    }
  }

  void drawColumn(){
    int cHeight = 0;
    boolean black = getColor();
    System.out.println(this.xStartCoordinate);
    while(cHeight + this.minCellHeight < this.windowHeight){
      int r = (int)random(this.minCellHeight, this.maxCellHeight);
      noStroke();
      if(black){
      //if(getColor()){
        fill(0);
      }else{
        fill(255);
      }
      rect(this.xStartCoordinate, cHeight, columnWidth, r);
      black = !black;
      cHeight += r;
    }
    
    if(black){
        fill(0);
      }else{
        fill(255);
      }
      rect(this.xStartCoordinate, cHeight, columnWidth, this.windowHeight - cHeight);
  }


  boolean getColor(){
    return random(0,1) > 0.5;
  }

}
