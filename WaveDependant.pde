int numberOfStandardRobots(){
    if(50 <  (3 + (level * 2))){
      return 50;
    }else{
      return (3 + (level * 2));
    }  
}

int numberOfObstacles(){
    if(12 < (level - 2)){
      return 12;
    }else if ((level - 2) < 0){
      return 0;
    }else{
      return (level - 2);
    } 
}

int numberOfHulks(){
    if(level < 4){
      return 0;
    }else if(level < 7){
      return 3;
    }else if (level < 10){
      return 6;
    }else{
      return 9;
    }
}

int numberOfConverters(){
    if(7 <  (level/5)){
      return 7;
    }else{
      return (level/5);
    }
}
