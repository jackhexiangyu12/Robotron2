class Level{
 int[][] map;
 RobotStandard[] standardRobots;
 Obstacle[] obstacles;
 Converter[] converters;
 Hulk[] hulks;
 
 int level;
  
 Level(int level) {
   map = new int[horizontalDividers][verticalDividers];
   standardRobots = new RobotStandard[numberOfStandardRobots()];
   if(numberOfObstacles() > 0){
      obstacles = new Obstacle[numberOfObstacles()];
   }
   if(numberOfConverters() > 0){
      converters = new Converter[numberOfConverters()];
   }
   if(numberOfHulks() > 0){
      hulks = new Hulk[numberOfHulks()];
   }
   this.level = level;
 }
 
 void generateLevel(){
    for(int i = 0; i <  (16); i++){
       int randomX = (int)random(0, horizontalDividers - 1);
       int randomY = (int)random(0, verticalDividers - 1);
       map[randomX][randomY] = 1;
       if(randomY >= (verticalDividers/2)){
         for(int j = randomY; j < verticalDividers; j++){
            map[randomX][j] = 1;
         }
       }else{
         for(int j = randomY; j >= 0; j--){
            map[randomX][j] = 1;
         }
       }
    }
    
    for(int i = 0; i < 8; i++){
       int randomX = (int)random(0, horizontalDividers - 1);
       int randomY = (int)random(0, verticalDividers - 1);
       int hOrV = (int)random(0, 1);
       int randomLength = (int)random(3, 5);
       if(hOrV == 0){
         for(int j = 0; j < randomLength; j++){
            if(randomX + j < horizontalDividers){
              map[randomX + j][randomY] = 1;
            }
         }
       }else{
         for(int j = 0; j >= randomLength; j++){
           if(randomY + j < verticalDividers){
              map[randomX][randomY + j] = 1;
           }
         }
       }
    }
    validate();
 }
 
 void validate(){
   int total = getTotal();
   int randomX = (int)random(0, horizontalDividers);
   int randomY = (int)random(0, verticalDividers);
   if(map[randomX][randomY] == 1){
     validate();
     return;
   }
   
   HashMap<String, Integer> hm = new HashMap<String, Integer>();
   checkSurroundings(randomX, randomY, hm);
   if(hm.size() != total){
      map = new int[horizontalDividers][verticalDividers];
      generateLevel(); 
   }else{
      spawnEntities(); 
   }
 }
 
 int getTotal(){
   int total = 0;
   for(int i = 0;  i< horizontalDividers; i++){
     for(int j = 0; j < verticalDividers; j++){
        if(map[i][j] == 0){
          total++;
        }
     }
   }
   return total;
 }
 
 void checkSurroundings(int x, int y, HashMap<String, Integer> hm){
   hm.put(x + "," + y, 0);
   
   
   if(x != 0){
     String xStr = Integer.toString(x-1);
     String yStr = Integer.toString(y);
     if(!(hm.containsKey(xStr + "," + yStr))){
       if(map[x-1][y] == 0){
          checkSurroundings(x-1, y,hm);
        }
     } 
   }
   
   if(x != horizontalDividers - 1){
     String xStr = Integer.toString(x+1);
     String yStr = Integer.toString(y);
      if(!(hm.containsKey(xStr + "," + yStr))){
       if(map[x+1][y] == 0){
          checkSurroundings(x+1, y,hm);
        }
     }
   }
   
   if(y != 0){
     String xStr = Integer.toString(x);
     String yStr = Integer.toString(y-1);
      if(!(hm.containsKey(xStr + "," + yStr))){
       if(map[x][y-1] == 0){
          checkSurroundings(x, y-1,hm);
        }
     }
   }
   
   if(y != verticalDividers - 1){
     String xStr = Integer.toString(x);
     String yStr = Integer.toString(y+1);
      if(!(hm.containsKey(xStr + "," + yStr))){
       if(map[x][y+1] == 0){
          checkSurroundings(x, y+1,hm);
        }
     }
   }
   
 }
 
 void draw(){
   for(int i = 0;  i< horizontalDividers; i++){
     for(int j = 0; j < verticalDividers; j++){
       if(map[i][j] == 1){
         fill(255);
         rect(((i* dividerWidth) + 15), ((j * dividerHeight)+ 39), dividerWidth - 2, dividerHeight - 2);
       }
     }
   }
   drawEntities();
 }
 
 void spawnEntities(){
    for(int i = 0; i < standardRobots.length; i++){
       standardRobots[i] = new RobotStandard(0,0);
       standardRobots[i].spawn(map, STANDARDROBOTVALUE); 
    }
    
    if(numberOfObstacles() > 0){
      for(int i = 0; i < obstacles.length; i++){
         obstacles[i] = new Obstacle(0,0);
         obstacles[i].spawn(map, OBSTACLEVALUE); 
      }
    }
    
    if(numberOfConverters() > 0){
      for(int i = 0; i < converters.length; i++){
         converters[i] = new Converter(0,0);
         converters[i].spawn(map, CONVERTERVALUE); 
      }
    }
    
    if(numberOfHulks() > 0){
      for(int i = 0; i < hulks.length; i++){
         hulks[i] = new Hulk(0,0);
         hulks[i].spawn(map, HULKVALUE); 
      }
    }
 }
 
 void drawEntities(){
    for(int i = 0; i < standardRobots.length; i++){
       standardRobots[i].draw(colours[2]); 
       standardRobots[i].integrate();
    }
    
    if(numberOfObstacles() > 0){
      for(int i = 0; i < obstacles.length; i++){
        int[] arr = {obstacleColour, 0, 0};
         obstacles[i].draw(arr); 
      }
     }
     
     if(numberOfConverters() > 0){
      for(int i = 0; i < converters.length; i++){
        converters[i].draw(colours[6]);
        converters[i].integrate();
      }
    }
    
    if(numberOfHulks() > 0){
      for(int i = 0; i < hulks.length; i++){
        hulks[i].draw(colours[1]);
        hulks[i].integrate();
      }
    }
    
 }
 
}
