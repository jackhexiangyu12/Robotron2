class Family extends MovingEntity{
  Boolean saved; 
  
   Family(float x, float y){
   position = new PVector(x, y);
   status = true;
   r = 20;
   orientation = 0;
   velocity = new PVector(0, 0);
   saved = false;
  }
  
   void draw(int[] rgb){
     if(status){
        noStroke();
        fill(rgb[0], rgb[1], rgb[2]);
        square(position.x,position.y,r);
        collidingWithPlayer();
        collidingWithThreat();
    }
   }
  
  boolean collidingWithPlayer(){
    if(player.lives > 0 && status == true){
      if(((player.position.x - player.r) <= position.x + r) && ((player.position.x + player.r)>= position.x)){
        if(((player.position.y - player.r) <= position.y + r) && ((player.position.y + player.r) >= position.y)){
          familySaved.play();
          saved = true;
          status = false;
          familySaved.rewind();
          return true;
        }
      }
    }
    return false;
  }
  
  void integrate() {
    if(player.lives > 0 && status){
       collisionCheck();
       PVector closest = nearestThreat();
       if(targetFound(player.position.x, player.position.y)){
         goTowards(player.position.x, player.position.y, 2);
       }else if(targetFound(closest.x, closest.y)){
         if(closest.z == 1){
           goAway(player.position.x, player.position.y);
         } 
       }else{
         velocity.x = cos(orientation) ;
         velocity.y = sin(orientation) ;
    
         position.add(velocity) ;
    
         // randomly update orientation a little
         orientation += random(0, PI/32) - random(0, PI/32) ;
         // Keep in bounds
         if (orientation > PI) orientation -= 2*PI ;
         else if (orientation < -PI) orientation += 2*PI ;
       }
    }
  }
  
  PVector nearestThreat(){
    PVector closest = new PVector(-1000, -1000);

    
    if(numberOfHulks() > 0){
      for(int i = 0; i <currentLevel.hulks.length; i++){
        if(currentLevel.hulks[i].status){
          float closestDist = dist(closest.x, closest.y, position.x + (r/2), position.y+ (r/2));
          float dist = dist(currentLevel.hulks[i].position.x, currentLevel.hulks[i].position.y, position.x + (r/2), position.y+ (r/2));
          if(dist < closestDist){
            closest = currentLevel.hulks[i].position;
            if(currentLevel.hulks[i].status){
              closest.z = 1;
            }else{
              closest.z = 0;
            }
          }
        }
      }
    }
    
    if(numberOfConverters() > 0){
      for(int i = 0; i <currentLevel.converters.length; i++){
        if(currentLevel.converters[i].status){
          float closestDist = dist(closest.x, closest.y, position.x + (r/2), position.y+ (r/2));
          float dist = dist(currentLevel.converters[i].position.x, currentLevel.converters[i].position.y, position.x + (r/2), position.y+ (r/2));
          if(dist < closestDist){
            closest = currentLevel.converters[i].position;
            if(currentLevel.converters[i].status){
              closest.z = 1;
            }else{
              closest.z = 0;
            }
          }
        }
      }
    }
    
    return closest;
  }
  
  void goAway(float targetX, float targetY){
    PVector temp = new PVector((position.x + (r/2)) - targetX  , (position.y + (r/2)) - targetY);
    position.add(velocity) ;
    temp.normalize();
    velocity.add(temp);
    
    if (velocity.mag() > 2) {
      velocity.normalize() ; 
      velocity.mult(2) ;
    }
  }
  
  void collidingWithThreat(){
    if(numberOfHulks() > 0){
      for(int i = 0; i <currentLevel.hulks.length; i++){
        if(currentLevel.hulks[i].status){
          if(((currentLevel.hulks[i].position.x) < position.x + r) && ((currentLevel.hulks[i].position.x + currentLevel.hulks[i].r) > position.x)){
            if(((currentLevel.hulks[i].position.y) < position.y + r) && ((currentLevel.hulks[i].position.y + currentLevel.hulks[i].r) > position.y)){
              familyDeath.play();
              status = false;
              familyDeath.rewind();
            }
          }
        }
      }
    }
    
    if(numberOfConverters() > 0){
      for(int i = 0; i <currentLevel.converters.length; i++){
        if(currentLevel.converters[i].status){
          if(((currentLevel.converters[i].position.x) < position.x + r) && ((currentLevel.converters[i].position.x + currentLevel.converters[i].r) > position.x)){
            if(((currentLevel.converters[i].position.y) < position.y + r) && ((currentLevel.converters[i].position.y + currentLevel.converters[i].r) > position.y)){
              convert.play();
              status = false;
              currentLevel.bloodhounds[currentLevel.bloodhounds.length - currentLevel.familyConverted] = new Bloodhound(position.x,position.y, 3);
              currentLevel.familyConverted++;
              convert.rewind();
            }
          }
        }
      }
    }
  }
  
  
  
}
