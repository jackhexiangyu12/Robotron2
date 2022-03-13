public abstract class Entity {
  public PVector position,
                 velocity;
  
  public float orientation,
               rotation;
               
  void spawn(int[][] map){
    int randomX = (int)random(0, horizontalDividers);
    int randomY = (int)random(0, verticalDividers);
    
    if(map[randomX][randomY] == 1){
       spawn(map);
       return;
    }else{
      position.x = randomX * dividerWidth + 15 + (dividerWidth/2);
      position.y = randomY * dividerHeight + 39 + (dividerHeight/2);
    }
    
    
  }
             
}
