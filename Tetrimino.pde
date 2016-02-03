// 参考: テトリミノの形状と回転軸について
//http://www13.plala.or.jp/TETRiS_TGM/kouza/index.htm

abstract class Tetrimino {
  protected int[][][] shapes;
  protected int rotateAngle;
  protected int x;
  protected int y;
  protected Field field;
  protected boolean _isFixed;
  protected boolean _isLanded;
  
  public Tetrimino(Field field) {
    this.field = field;
  }
  
  public int[][] currentShape() {
    return shapes[rotateAngle % shapes.length];
  }
  
  public void rotateLeft() {
    if (isFixed()) return;
    
    field.unput(this);
    rotateAngle = rotateAngle == 0 ? shapes.length : rotateAngle;
    rotateAngle--;
    
    if (field.canPut(this)) {
      field.put(this);
    } else {
      rotateAngle++;
      field.put(this);
    }
  }
  
  public void rotateRight() {
    if (isFixed()) return;

    field.unput(this);
    rotateAngle++;

    if (field.canPut(this)) {
      field.put(this);
    } else {
      rotateAngle--;
      field.put(this);
    }
  }

  public void fall() {
    if (isFixed()) return;

    field.unput(this);
    y++;
    
    if (field.canPut(this)) {
      field.put(this);
    } else {
      y--;
      
      field.put(this);
      _isLanded = true;
    }
  }
  
  public void moveLeft() {
    if (isFixed()) return;

    field.unput(this);
    x--;
    
    if (field.canPut(this)) {
      field.put(this);
    } else {
      x++;
      field.put(this);
    }
  }
  
  public void moveRight() {
    if (isFixed()) return;

    field.unput(this);
    x++;
    
    if (field.canPut(this)) {
      field.put(this);
    } else {
      x--;
      field.put(this);
    }
  }
  
  public void setX(int val) {
    this.x = val;
  }
  
  public int getX() {
    return this.x;
  }

  public void setY(int y) {
    this.y = y;
  }
  
  public int getY() {
    return this.y;
  }
  
  public boolean hasBlock(int x, int y) {
    return this.currentShape()[y][x] != 0;
  }
  
  public int getBlock(int x, int y) {
    return this.currentShape()[y][x];
  }
  
  public int shapeSize() {
    return shapes[0].length;
  }
  
  public void fix() {
    this._isFixed = true;
  }
  
  public boolean isFixed() {
    return this._isFixed;
  }
  
  public boolean isLanded() {
    return this._isLanded;
  }
}

class ITetrimino extends Tetrimino {  
  public ITetrimino(Field field) {
    super(field);
    
    this.shapes = new int[][][] {
      {
        { 0, 0, 0, 0 },
        { 1, 1, 1, 1 },
        { 0, 0, 0, 0 },
        { 0, 0, 0, 0 },
      },
      {
        { 0, 0, 1, 0 },
        { 0, 0, 1, 0 },
        { 0, 0, 1, 0 },
        { 0, 0, 1, 0 },
      },
    };
  }
}

class OTetrimino extends Tetrimino {  
  public OTetrimino(Field field) {    
    super(field);

    this.shapes = new int[][][] {
      {
        { 0, 0, 0, 0 },
        { 0, 1, 1, 0 },
        { 0, 1, 1, 0 },
        { 0, 0, 0, 0 },
      }
    };
  }
}

class STetrimino extends Tetrimino {  
  public STetrimino(Field field) {
    super(field);
    
    this.shapes = new int[][][] {
      {
        { 0, 0, 0, 0 },
        { 0, 1, 1, 0 },
        { 1, 1, 0, 0 },
        { 0, 0, 0, 0 },
      },
      {
        { 1, 0, 0, 0 },
        { 1, 1, 0, 0 },
        { 0, 1, 0, 0 },
        { 0, 0, 0, 0 },
      },
    };
  }
}

class ZTetrimino extends Tetrimino {  
  public ZTetrimino(Field field) {
    super(field);
    
    this.shapes = new int[][][] {
      {
        { 0, 0, 0, 0 },
        { 1, 1, 0, 0 },
        { 0, 1, 1, 0 },
        { 0, 0, 0, 0 },
      },
      {
        { 0, 0, 1, 0 },
        { 0, 1, 1, 0 },
        { 0, 1, 0, 0 },
        { 0, 0, 0, 0 },
      }
    };
  }
}

class JTetrimino extends Tetrimino {  
  public JTetrimino(Field field) {
    super(field);    
    
    this.shapes = new int[][][] {
      {
        { 0, 0, 0, 0 },
        { 1, 1, 1, 0 },
        { 0, 0, 1, 0 },
        { 0, 0, 0, 0 },
      },
      {
        { 0, 1, 0, 0 },
        { 0, 1, 0, 0 },
        { 1, 1, 0, 0 },
        { 0, 0, 0, 0 },
      },
      {
        { 0, 0, 0, 0 },
        { 1, 0, 0, 0 },
        { 1, 1, 1, 0 },
        { 0, 0, 0, 0 },
      },
      {
        { 0, 1, 1, 0 },
        { 0, 1, 0, 0 },
        { 0, 1, 0, 0 },
        { 0, 0, 0, 0 },
      },
    };
  }
}

class LTetrimino extends Tetrimino {  
  public LTetrimino(Field field) {
    super(field);
    
    this.shapes = new int[][][] {
      {
        { 0, 0, 0, 0 },
        { 1, 1, 1, 0 },
        { 1, 0, 0, 0 },
        { 0, 0, 0, 0 },
      },
      {
        { 1, 1, 0, 0 },
        { 0, 1, 0, 0 },
        { 0, 1, 0, 0 },
        { 0, 0, 0, 0 },
      },
      {
        { 0, 0, 0, 0 },
        { 0, 0, 1, 0 },
        { 1, 1, 1, 0 },
        { 0, 0, 0, 0 }
      },
      {
        { 0, 1, 0, 0 },
        { 0, 1, 0, 0 },
        { 0, 1, 1, 0 },
        { 0, 0, 0, 0 },
      },
    };
  }
}

class TTetrimino extends Tetrimino {  
  public TTetrimino(Field field) {
    super(field);    
    
    this.shapes = new int[][][] {
      {
        { 0, 0, 0, 0 },
        { 1, 1, 1, 0 },
        { 0, 1, 0, 0 },
        { 0, 0, 0, 0 },
      },
      {
        { 0, 1, 0, 0 },
        { 1, 1, 0, 0 },
        { 0, 1, 0, 0 },
        { 0, 0, 0, 0 },
      },
      {
        { 0, 0, 0, 0 },
        { 0, 1, 0, 0 },
        { 1, 1, 1, 0 },
        { 0, 0, 0, 0 },
      },
      {
        { 0, 1, 0, 0 },
        { 0, 1, 1, 0 },
        { 0, 1, 0, 0 },
        { 0, 0, 0, 0 },
      },
    };
  }
}
