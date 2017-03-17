//Sam Nosenzo

//float PHI = 1.61803398875;
float PHI = 1;
ShapeSystem shsys;
int maxSize = 200;
float angle = 0;
int numPoints = 3;
int counter = 0;
int numShapes = 50;
void setup(){
  size(600, 600);
  stroke(255);
  fill(0);
  noFill();
  background(0, 0);
  shsys = new ShapeSystem(numShapes, numPoints, maxSize);

}
float radFactor = 1.5;
void draw(){
  background(0);
  shsys.rotate(0.01);
  if(changeDescend && counter%20 == 0){
    shsys.changeRadDescend(radFactor);
    resetCountersAndRevertBack();
  }
  if(counter%240 == 0){
    
    numPoints+=1;
    //shsys.changeShape(numPoints%7 + 1);
  }
  counter++;
  
}

boolean changeDescend = true;
void mouseClicked(){
  changeDescend = !changeDescend;
}

void resetCountersAndRevertBack(){
  if(shsys.counter > shsys.numShapes*1.5 && radFactor == 1.5){
     counter = 0;
     shsys.counter = 0;
     radFactor = 1;
   } else if(shsys.counter > shsys.numShapes*1.5 && radFactor == 1){
     counter = 0;
     shsys.counter = 0;
     radFactor = 1.5;
   }
}
  

  