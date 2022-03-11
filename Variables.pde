final int menuScreen = 0,
  gameScreen = 1,
  walkable = 1,
  playableX = 1004,
  playableY = 720,
  verticalDividers = 12,
  horizontalDividers = 16,
  dividerWidth = playableX/horizontalDividers,
  dividerHeight = playableY/verticalDividers;

int screenView = menuScreen,//Used to track the current screen the game is viewing
  score,
  level,
  colourTracker,
  time;
  
int colours[][] =  {{255, 0, 0}, {255, 127, 0},{255, 255, 0},{0, 255, 0},{0, 0, 255},{75, 0, 130},{148, 0, 211}},
    fontColour[];
    
  
PFont font;

Level currentLevel = new Level();
  
