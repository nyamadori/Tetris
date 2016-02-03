import java.lang.reflect.Constructor;

class TetrisGame {
  protected Field field;
  protected Tetrimino tetrimino;
  protected int prevFallTime, prevInputTime;
  
  public TetrisGame() {
    this.field = new Field(10, 20);
    this.tetrimino = new ITetrimino(field);
    field.put(tetrimino);
  }
  
  public void draw() {
    background(0);
    drawBlocks();
  }
  
  public void update() {
    fallTetrimino();
    
    if (tetrimino.isLanded()) {
      tetrimino.fix();
    }
    
    if (tetrimino.isFixed()) {
      field.eraseLines();
      
      try {
        tetrimino = loadTetrimino();
        field.put(tetrimino);
      } catch (Exception e) {
        println(e);
      }
    }
    
    processInput();
  }

  private void processInput() {
    if (millis() - prevInputTime < 100 || !keyPressed) return;
    
    switch (keyCode) {
    case LEFT:
      tetrimino.moveLeft();
      break;
    case RIGHT:
      tetrimino.moveRight();
      break;
    case UP:
      tetrimino.rotateLeft();
      break;
    case DOWN:
      tetrimino.rotateRight();
      break;
    }
    
    prevInputTime = millis();
  }

  private void drawBlocks() {
    for (int i = 0; i < field.rowCount(); i++) {
      for (int j = 0; j < field.columnCount(); j++) {
        switch (field.getBlock(j, i)) {
        case 1:
          rect(j * 16, i * 16, 16, 16);
        }
      }
    }
  }
  
  private void fallTetrimino() {
    if (millis() - prevFallTime < 300) return;
    
    tetrimino.fall();
    prevFallTime = millis();
  }
  
  private Tetrimino loadTetrimino() throws Exception {
    int i = int(random(TETRIMINO_CLASSES.length));
    
    Constructor<?> ctor = TETRIMINO_CLASSES[i].getConstructor(Tetris.class, Field.class);
    return (Tetrimino)ctor.newInstance(tetris, field);
  }
}