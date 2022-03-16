class Converter extends Enemy{
 
  Converter(float x, float y){
   position = new PVector(x, y);
   status = true;
   r = 20;
   orientation = 0;
   velocity = new PVector(0, 0) ;
  }
  
  void integrate() {
    velocity.x = cos(orientation) ;
    velocity.y = sin(orientation) ;
    
    collisionCheck();
    
    position.add(velocity) ;
    
    // randomly update orientation a little
    orientation += random(0, PI/32) - random(0, PI/32) ;
        
    // Keep in bounds
    if (orientation > PI) orientation -= 2*PI ;
    else if (orientation < -PI) orientation += 2*PI ;    
  }
  
}
