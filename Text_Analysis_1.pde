// Text Analysis 1

IntDict words;
String current;
ArrayList<TextParticle> wordParticles = new ArrayList<TextParticle>();
void setup() {
  fullScreen();
  //size(900, 900);
  noStroke();
  fill(255, 150);
  background(51);
  smooth(16);
  words = new IntDict();
  String[] lines = loadStrings("dataset.txt");
  String allwords = join(lines,"\n");
  String[] tokens = splitTokens(allwords, "\n/ ,.;?!-\"\"0123456789:");
  current = "";
  
  // Initilize dictionary
  for(String token : tokens) {
    if(!words.hasKey(token.toLowerCase())) { words.set(token.toLowerCase(), 1); }
    else { words.increment(token.toLowerCase()); }
  }
  
  words.sortValues();

  // Append words to the particles array
  String[] keys = words.keyArray();
  for(String k : keys) {
    float s = map(words.get(k), 0, 2000, 5, 120);
    TextParticle tp = new TextParticle(k, s, words.get(k));
    wordParticles.add(tp);
  }
  println(wordParticles.size());
  
}

void draw() {
  background(51);
  for(TextParticle tp : wordParticles) {
    tp.update();
    
    // Collision Detection
    if(tp.pos.x < 0 || tp.pos.x > width) {
      tp.vel.x = tp.vel.x * - 1;
    }
    
    if(tp.pos.y < 0 || tp.pos.y > height) {
      tp.vel.y = tp.vel.y * - 1;
    }
    
    if(tp.text.contains(current) && current != "") {
      tp.high = true;
    } else {
      tp.high = false;
    }
  }
}

void keyPressed() {
  current += key;
  if(key == ' ') { current = ""; }
}