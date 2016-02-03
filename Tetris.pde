// Tetris

TetrisGame game;
Tetris tetris = this;

void setup() {
  size(600, 400);
  game = new TetrisGame();
}

void draw() {
  game.update();
  game.draw();
}

