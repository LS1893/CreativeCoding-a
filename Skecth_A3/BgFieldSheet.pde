class BgField{

  ArrayList<Column> columns;
  int maxColWidth;
  int minColWidth;
  int windowHeight;
  int windowWidth;
  
  BgField(int minWidth, int maxWidth, int windowWidth, int windowHeight){
    this.columns = new ArrayList<Column>();
    this.minColWidth = minWidth;
    this.maxColWidth = maxWidth;
    this.windowHeight = windowHeight;
    this.windowWidth = windowWidth;
    
    init();
  }
  
  void init(){
    int currWidth = 1;
    while(currWidth + this.minColWidth <= this.windowWidth){
        int tmp = (int)random(this.minColWidth, this.maxColWidth);      
        this.columns.add(new Column(tmp, currWidth, this.windowHeight));
        currWidth += tmp;
    }
    this.columns.add(new Column(this.windowWidth - currWidth, currWidth, this.windowHeight));
  }
  
  void display(){
    int b = 0;
    for(Column c : columns){
      c.drawColumn();
      b++;
      System.out.println("Column " + b);
      
    }
    
    
    
  }















}
