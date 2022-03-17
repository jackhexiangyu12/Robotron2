class RobotStandard extends Enemy{
   
  RobotStandard(float x, float y){
   position = new PVector(x, y);
   status = true;
   r = 25;
   orientation = 0;
   velocity = new PVector(0, 0);
  }
  
  void integrate() {
    if(currentLevel.freeze == 0 && screenView == gameScreen && player.lives > 0 && status){
      collisionCheck();
      if(targetFound(player.position.x, player.position.y)){
        goTowards(player.position.x, player.position.y, 2);
      }else{
        velocity.x = cos(orientation);
        velocity.y = sin(orientation);
    
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
