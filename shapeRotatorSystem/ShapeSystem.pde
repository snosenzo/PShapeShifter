class ShapeSystem {
 int numShapes;
 float angle;
 int counter;
 ArrayList<Shape> shapes;
 int maxSize;
 int stepSize;
 ShapeSystem(int num, int defaultLines, int maxSz){
   maxSize = maxSz;
   shapes = new ArrayList<Shape>();
   numShapes = num;
   stepSize = maxSize/numShapes;
   angle = 0;
   for(int i = 1; i <= maxSize; i+=stepSize){
     Shape s = new Shape(defaultLines, i);
     shapes.add(s);
   }
   
 }
 
   void rotate(float angleStep){
     for(int i = shapes.size()-1; i >= 0; i--){
       Shape s = shapes.get(i);
       s.angle = map(sin(angle-(i*PHI)/10.0), -1, 1, -PI/9, PI/9);
       s.display(new PVector(width/2, height/2));
     }
     angle+=angleStep;
   }
   
   void staticDisplay(float angleOffset){
     for(int i = shapes.size()-1; i >= 0; i--){
       Shape s = shapes.get(i);
       //s.angle = map(sin(angleOffset), -1, 1, -PI/9, PI/9);
       s.display(new PVector(width/2, height/2));
     }
     
   }
   
   void changeShape(int numPoints){
     shapes = new ArrayList<Shape>();
     for(int i = 1; i <= maxSize; i+=stepSize){
       Shape s = new Shape(numPoints, i);
       shapes.add(s);
     }
   }
   
   void addOffset(){
     for(Shape s: shapes){
       s.addRandRadiusOffset();
     }
   }
   
   void addOffsetDescend(){
     Shape s = shapes.get(counter%shapes.size());
     s.addRandRadiusOffset();
     counter++;
   }
   
   void changeRadDescend(float newRadFactor){
     if(counter <  shapes.size()){
       Shape s = shapes.get(counter%shapes.size());
       
       s.setStaggeredRadius(newRadFactor);
     }
     counter++;
   }
     
}