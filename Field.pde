import java.util.*;

class Field {
  private List<int[]> field;
  
  public Field(int w, int h) {
    this.field = new ArrayList<int[]>();
    
    while (h > 0) {
      this.field.add(new int[w]);
      h--;
    }
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
  
  public int eraseLines() {
    int nEraseLines = 0;
    
    for (int y = 0; y < rowCount(); ) {
      boolean canErase = true;
      
      for (int x = 0; x < columnCount(); x++) {
        if (!hasBlock(x, y)) {
          canErase = false;
          break;
        }
      }
      
      if (canErase) {
        field.remove(y);
        nEraseLines++;
      } else {
        y++;
      }
    }
    
    for (int i = 0; i < nEraseLines; i++) {
      field.add(0, new int[columnCount()]); //<>//
    }

    return nEraseLines;
  }
  
  public void setBlock(int x, int y, int b) {
    if (x < 0 || x >= columnCount() || y < 0 || y >= rowCount()) return;
    
    field.get(y)[x] = b;
  }
  
  public int getBlock(int x, int y) {
    return field.get(y)[x];
  }
  
  public boolean hasBlock(int x, int y) {
    return field.get(y)[x] != 0;
  }
  
  public int rowCount() {
    return field.size();
  }
  
  public int columnCount() {
    return field.get(0).length; 
  }
}