class Invincibility extends Entity {
  
  Invincibility(float x, float y){
   position = new PVector(x, y);
   status = true;
   r = 10;
  }
  
  void draw(int[] rgb){
     if(status){
        noStroke();
        fill(rgb[0], rgb[1], rgb[2]);
        square(position.x,position.y,r);
        collidingWithPlayer();
     }
    }
  
  void collidingWithPlayer(){
     if(((player.position.x - player.r) <= position.x + r) && ((player.position.x + player.r)>= position.x)){
       if(((player.position.y - player.r) <= position.y + r) && ((player.position.y + player.r) >= position.y)){
         invincibility.play();
         status = false;
         player.invincible = true;
         player.iFrames = 300;
         invincibility.rewind();
       }
     }
  }
  
}
