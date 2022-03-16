void levelStatusCheck() {
  state s = levelStatusCheckCondition();//State of current city is acquired
  
  //Successful wave ended 
  if (s == state.won) {
    
    score += 1000 + (1000 * scoreMultiplier());
    
    currentLevel = new Level(level++);
    currentLevel.generateLevel();
    player.spawn(currentLevel.map, PLAYERVALUE);
    player.bullets = new ArrayList<Bullet>();
    
    //Round is lost
  }else if(s == state.lost){
    gameOver.play();
    fill(fontColour[0], fontColour[1], fontColour[2]);
    textAlign(CENTER);
    
    textSize(40);
    text("GAME OVER", width/2, (height/2)-65);
    
    textSize(30);
    text("Level:"+ level, width/2, height/2-25);
    text("Score:"+ score, width/2, height/2+15);
    
    textSize(18);
    text("Press 0 to play again", width/2, (height/2)+45);
    text("Press 1 to return to the main menu", width/2, (height/2)+70);
    
    //Check to see user input to send user to correct screen, including restarting the game
    if(keyPressed == true &&  key == '0'){
       reset();
    }else if(keyPressed == true && key == '1'){
       screenView = menuScreen; 
    }
    
  }
}


state levelStatusCheckCondition() {

  if (player.lives > 0) {
    for (int i=0; i < currentLevel.standardRobots.length; i++) {
      if (currentLevel.standardRobots[i].status) return state.ongoing;
    }
    
    if(numberOfConverters() > 0){
      for (int j = 0; j < currentLevel.converters.length; j++) {
        if (currentLevel.converters[j].status) return state.ongoing;
      }
    }
    
    return state.won;//No meteors on the go, but a city is alive, so wave has been won
  }else{
    return state.lost;//No cities alive, so wave has been lost
  }
}
