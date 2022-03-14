void bulletCollidingWithEntityCheck(){
  for(int i = 0; i < player.bullets.size(); i++){
     if(player.bullets.get(i).status){
         for(int j = 0; j < currentLevel.standardRobots.length; j++){
             if(currentLevel.standardRobots[j].status){
                 if(currentLevel.standardRobots[j].robotCollidingWithBullet(player.bullets.get(i))){
                   currentLevel.standardRobots[j].status = false;
                   float newScore = 100 * scoreMultiplier();
                   score += (100 + newScore);
                   player.bullets.get(i).status = false;
                 }
             }
         }
     }
  }
}
