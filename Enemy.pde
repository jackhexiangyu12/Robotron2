class Enemy extends MovingEntity{
 
  
   void draw(int[] rgb){
     if(status){
        noStroke();
        fill(rgb[0], rgb[1], rgb[2]);
        square(position.x,position.y,r);
        collidingWithPlayer();
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
  
  Family closestFamilyMember(){
    Family closest = currentLevel.family[0];
    
    for(int i = 1; i <currentLevel.family.length; i++){
      if(currentLevel.family[i].status){
        float closestDist = dist(closest.position.x, closest.position.y, position.x + (r/2), position.y+ (r/2));
        float dist = dist(currentLevel.family[i].position.x, currentLevel.family[i].position.y, position.x + (r/2), position.y+ (r/2));
        if(dist < closestDist){
          closest = currentLevel.family[i];
        }
      }
      
    }
    
    return closest;
  }
  
}
