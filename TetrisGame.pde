import java.lang.reflect.Constructor;

class TetrisGame {
  protected Field field;
  protected Tetrimino tetrimino;
  protected int prevFallTime, prevInputTime;
  protected int x, y;
  protected int fw = 10, fh = 20;
  protected int bw = 16, bh = 16;
  
  protected color[] blockColors = {
    color(0), 
    color(162, 251, 251), // I  
    color(251, 251, 170), // O  
    color(130, 251, 130), // S
    color(251, 113, 113), // Z
    color(195, 195, 251), // J  
    color(251, 219, 97),  // L  
    color(251, 162, 251)  // T 
  };
 
  public TetrisGame() {
    initializeField();
  }
  
  public void draw() {
    drawBackground();
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

  public void setFieldWidth(int value) {
    fw = value;
    initializeField();
  }
  
  public int getFieldWidth() {
    return fw;
  }
  
  public void setFieldHeight(int value) {
    fh = value;
    initializeField();
  }
  
  public int getFieldHeight() {
    return this.fh;
  }
  
  public void setBlockWidth(int value) {
    bw = value;
  }
  
  public int getBlockWidth() {
    return bw;
  }

  public void setBlockHeight(int value) {
    bh = value;
  }
  
  public int getBlockHeight() {
    return bh;
  }

  protected void initializeField() {
    this.field = new Field(fw, fh);
    this.tetrimino = loadTetrimino();
    field.put(tetrimino);
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
        int b = field.getBlock(j, i);
        
        fill(blockColors[b]);
        rect(j * bw, i * bh, bw, bh);
      }
    }
  }
  
  private void drawBackground() {
    fill(0);
    rect(0, 0, fw * bw, fh * bh);
  }
  
  private void fallTetrimino() {
    if (millis() - prevFallTime < 300) return;
    
    tetrimino.fall();
    prevFallTime = millis();
  }
  
  private Tetrimino loadTetrimino() {
    int i = int(random(TETRIMINO_CLASSES.length));
    
    Constructor<?> ctor;
    
    try {
      ctor = TETRIMINO_CLASSES[i].getConstructor(Tetris.class, Field.class);
      return (Tetrimino)ctor.newInstance(tetris, field);
    } catch(Exception e) {
      return null;
    }
  }
}