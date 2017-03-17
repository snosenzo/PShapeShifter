//Sam Nosenzo

float phi = 1.61803398875;
ArrayList<Shape> shapes;
int maxSize = 200;
float angle = 0;
int numPoints = 2;
int counter = 0;
void setup(){
  size(600, 600);
  stroke(255);
  fill(0);
  background(0, 0);
  shapes = new ArrayList<Shape>();
  for(int i = 1; i <= maxSize; i+=5){
    Shape s = new Shape(numPoints, i);
    shapes.add(s);
  }

}

void draw(){
  background(0);
  for(int i = shapes.size()-1; i >= 0; i--){
    Shape s = shapes.get(i);
    s.angle = map(sin(angle-(i*phi)/10.0), -1, 1, -PI/2, PI/2);
    s.display(new PVector(width/2, height/2));
  }
  angle+=.05;
  if(counter%240 == 0){
    newShape(++numPoints%7 + 1);
  }
  counter++;
  
}

void newShape(int np){
  shapes = new ArrayList<Shape>();
  for(int i = 1; i <= maxSize; i+=5){
    Shape s = new Shape(np, i);
    shapes.add(s);
  }
}
  