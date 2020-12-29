

class Point {
  
   PVector p;
   
   //Constructor - assigns the x & y coords from the mouse click into a PVector object 
   Point( float x, float y ){
      p = new PVector(x, y);
   }

   //draw the point in an ellpise point to help make it more visible
   void draw(){
    ellipse(p.x, p.y, 5, 5);
 } 
}
