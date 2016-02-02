// 参考: テトリミノの形状と回転軸について
//http://www13.plala.or.jp/TETRiS_TGM/kouza/index.htm

abstract class Tetrimino {
  protected int[][][] shapes;
  protected int rotateAngle;
  protected int x;
  protected int y;
  protected Field field;
  
  public Tetrimino(Field field) {
    this.field = field;
  }
  
  public int[][] currentShape() {
    return shapes[rotateAngle % shapes.length];
  }
  
  public void rotateLeft() {
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
    field.unput(this);
    rotateAngle++;

    if (field.canPut(this)) {
      field.put(this);
    } else {
      rotateAngle--;
      field.put(this);
    }
  }

  public void move(int vx, int vy) {
    field.unput(this);
    x += vx;
    y += vy;
    
    if (field.canPut(this)) {
      field.put(this);
    } else {
      x -= vx;
      y -= vy;
      field.put(this);
    }
  }

  public void fall() {
    move(0, 1);
  }
  
  public void moveLeft() {
    move(-1, 0);
  }
  
  public void moveRight() {
    move(1, 0);
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
