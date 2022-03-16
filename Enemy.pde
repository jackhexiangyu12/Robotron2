class Enemy extends Entity{
  
   void draw(int[] rgb){
     if(status){
        noStroke();
        fill(rgb[0], rgb[1], rgb[2]);
        square(position.x,position.y,r);
        collidingWithPlayer();
     }
    }
    
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
  
  }
  
  boolean collidingWithBullet(Bullet bullet){
    if((bullet.position.x <= position.x + r) && (bullet.position.x >= position.x)){
      if((bullet.position.y <= position.y + r) && (bullet.position.y >= position.y)){
        return true;
      }
    }
    return false;
  }
  
  void collidingWithPlayer(){
    if(player.lives > 0 & player.iFrames == 0){
      if(((player.position.x - player.r) <= position.x + r) && ((player.position.x + player.r)>= position.x)){
        if(((player.position.y - player.r) <= position.y + r) && ((player.position.y + player.r) >= position.y)){
          playerDamage.play();
          player.lives--;
          player.iFrames = 90;
          playerDamage.rewind();
        }
      }
    }
  }
  
}
