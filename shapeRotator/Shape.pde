class Shape{
  
  int numPoints;
  int sz;
  float angle;
  
  Shape(int numPoints, int sz){
    this.numPoints = numPoints;
    this.sz = sz;
    angle = 0;
  }
  
  void incAngle(float inc){
    angle+=inc;
  }
  
  void display(PVector center){
    beginShape();
    for(int i = 0; i < numPoints; i++){
      vertex(center.x + sz*cos(angle + i*TWO_PI/numPoints), center.y + sz*sin(angle + i*TWO_PI/numPoints));
    }
    endShape(CLOSE);
  }
}