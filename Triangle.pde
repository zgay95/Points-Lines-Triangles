

class Triangle {
  
   Point p0,p1,p2;
   
   //Constructor - assigns the points passed into the global variables 
   Triangle(Point _p0, Point _p1, Point _p2 ){
     p0 = _p0;
     p1 = _p1;
     p2 = _p2;
   }
   
   void draw(){
     noStroke();
    if (calcOrientation() > 0 ){
      fill(255,204,203);
     }
     else{
       fill(144,238,144);
     }
     triangle(p0.p.x, p0.p.y, p1.p.x, p1.p.y, p2.p.x, p2.p.y);
     stroke(0);
     fill(0);
   }
   
   // check if a triangle is oriented counterclockwise
   boolean ccw(){
     if (calcOrientation() > 0 ){
      return true;
     }
     return false;
   }
   
   // check if a triangle is oriented clockwise
   boolean cw(){
     if (calcOrientation() < 0 ){
      return true;
     }
     return false;
   }
   
   // returns the area (in pixels) of the triangle
   float area(){
     return abs( calcOrientation() /2 ); 
   }
   
   // returns a PVector where x,y,z are the internal angles of the triangle (in degrees)
   PVector angles(){
     Edge EdgeA = new Edge(p0, p1);
     Edge EdgeB = new Edge(p1, p2);
     Edge EdgeC = new Edge(p2, p0);
     
     float a = EdgeA.length();
     float b = EdgeB.length();
     float c = EdgeC.length();
  
     return new PVector( degrees(acos( (b+c-a)/(2*sqrt(b)*sqrt(c)) )), degrees(acos( (a+c-b)/(2*sqrt(c)*sqrt(a)) )), degrees(acos( (a+b-c)/(2*sqrt(a)*sqrt(b)) ) ));
   }
   
   
   float calcOrientation(){
     return (p1.p.x - p0.p.x) * (p2.p.y - p0.p.y) - (p2.p.x - p0.p.x) * (p1.p.y - p0.p.y);
   }
   
   void printInfo(){
     println("Triangle ===============");
     println("    Area: " + area() + " px" );
     println("    CW: " + cw() );
     println("    CCW: " + ccw() );
     println("    Internal Angles: " + angles() + " degrees" );
   }
   
}
