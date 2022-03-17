class MovingEntity extends Entity{
  public PVector velocity;
  
  public float orientation;
  
  void collisionCheck(){
   if(position.x <= 25){
     orientation = 0;
     velocity.x = - velocity.x;
   }else if(position.x >= (996 - r)){
      position.x -= 5;
      orientation = PI;
      velocity.x = - velocity.x;
    }else if(position.y <= 49){
      orientation = PI/2;
      velocity.y = - velocity.y;
    }else if(position.y >= (749 - r)){
      position.y -= 5;
      orientation = -PI/2;
      velocity.y = - velocity.y;
    }
    
   try{
     int positionX = (int)(position.x - 15)/dividerWidth;
     int positionXL = (int)(position.x - (15 + (r/2)))/dividerWidth;
     int positionXR = (int)(position.x - (15 - r))/dividerWidth;
     int positionY = (int)(position.y - 39)/dividerHeight;
     int positionYU = (int)(position.y - (39 + r/2))/dividerHeight;
     int positionYD = (int)(position.y - (39 - r))/dividerHeight;

     if(currentLevel.map[positionXL][positionY] == 1){
       orientation = 0;
       velocity.x = - velocity.x;
       position.x += 2;
     }
     
     if(currentLevel.map[positionXR][positionY] == 1){
       orientation = PI;
       velocity.x = - velocity.x;
       position.x -= 2;
     }
   
     if(currentLevel.map[positionX][positionYU] == 1){
       orientation = PI/2;
       velocity.y = - velocity.y;
       position.y += 2;
     }
   
     if(currentLevel.map[positionX][positionYD] == 1){
       orientation = -PI/2;
       velocity.y = - velocity.y;
       position.y -= 2;
     }
   }catch(ArrayIndexOutOfBoundsException e){
     println("Out of Bounds");
     status = false;
  }
  }
  
  boolean targetFound(float targetX, float targetY){
    int vision = 750;
    if(dist(targetX, targetY, position.x + (r/2), position.y+ (r/2)) < vision/2){
      float xDistance = targetX - (position.x + (r/2));
      float yDistance = targetY - (position.y+ (r/2));
      float xIncrement = xDistance/10;
      float yIncrement = yDistance/10;
      
      PVector[] vectors = new PVector[10];
      for(int i = 0; i < 10; i++){
         PVector temp = new PVector((position.x + (r/2)) + (xIncrement * i), (position.y + (r/2)) + (yIncrement * i));
         vectors[i] = temp;
      }
      for(int i = 0; i < 10; i++){
        int positionX = (int)(vectors[i].x - 15)/dividerWidth;
        int positionY = (int)(vectors[i].y - 39)/dividerHeight;
        if(currentLevel.map[positionX][positionY] == 1){
           return false;
        }
      }
      return true;
    }
    return false;
      
  }
  
  void goTowards(float targetX, float targetY, int maxSpeed){
    PVector temp = new PVector(targetX - position.x + (r/2) , targetY - position.y+ (r/2));
    position.add(velocity) ;
    temp.normalize();
    velocity.add(temp);
    
    if (velocity.mag() > maxSpeed) {
      velocity.normalize() ; 
      velocity.mult(maxSpeed) ;
    }
  }
}
