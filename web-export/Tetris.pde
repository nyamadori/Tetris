// Tetris

int field[][] = {
  { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
  { 0, 0, 1, 1, 1, 0, 0, 0, 0, 0 },
  { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
  { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
  { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
  { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
  { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
  { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
  { 0, 0, 0, 1, 0, 0, 0, 0, 0, 0 },
  { 0, 0, 0, 1, 0, 0, 0, 0, 0, 0 },
  { 0, 0, 0, 1, 0, 0, 0, 0, 0, 0 },
  { 0, 0, 0, 1, 0, 0, 0, 0, 0, 0 },
  { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
  { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
  { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
  { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
  { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
  { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
  { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
  { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
};

int N_ROW = field.length;
int N_COL = field[0].length;
int prevFrameCount;

void setup() {
  size(600, 400);
}

void draw() {
  background(0);
  
  for (int i = 0; i < N_ROW; i++) {
    for (int j = 0; j < N_COL; j++) {
      switch (field[i][j]) {
      case 1:
        rect(j * 16, i * 16, 16, 16);
      }
    }
  }
  
  fallBlocks();
}

void fallBlocks() {
  if (frameCount - prevFrameCount < 20) return;
  
  for (int i = N_ROW - 2; i >= 0; i--) {
    for (int j = 0; j < N_COL; j++) {
      if (field[i + 1][j] == 1) continue;
      
      int b = field[i][j];
      field[i + 1][j] = b;
      field[i][j] = 0;
    }
  }
  
  prevFrameCount = frameCount;
}
class Field {
  private int field[][];
  
  public Field() {
    this.field = new int[20][10];
  }
}
abstract class Tetrimino {
  private int[][] shape;
  
  public int[][] getShape() {
    return this.shape;
  }
}

class ITetrimino extends Tetrimino {  
  public ITetrimino() {
    this.shape = new int[][] {
      { 1, 1, 1, 1 },
    };
  }
}

class OTetrimino implements Tetrimino {  
  public OTetrimino() {
    this.shape = new int[][] {
      { 1, 1 },
      { 1, 1 },
    };
  }
}

class STetrimino implements Tetrimino {  
  public STetrimino() {
    this.shape = new int[][] {
      { 0, 1, 1 },
      { 1, 1, 0 },
    };
  }
}

class ZTetrimino implements Tetrimino {  
  public ZTetrimino() {
    this.shape = new int[][] {
      { 1, 1, 0 },
      { 0, 1, 1 },
    };
  }
}

class JTetrimino implements Tetrimino {  
  public JTetrimino() {
    this.shape = new int[][] {
      { 1, 0, 0 },
      { 1, 1, 1 },
    };
  }
}

class LTetrimino implements Tetrimino {  
  public LTetrimino() {
    this.shape = new int[][] {
      { 0, 0, 1 },
      { 1, 1, 1 },
    };
  }
}

class TTetrimino implements Tetrimino {  
  public TTetrimino() {
    this.shape = new int[][] {
      { 0, 1, 0 },
      { 1, 1, 1 },
    };
  }
}

