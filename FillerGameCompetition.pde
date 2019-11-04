GameBoard game;
Player currPlayer;

void setup() {
  size(500,500);
  game = new GameBoard();
  currPlayer = Player.ALICE;
  noStroke();
}

void draw() {
  game.render(0,0,width,height);
  int c = mouseX/(int)(width/16.);
  int r = mouseY/(int)(height/16.);
}

void mousePressed() {
  int c = mouseX/(int)(width/16.);
  int r = mouseY/(int)(height/16.);
  Color chosen = game.getColors()[r][c];
  if (currPlayer == Player.ALICE && chosen != game.BOBColor) {
    game.makeMove(Player.ALICE,chosen);
    currPlayer = Player.BOB;
  } 
  else if(currPlayer == Player.BOB && chosen != game.ALICEColor) {
    game.makeMove(Player.BOB,chosen);
    currPlayer = Player.ALICE;
  }
  for (int i = 0; i < 256; i++) {
    game.updateBoards();
  } //<>//
  print(game.checkWin());
}
