void setup() {
  frameRate(30);
  size(1024, 768);
  noCursor(); //Dont want the cursor appearing when playing the game
  
  reset();//Calls the reset function which initialises many of the game's variables as well as begins the game
}

void reset() {
  score = 0;
  level = 1;
  time = 0;
  fontColour = colours[0];
  colourTracker = 0;

  currentLevel.generateLevel();
  Player player = new Player(0,0,0,0);

}

void draw() {
  background(0);//Black background for greatest contrast with all colours
  noStroke();
  font = createFont("Robotron.ttf", 18);//Importing downloaded font
  textFont(font);//Setting font to the imported font

  //Check to see if the game is to be shown
  if(screenView == gameScreen){
    
    textAlign(LEFT);
    fill(255);
    text("Score:" + score, 10, 25);//User's score
    text("Level:"+ level, width - 100, 25);//Round number
    stroke(fontColour[0], fontColour[1], fontColour[2]);
    strokeWeight(5);
    noFill();
    rect(10, 35, playableX - 4, playableY + 7);
    noStroke();
    currentLevel.draw();
  }
  
  //Check to see if the menu is to be shown
  if (screenView == menuScreen) {
    background(0);
    textSize(75);
    textAlign(CENTER);
    fill(fontColour[0], fontColour[1], fontColour[2]);
    text("Robotron 4303", width/2, 200);
    textSize(35);
    text("0. Play Game", width/2, 300);

    //Check(s) for user input for menu interaction
    if(keyPressed==true &&  key == '0') {
      screenView = gameScreen;
    }

}

if(time < 15){
     time++;
   }else{
     time = 0;
     if(colourTracker == 6){
       colourTracker = 0;
     }else{
       colourTracker++;
     }
   fontColour = colours[colourTracker];
   }
  
 
 
}
