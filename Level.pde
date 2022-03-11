class Level{
 int[][] map;
  
 Level() {
   map = new int[horizontalDividers][verticalDividers];
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
    
    //filler();
 }
 
 //void filler(){
 //  try{
 //  for(int i = 0;  i< horizontalDividers; i++){
 //      int availableDirectionsTop = 0;
 //      if(map[i-1][0] == 0){
 //        availableDirectionsTop++;
 //      }
 //      if(map[i+1][0] == 0){
 //        availableDirectionsTop++;
 //      }
 //      if(map[i][1] == 0){
 //        availableDirectionsTop++;
 //      }
       
 //      if(availableDirectionsTop < 2){
 //        map[i][0] = 1;
 //      }
       
 //      int availableDirectionsBottom = 0;
 //      if(map[i-1][horizontalDividers] == 0){
 //        availableDirectionsBottom++;
 //      }
 //      if(map[i+1][horizontalDividers] == 0){
 //        availableDirectionsBottom++;
 //      }
 //      if(map[i][horizontalDividers - 1] == 0){
 //        availableDirectionsBottom++;
 //      }
       
 //      if(availableDirectionsBottom < 2){
 //        map[i][horizontalDividers] = 1;
 //      }
 //  }
 //  }catch( ArrayIndexOutOfBoundsException e ) {
 //  }
 //}
 
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
