import java.util.*; 

class Curve {
  
  public static final int history = 5000;
  
  List<PVector> path;
  
  Curve(float x, float y, float z) {
    path = new ArrayList<PVector>();
    path.add(new PVector(x, y, z));
    colorMode(HSB);
  }
  
  void nextPoint(float delta_x, float delta_y, float delta_z) {
    PVector lastV = this.lastVector();
    this.path.add(new PVector(lastV.x + delta_x, lastV.y + delta_y, lastV.z + delta_z));
    
    if (this.path.size() > Curve.history) {
      this.path = this.path.subList(1, Curve.history + 1);
    }
  }
  
  
  PVector lastVector() {
    return this.path.get(this.path.size() - 1);
  }
  
  void draw() {
    strokeWeight(1);
    noFill();
    beginShape();
    for (int i = 0; i < this.path.size(); i++) {
      PVector vector = this.path.get(i);
      stroke(i % (255 * 5) / 5, 255, 255);
      vertex(vector.x, vector.y, vector.z);
    }
    endShape();
  }
}
