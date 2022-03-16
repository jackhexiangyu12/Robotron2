class Player extends Entity{
  int lives,
      iFrames;
  
  ArrayList<Bullet> bullets;
    
  Player(float x, float y, float vel1, float vel2){
    position = new PVector(x, y);
    velocity = new PVector(vel1, vel2);
    lives = 3;
    bullets = new ArrayList<Bullet>();
    r = 10;
    iFrames = 0;
  }
  
  void draw(){
    if(player.lives > 0){
      noStroke();
      fill(255,127,0);
      circle(position.x,position.y,20);
      fill(0);
      circle(position.x+(5 * cos(orientation)),position.y+(5 * sin(orientation)),5);
      if(iFrames > 0){
        iFrames--;
      }
    }
  }

  void integrate(){
    collisionCheck();
    position.add(velocity);
    checkExtraLife();
  }
  
  void collisionCheck(){
   if((position.x <= 25 && velocity.x == -2)|| (position.x >= 996 && velocity.x == 2)){
      velocity.x = 0;
    }else if((position.y <= 49 && velocity.y == -2)|| (position.y >= 749 && velocity.y == 2)){
      velocity.y = 0;
    }
   
   int positionX = (int)(position.x - 15)/dividerWidth;
   int positionXL = (int)(position.x - (15 + r))/dividerWidth;
   int positionXR = (int)(position.x - (15 - r))/dividerWidth;
   int positionY = (int)(position.y - 39)/dividerHeight;
   int positionYU = (int)(position.y - (39 + r))/dividerHeight;
   int positionYD = (int)(position.y - (39 - r))/dividerHeight;
   
   if(velocity.x == -2){
     if(currentLevel.map[positionXL][positionY] == 1){
       velocity.x = 0;
       position.x += 5;
     }
   }
   
   if(velocity.x == 2){
     if(currentLevel.map[positionXR][positionY] == 1){
       velocity.x = 0;
       position.x -= 5;
     }
   }
   
   if(velocity.y == -2){
     if(currentLevel.map[positionX][positionYU] == 1){
       velocity.y = 0;
       position.y += 5;
     }
   }
   
   if(velocity.y == 2){
     if(currentLevel.map[positionX][positionYD] == 1){
       velocity.y = 0;
       position.y -= 5;
     }
   }
  
  }
  
  void drawBullets(){
    for(int i = 0; i < bullets.size(); i++){
       bullets.get(i).integrate();
       bullets.get(i).draw(); 
    }
  }
  
  void checkExtraLife(){
   //Check to see if additional life threshold has been reached 
    if(score >= lifeAddedCost){
        extraLife.play();
        lives++;//City revived
        score -= lifeAddedCost;//'Active' score reduced by 5,000 to stop duplicate additional lives
        livesAdded++;//Number of livesAdded incremented for total score purposes
        extraLife.rewind();
    } 
  }
}
