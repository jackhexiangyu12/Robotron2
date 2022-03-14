int numberOfWalls(){
   if(level == 1){
       return 0;
   }else if(level <= 3){
       return 1;
   }else if(level <= 5){
       return 2;
    }else if(level <= 7){
       return 3;
    }else if(level <= 9){
       return 4;
    }else if(level <= 11){
       return 5;
   }else if(level <= 13){
       return 6;
    }else if(level <= 15){
       return 7;
    }else if(level <= 17){
       return 8;
    }else if(level <= 19){
       return 9;
    }else{
       return 10;
    }
}

int numberOfStandardRobots(){
    if(50 <  (3 + (level * 2))){
      return 50;
    }else{
      return (3 + (level * 2));
    }
   
}
