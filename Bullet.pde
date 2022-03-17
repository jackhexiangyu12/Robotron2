class Bullet extends MovingEntity{
 
 Bullet(float x, float y, float vel1, float vel2){
   velocity = new PVector(vel1, vel2);
   position = new PVector(x, y);
   status = true;
   r = 3;
 }
 
 void integrate() {
   if(status){
       collisionCheck();
       position.add(velocity);
   }
 }
 
 void draw(){
    if(status){
      noStroke();
      fill(255);
      circle(position.x,position.y,3);
    }
  }
  
  void collisionCheck(){
    if(status){
      if(position.x <= 25 || position.x >= 998 || position.y <= 49 || position.y >= 749){
        status = false;
        return;
      }
   
     int positionX = (int)(position.x - 15)/dividerWidth;
     int positionXL = (int)(position.x - (15 + r))/dividerWidth;
     int positionXR = (int)(position.x - (15 - r))/dividerWidth;
     int positionY = (int)(position.y - 39)/dividerHeight;
     int positionYU = (int)(position.y - (39 + r))/dividerHeight;
     int positionYD = (int)(position.y - (39 - r))/dividerHeight;
   
     if(currentLevel.map[positionXL][positionY] == 1){
       status = false;
       return;
     }

     if(currentLevel.map[positionXR][positionY] == 1){
       status = false;
       return;
     }
   
     if(currentLevel.map[positionX][positionYU] == 1){
        status = false;
        return;
     }
   
     if(currentLevel.map[positionX][positionYD] == 1){
       status = false;
       return;
     }
    }
  }
}
