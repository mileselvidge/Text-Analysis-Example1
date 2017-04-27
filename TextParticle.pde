class TextParticle {
  PVector pos;
  PVector vel;
  String text;
  float scale;
  boolean high;
  int value;
  
  TextParticle(String str, float scl, int v) {
    value = v;
    text = str;
    scale = scl;
    high = false;
    pos = new PVector(random(width), random(height));
    vel = PVector.random2D();
    vel.setMag(random(-2, 2));
  }
  
  void update() {
    pos.add(vel);
    
    display(high);
  }
  
  void display(boolean h) {
    textSize(scale);
    boolean dispc = false;
    if((int(pos.x) > int(mouseX - 5)) && (int(pos.x) < int(mouseX + 5)) 
    && (int(pos.y) > int(mouseY - 5)) && (int(pos.y) < int(mouseY + 5))) {
      textSize(140);
      dispc = true;
    }
    
    if(h) { 
      textSize(100);
      fill(250, 120, 0, 200);
    }
    text(text, pos.x, pos.y);
    
    if(h) {
      fill(255, 0, 0);
      textSize(80);
      text(value + "", pos.x, pos.y + 40);
    }
   
    fill(255, 150);
  }
  
}