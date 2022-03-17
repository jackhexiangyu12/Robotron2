class RobotStandard extends Enemy{
  
  int maxSpeed;
 
  RobotStandard(float x, float y, int maxSpeed){
   position = new PVector(x, y);
   status = true;
   r = 25;
   orientation = 0;
   velocity = new PVector(0, 0);
   this.maxSpeed = maxSpeed;
  }
  
  void integrate() {
    if(currentLevel.freeze == 0 && screenView == gameScreen && player.lives > 0){
      collisionCheck();
      if(targetFound(player.position.x, player.position.y)){
        goTowards(player.position.x, player.position.y, maxSpeed);
      }else{
        velocity.x = cos(orientation) * (maxSpeed / 2);
        velocity.y = sin(orientation) * (maxSpeed / 2);
    
        position.add(velocity) ;
    
        // randomly update orientation a little
        orientation += random(0, PI/32) - random(0, PI/32) ;
        // Keep in bounds
        if (orientation > PI) orientation -= 2*PI ;
        else if (orientation < -PI) orientation += 2*PI ;
      }
    }
  }
  
}
