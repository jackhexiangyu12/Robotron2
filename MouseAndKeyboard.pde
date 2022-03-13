void mouseMoved(){
  player.orientation = atan2(mouseY-player.position.y, mouseX-player.position.x);
}

void mouseDragged(){
  player.orientation = atan2(mouseY-player.position.y, mouseX-player.position.x);
}

void keyPressed() {  
  if(key == 'w'){
    player.velocity.y = -3; 
  }
  if(key == 'a'){
    player.velocity.x = -3;
  }
  if(key == 's'){
    player.velocity.y = 3;
  }
  if(key == 'd'){
    player.velocity.x = 3;
  }
}

void keyReleased() {
  if(key == 'w' || key == 's'){
    player.velocity.y = 0; 
  }
  if(key == 'a' || key == 'd'){
    player.velocity.x = 0;
  }
}
