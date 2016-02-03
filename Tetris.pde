// Tetris

int prevFallTime, prevInputTime;
Field field;
Tetrimino t;

void setup() {
  size(600, 400);
  field = new Field();
  t = new ITetrimino(field);
  field.put(t);
}

void draw() {
  background(0);
  fallTetrimino();
  
  if (t.isLanded()) {
    t.fix();
    field.eraseLines();
    field.pushErasedLines();
  }
  
  drawBlocks();
}

void keyPressed() {
  switch (keyCode) {
  case LEFT:
    t.moveLeft();

    break;
  case RIGHT:
    t.moveRight();

    break;
  case UP:
    t.rotateLeft();
    break;
  case DOWN:
    t.rotateRight();
    break;
  }
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
