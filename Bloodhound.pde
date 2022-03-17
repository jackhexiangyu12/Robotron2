class Bloodhound extends Enemy{
  
  int maxSpeed;
  AStarSearch pathFinder;
 
  Bloodhound(float x, float y, int maxSpeed){
   position = new PVector(x, y);
   status = true;
   r = 25;
   orientation = 0;
   velocity = new PVector(0, 0);
   this.maxSpeed = maxSpeed;
  }
  
  void integrate() {
    if(currentLevel.freeze == 0 && screenView == gameScreen && player.lives > 0 && status){
      collisionCheck();
      pathFinder = new AStarSearch(currentLevel.map); 

      int positionX = (int)((position.x - 15))/dividerWidth;
      int positionY = (int)((position.y - 39))/dividerHeight;
      int playerPositionX = (int)(player.position.x - 15)/dividerWidth;
      int playerPositionY = (int)(player.position.y - 39)/dividerHeight;
      ArrayList<AStarNode> thePath = pathFinder.search(positionX, positionY, playerPositionX, playerPositionY) ;
      //fill(0,0,255);
      //for (AStarNode node : thePath)
      //    rect(node.getRow() * dividerWidth + 15, node.getCol() * dividerHeight + 39, dividerWidth, dividerHeight) ;
      float x;
      float y;
      if(thePath.size()-2 >= 0){
        x = (thePath.get(thePath.size()-2).row * dividerWidth) + 15;
        y = (thePath.get(thePath.size()-2).col * dividerHeight)+ 39;
      }else{
        x = (thePath.get(0).row * dividerWidth) + 15;
        y = (thePath.get(0).col * dividerHeight)+ 39;
      }
          
      PVector temp = new PVector(x - position.x + (r/2) , y - position.y+ (r/2));
      position.add(velocity) ;
      temp.normalize();
      velocity.add(temp);
          

      if (velocity.mag() > maxSpeed) {
        velocity.normalize() ; 
        velocity.mult(2) ;
      }

    }
  }
  
}
