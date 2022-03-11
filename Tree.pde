class Tree{
  Tree parent;
  int x1,
      x2,
      y1,
      y2;
       
  Tree(int x1, int x2, int y1, int y2, Tree parent){
    this.x1 = x1;
    this.x2 = x2;
    this.y1 = y1;
    this.y2 = y2;
    this.parent = parent;
  }
  
  int getSize(){
     return (x1-x2)*(y1-y2); 
  }
}
