// Tetris

int prevFallTime, prevInputTime;
Field field;
Tetrimino t;

void setup() {
  size(600, 400);
  field = new Field();
  t = new TTetrimino(field);
  field.put(t);
}

void draw() {
//  processInput();
  fallTetrimino();
  
  background(0);
  drawBlocks();
}

void keyPressed() {
//  if (millis() - prevInputTime < 80) return;
  
//  if (keyPressed) {
    switch (keyCode) {
    case LEFT:
      t.moveLeft();
      prevInputTime = millis();

      break;
    case RIGHT:
      t.moveRight();
      prevInputTime = millis();

      break;
    case UP:
      t.rotateLeft();prevInputTime = millis();
      break;
    case DOWN:
      t.rotateRight();prevInputTime = millis();
      break;
    }
//  }
  
}

void drawBlocks() {
  for (int i = 0; i < field.rowCount(); i++) {
    for (int j = 0; j < field.columnCount(); j++) {
      switch (field.getBlock(j, i)) {
      case 1:
        rect(j * 16, i * 16, 16, 16);
      }
    }
  }
}

void fallTetrimino() {
  if (millis() - prevFallTime < 300) return;
  
  t.fall();
  prevFallTime = millis();
}
