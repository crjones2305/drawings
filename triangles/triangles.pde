//libraries

//definitions
final float SPEED = 0.03;

float[] cen = new float[2];
float[] pts = new float[6];
float radius;
float ang;

//setup
void setup() {
  size(640, 360);
  background(255);
  
  cen[0] = width/2;
  cen[1] = height/2;
  radius = cen[1]/2;
  
  strokeWeight(2);
}

//main
void draw() {
  background(255);
  stroke(0,0,0);
  ellipse(cen[0], cen[1], radius, radius);
  
  ang = ((millis()*SPEED)%360) * TWO_PI/360;
  
  for(int i = 0; i < pts.length/2; i++){
    pts[i*2] = radius * cos(ang + i*TWO_PI/3) + cen[0];
    pts[i*2+1] = radius * sin(ang + i*TWO_PI/3) + cen[1];
  }
  
  drawTriangle(pts);
}

//methods
void drawTriangle(float[] p) {
  stroke(0,255,255);
  line(p[0], p[1],p[2], p[3]);
  
  stroke(255,0,255);
  line(p[2], p[3], p[4], p[5]);
  
  stroke(255,255,0);
  line(p[4], p[5], p[0], p[1]);
}  


// get gui settings from settings file :: JSON method, read from config file
//String getPlotterConfigString(String id) {
//  String r = "";
//  try {
//    r = plotterConfigJSON.getString(id);
//  } 
//  catch (Exception e) {
//    r = "";
//  }
//  return r;
//}