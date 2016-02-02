class Field {
  private int field[][];
  
  public Field() {
    this.field = new int[20][10];
    this.field[19][0] = 1;
  }
  
  public void put(Tetrimino t) {    
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
