class Shape{
  
  int numPoints;
  float sz;
  float angle;
  float origsz;
  float[] currRad;
  float[] desRad;
  boolean lerping;
  boolean staggering;
  int currChange;
  Shape(int numPoints, float sz){
    this.numPoints = numPoints;
    this.sz = sz;
    currRad = new float[numPoints];
    desRad = new float[numPoints];
    for(int i = 0; i < numPoints; i++){
      currRad[i] = this.sz;
      desRad[i] = this.sz;
    }
    angle = 0;
    lerping = false;
    currChange = -1;
  }
  
  void incAngle(float inc){
    angle+=inc;
  }
  
  void display(PVector center){
    
    
    beginShape();
    for(int i = 0; i < numPoints; i++){
      vertex(center.x + currRad[i]*cos(angle + i*TWO_PI/numPoints), center.y + currRad[i]*sin(angle + i*TWO_PI/numPoints));
      fill(255);
      ellipse(center.x + currRad[i]*cos(angle + i*TWO_PI/numPoints), center.y + currRad[i]*sin(angle + i*TWO_PI/numPoints), 5, 5);
      noFill();
    }
    endShape(CLOSE);
    
    if(currChange >= 0){
      movePoint(currChange);
      return;
    }
    /*
    
    if(!desArrived()){
      lerpPoints();
    }*/
    
    
    
  }
  
  void addRandRadiusOffset(){
    for(int i = 0; i < numPoints; i++){
      desRad[i] = sz + random(-sz/2, sz/2);
    } 
  }
  
  void setRadius(float newRad){
    for(int i = 0; i < numPoints; i++){
      desRad[i] = sz*newRad;
    }
  }
  
  void setStaggeredRadius(float newRad){
    setRadius(newRad);
    currChange = 0;
    movePoint(currChange);
  }
    
  void movePoint(int ind){
    for(int i = 0; i <= ind; i++){
      currRad[i] = lerp(currRad[i], desRad[i], .1);
    }
    if(ind == numPoints-1 && (dist(0, currRad[ind], 0, desRad[ind]) < .5)){
      currChange = -1;
      return;
    }
    if(dist(0, currRad[ind], 0, desRad[ind]) < sz/4){
      currChange++;
      if(currChange >= numPoints){
        currChange = numPoints-1;
      }
    }
  }
  
  void lerpPoints(){
    for(int i = 0; i < numPoints; i++){
      currRad[i] = lerp(currRad[i], desRad[i], .01);
    }
  }
  
  boolean desArrived(){
    
    for(int i = 0; i < numPoints; i++){
      if(abs(desRad[i]-currRad[i]) > .1){
        return false;
      }
    }
    return true;
        
  }
}