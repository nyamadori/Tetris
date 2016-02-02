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
