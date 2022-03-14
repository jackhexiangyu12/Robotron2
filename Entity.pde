public abstract class Entity {
  public PVector position,
                 velocity;
  
  public float orientation;
  
  boolean status;
  
  int r;
  
  void spawn(int[][] map, int entityValue){
    int randomX = (int)random(0, horizontalDividers);
    int randomY = (int)random(0, verticalDividers);
    
    if(map[randomX][randomY] != 0){
       spawn(map, entityValue);
       return;
    }else{
      position.x = randomX * dividerWidth + 15 + (dividerWidth/2);
      position.y = randomY * dividerHeight + 39 + (dividerHeight/2);
      map[randomX][randomY] = entityValue;
    }
  }
}
