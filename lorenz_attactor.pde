import peasy.*;

float s = 10, r = 28, b = 8.0 / 3;

Curve curve;
PeasyCam cam;

void setup() {
  size(1000, 1000, P3D);
  cam = new PeasyCam(this, 500);
  curve = new Curve(0.1, 0.2, 0.3);
}

void draw() {
  background(0);

  PVector lastV = curve.lastVector();
  
  float dt = 0.01;
  float dx = s * (lastV.y - lastV.x) * dt;
  float dy = (lastV.x * (r - lastV.z) - lastV.y) * dt;
  float dz = (lastV.x * lastV.y - b * lastV.z) * dt;
  
  scale(5);
  stroke(255);
  
  curve.nextPoint(dx, dy, dz);
  curve.draw();
}
