class RobotStandard extends Entity{
 
  RobotStandard(float x, float y){
   position = new PVector(x, y);
   status = true;
   r = 25;
  }
 
 void draw(){
   if(status){
      noStroke();
      fill(255,255,0);
      square(position.x,position.y,25);
   }
    //fill(0);
    //circle(position.x+(5 * cos(orientation)),position.y+(5 * sin(orientation)),5);
  }
  
  boolean robotCollidingWithBullet(Bullet bullet){
    if((bullet.position.x <= position.x + r) && (bullet.position.x >= position.x)){
      if((bullet.position.y <= position.y + r) && (bullet.position.y >= position.y)){
        return true;
      }
    }
    return false;
  }
  
}
