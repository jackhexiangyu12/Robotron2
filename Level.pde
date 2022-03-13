class Level{
 int[][] map;
 
 int level;
  
 Level(int level) {
   map = new int[horizontalDividers][verticalDividers];
   this.level = level;
 }
 
 void generateLevel(){
    for(int i = 0; i < 12; i++){
       int randomX = (int)random(0, horizontalDividers);
       int randomY = (int)random(0, verticalDividers);
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
    
    for(int i = 0; i < 6; i++){
       int randomX = (int)random(0, horizontalDividers);
       int randomY = (int)random(0, verticalDividers);
       int hOrV = (int)random(0, 1);
       int randomLength = (int)random(1, 5);
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
         stroke(0);
         strokeWeight(2);
         rect(((i* dividerWidth) + 15), ((j * dividerHeight)+ 39), dividerWidth - 2, dividerHeight - 2);
       }
     }
   }
 }
 
}
