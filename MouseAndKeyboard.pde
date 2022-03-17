void mouseMoved(){
  player.orientation = atan2(mouseY-player.position.y, mouseX-player.position.x);
}

void mouseDragged(){
  player.orientation = atan2(mouseY-player.position.y, mouseX-player.position.x);
}

void keyPressed() {  
  if(screenView == gameScreen){
    if(key == 'w'){
      player.velocity.y = -2; 
    }
    if(key == 'a'){
      player.velocity.x = -2;
    }
    if(key == 's'){
      player.velocity.y = 2;
    }
    if(key == 'd'){
      player.velocity.x = 2;
    }
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

void mousePressed(){
  if(screenView == gameScreen && player.lives > 0){
    player.orientation = atan2(mouseY-player.position.y, mouseX-player.position.x);
    playerShoot.play();
    Bullet justFired = new Bullet(player.position.x+(5 * cos(player.orientation)),player.position.y+(5 * sin(player.orientation)), 5 * cos(player.orientation), 5 * sin(player.orientation));
    player.bullets.add(justFired);
    playerShoot.rewind();
  }
}

void crosshair() {
  strokeWeight(2);
  stroke(fontColour[0], fontColour[1], fontColour[2]);
  line(mouseX-4, mouseY-4, mouseX+4, mouseY+4);
  line(mouseX+4, mouseY-4, mouseX-4, mouseY+4);
}
