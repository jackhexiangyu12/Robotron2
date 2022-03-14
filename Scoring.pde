/**
* Acquires the score multiplier for the level
*
* @return multipler Integer that will be used to multiply the score by
*/
float scoreMultiplier(){
  return (level - 1)/10.0;
}
