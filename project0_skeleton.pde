
ArrayList<Point>    points    = new ArrayList<Point>();
ArrayList<Edge>     edges     = new ArrayList<Edge>();
ArrayList<Triangle> triangles = new ArrayList<Triangle>();


void setup(){
  size(800,800,P3D);
  frameRate(30);
  smooth();
}

void draw(){
  //clear the display
  background(255);
  
  // code to convert the display into a RIGHT HAND coordinate system
  // remove if you're ok using a left hand coordinate system
  translate( 0, height, 0);
  scale( 1, -1, 1 );
  
  //function is used to ensure only one mouse click is processed when the mosue button is released
  mouseReleased();
  for (int i = 0; i < points.size(); i++){
    points.get(i).draw();
    textRHC(i+1,points.get(i).p.x + 5,points.get(i).p.y - 5);
  }
  for (int i = 0; i < edges.size(); i++){
    edges.get(i).draw();
    edges.get(i).printInfo();
  }
  for (int i = 0; i < triangles.size(); i++){
    triangles.get(i).draw();
    triangles.get(i).printInfo();
  }
}

//the mouse button was released so we can now mark the point
void mouseRelased(){
  mousePressed();
}

void mousePressed(){
  // calculate the mouse poisition in a RIGHT HAND coordinate system
  int mouseXRHC = mouseX;
  int mouseYRHC = height-mouseY;

  // Add the click to the point list, considering a RIGHT HAND coordinate system
  points.add( new Point(mouseXRHC,mouseYRHC) );
  
  fill(0);  
  //create a edge if there exist a new point
  if (points.size() > 1){
    edges.add( new Edge(points.get(points.size()-2),points.get(points.size()-1)) );
  }

  //determine what kind of triangle is made and color it in appropriately
  if( (points.size())%3 == 0 && points.size() != 0){
    triangles.add( new Triangle(points.get(points.size()-3), points.get(points.size()-2), points.get(points.size()-1)) );
  }
}

// Special functions to draw text in a RIGHT HAND coordinate system
void textRHC( int s, float x, float y ){
  textRHC( Integer.toString(s), x, y );
}

void textRHC( String s, float x, float y ){
  pushMatrix();
  translate(x,y);
  scale(1,-1,1);
  text( s, 0, 0 );
  popMatrix();
}

  
