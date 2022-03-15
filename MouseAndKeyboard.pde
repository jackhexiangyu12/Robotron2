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

void mouseClicked(){
  if(screenView == gameScreen){     
    Bullet justFired = new Bullet(player.position.x+(5 * cos(player.orientation)),player.position.y+(5 * sin(player.orientation)), 3 * cos(player.orientation), 3 * sin(player.orientation));
    player.bullets.add(justFired);
  }
}

void crosshair() {
  strokeWeight(2);
  stroke(fontColour[0], fontColour[1], fontColour[2]);
  line(mouseX-4, mouseY-4, mouseX+4, mouseY+4);
  line(mouseX+4, mouseY-4, mouseX-4, mouseY+4);
}
