class Field {
  private int field[][];
  
  public Field() {
    this.field = new int[20][10];
    this.field[16] = new int[] { 1, 0, 1, 1, 1, 1, 1, 1, 1, 1 };
    this.field[17] = new int[] { 1, 0, 1, 1, 1, 0, 1, 1, 1, 1 };
    this.field[18] = new int[] { 1, 0, 1, 1, 1, 1, 1, 1, 1, 1 };
    this.field[19] = new int[] { 1, 0, 1, 1, 1, 1, 1, 1, 1, 1 };
  }
  
  public void put(Tetrimino t) {
    println(t.isFixed(), t.isLanded());
    for (int ty = 0; ty < t.shapeSize(); ty++) {
      for (int tx = 0; tx < t.shapeSize(); tx++) {
        if (!t.hasBlock(tx, ty)) continue;
        
        setBlock(t.getX() + tx, t.getY() + ty, t.getBlock(tx, ty));
      }
    }
  }
  
  public void unput(Tetrimino t) {
    for (int ty = 0; ty < t.shapeSize(); ty++) {
      for (int tx = 0; tx < t.shapeSize(); tx++) {
        if (!t.hasBlock(tx, ty)) continue;

        setBlock(t.getX() + tx, t.getY() + ty, 0);
      }
    }
  }
  
  public boolean canPut(Tetrimino t) {
    for (int ty = 0; ty < t.shapeSize(); ty++) {
      for (int tx = 0; tx < t.shapeSize(); tx++) {
        int x = t.getX() + tx;
        int y = t.getY() + ty;
        
        if (x >= 0 && x < columnCount() && y >= 0 && y < rowCount()) {
          // フィールドの範囲内
          if (t.hasBlock(tx, ty) && this.hasBlock(x, y)) return false;
        } else {
          // フィールドの範囲外
          if (t.hasBlock(tx, ty)) return false;
        }
      }
    }
    
    return true;
  }
  
  public int eraseLines() {
    int nEraseLines = 0;
    
    for (int y = 0; y < rowCount(); y++) {
      boolean canErase = true;
      
      for (int x = 0; x < columnCount(); x++) {
        if (!hasBlock(x, y)) {
          canErase = false;
          break;
        }
      }
      
      if (canErase) {
        field[y] = new int[columnCount()];
      }
    }
    
    return nEraseLines;
  }
  
  public void pushErasedLines() {
    for (int y = rowCount() - 1; y >= 1; y--) {
      for (int x = 0; x < columnCount(); x++) {
        if (!hasBlock(x, y)) {
          setBlock(x, y, getBlock(x, y - 1));
          setBlock(x, y - 1, 0);
        }
      }
    }
    
    field[0] = new int[columnCount()];
  }
  
  public void setBlock(int x, int y, int b) {
    if (x < 0 || x >= columnCount() || y < 0 || y >= rowCount()) return;
    
    field[y][x] = b;
  }
  
  public int getBlock(int x, int y) {
    return field[y][x];
  }
  
  public boolean hasBlock(int x, int y) {
    return field[y][x] != 0;
  }
  
  public int rowCount() {
    return field.length;
  }
  
  public int columnCount() {
    return field[0].length; 
  }
}
