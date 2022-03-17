void bulletCollidingWithEntityCheck(){
  for(int i = 0; i < player.bullets.size(); i++){
     if(player.bullets.get(i).status){
         for(int j = 0; j < currentLevel.standardRobots.length; j++){           
             if(currentLevel.standardRobots[j].status){
                 if(currentLevel.standardRobots[j].collidingWithBullet(player.bullets.get(i))){
                   standardDestroyed.play();
                   currentLevel.standardRobots[j].status = false;
                   float newScore = 100 * scoreMultiplier();
                   score += (100 + newScore);
                   player.bullets.get(i).status = false;
                   standardDestroyed.rewind();
                 }
             }  
         }
         
         if(numberOfObstacles() > 0){
           for(int j = 0; j < currentLevel.obstacles.length; j++){
               if(currentLevel.obstacles[j].status){
                   if(currentLevel.obstacles[j].collidingWithBullet(player.bullets.get(i))){
                     obstacleDestroyed.play();
                     currentLevel.obstacles[j].status = false;
                     float newScore = 50 * scoreMultiplier();
                     score += (50 + newScore);
                     player.bullets.get(i).status = false;
                     obstacleDestroyed.rewind();
                   }
               }
             }  
         }
         
         if(numberOfHulks() > 0){
           for(int j = 0; j < currentLevel.hulks.length; j++){
               if(currentLevel.hulks[j].collidingWithBullet(player.bullets.get(i))){
                  player.bullets.get(i).status = false;
               }
             }  
         }
         
         if(numberOfConverters() > 0){
           for(int j = 0; j < currentLevel.converters.length; j++){
               if(currentLevel.converters[j].status){
                   if(currentLevel.converters[j].collidingWithBullet(player.bullets.get(i))){
                     converterDestroyed.play();
                     currentLevel.converters[j].status = false;
                     float newScore = 300 * scoreMultiplier();
                     score += (300 + newScore);
                     player.bullets.get(i).status = false;
                     converterDestroyed.rewind();
                   }
               }
             }  
         }
         
         if(numberOfBloodhounds() > 0){
           for(int j = 0; j < currentLevel.bloodhounds.length; j++){
             if(currentLevel.bloodhounds[j] != null){
               if(currentLevel.bloodhounds[j].status){
                   if(currentLevel.bloodhounds[j].collidingWithBullet(player.bullets.get(i))){
                     standardDestroyed.play();
                     currentLevel.bloodhounds[j].status = false;
                     float newScore = 200 * scoreMultiplier();
                     score += (200 + newScore);
                     player.bullets.get(i).status = false;
                     standardDestroyed.rewind();
                   }
               }
             }  
           }
         }
         
         
     }
  }
}
