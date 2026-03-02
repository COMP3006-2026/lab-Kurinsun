float t = 0;

void setup() {
  size(600, 600);
  noiseSeed(42);
}

void draw() {
  float scale1 = 0.005;
  float scale2 = 0.02;

  loadPixels();
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {

      float n1 = noise(x * scale1 + t, y * scale1 + t);
      float n2 = noise(x * scale2 + 100 + t * 0.5, y * scale2 + 100 + t * 0.5);
      float combined = (n1 * 0.7) + (n2 * 0.3);

      float wave  = sin(combined * TWO_PI * 3);
      float wave2 = sin(combined * TWO_PI * 6 + 1.0);

      int r = (int) map(wave, -1, 1, 20,  255);
      int g = (int) map(wave2, -1, 1, 10,  180);
      int b = (int) map(combined, 0, 1, 100, 255);

      pixels[x + y * width] = color(r, g, b);
    }
  }
  updatePixels();
  t += 0.01; //for speed
}
