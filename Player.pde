class Player extends Entity{
  int lives;
    
  Player(float x, float y, float vel1, float vel2){
    position = new PVector(x, y);
    velocity = new PVector(vel1, vel2);
    lives = 3;
  }
  
  void draw(){
    noStroke();
    fill(255,127,0);
    circle(position.x,position.y,20);
    fill(0);
    circle(position.x+(5 * cos(orientation)),position.y+(5 * sin(orientation)),5);
  }
  

  void integrate(){
    collisionCheck();
    position.add(velocity);
  }
  
  void collisionCheck(){
    if((player.position.x <= 25 && player.velocity.x == -3)|| (player.position.x >= 998 && player.velocity.x == 3)){
      player.velocity.x = 0;
    }else if((player.position.y <= 49 && player.velocity.y == -3)|| (player.position.y >= 749 && player.velocity.y == 3)){
      player.velocity.y = 0;
    }
   
   int positionX = (int)(player.position.x - 15)/dividerWidth;
   int positionXL = (int)(player.position.x - 25)/dividerWidth;
   int positionXR = (int)(player.position.x - 5)/dividerWidth;
   int positionY = (int)(player.position.y - 40)/dividerHeight;
   int positionYU = (int)(player.position.y - 50)/dividerHeight;
   int positionYD = (int)(player.position.y - 30)/dividerHeight;
   
   if(player.velocity.x == -3){
     if(currentLevel.map[positionXL][positionY] == 1){
       player.velocity.x = 3;
       player.position.x += 5;
     }
   }else if(player.velocity.x == 3){
     if(currentLevel.map[positionXR][positionY] == 1){
       player.velocity.x = 0;
       player.position.x -= 5;
     }
   }else if(player.velocity.y == -3){
     if(currentLevel.map[positionX][positionYU] == 1){
       player.velocity.y = 0;
       player.position.y += 5;
     }
   }else if(player.velocity.y == 3){
     if(currentLevel.map[positionX][positionYD] == 1){
       player.velocity.y = 0;
       player.position.y -= 5;
     }
   }
  
  }
}
