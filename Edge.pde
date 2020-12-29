

class Edge{
  
   Point p0,p1;
   
   //Constructor - assign the points passed into the global variables
   Edge(Point _p0, Point _p1 ){
     p0 = _p0;
     p1 = _p1;
   }
   
   void draw(){
     //draw a line segment within the two points passed into the constructor
     strokeWeight(1);
     line(p0.p.x, p0.p.y, p1.p.x, p1.p.y);
   }
   
   //calculates the length (in pixels) of this edge
   float length(){
     float X = sq(abs(p0.p.x - p1.p.x));
     float Y = sq(abs(p0.p.y - p1.p.y));
     return sqrt(X+Y);
   }
   
   void printInfo(){
     println("Edge ===============");
     println("    Length: " + length() + " px" );
   }   
}
