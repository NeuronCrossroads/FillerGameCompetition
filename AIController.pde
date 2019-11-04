public class AIController {
  //piv
  private Bot alice;
  private Bot bob;
  private GameBoard game;
  private int turn;
  private final int ALICE = 0;
  private final int BOB = 1;

  public AIController(Bot a, Bot b) {
    alice = a;
    bob = b;
    turn = ALICE;
    game = new GameBoard();
  }

  private void step() {
    if (turn == ALICE) {
      Color move = alice.getMove(game.copiedColors(), game.copiedPlayers(), Player.ALICE);
      game.makeMove(Player.ALICE, move);
      turn = BOB;
    } else if (turn == BOB) {
      Color move = bob.getMove(game.copiedColors(), game.copiedPlayers(), Player.BOB);
      game.makeMove(Player.BOB, move);
      turn = ALICE;
    }
    for (int i = 0; i < 256; i++) {
      game.updateBoards();
    }
    print(game.checkWin());
  }


  public String getWinner() {
    Player winner = game.checkWin();
    if (winner == Player.ALICE) {
      return alice.getName();
    } else if (winner == Player.BOB) {
      return bob.getName();
    }
    return "";
  }
  
  public void render() {
    game.render(0,0,width,height);
  }
}
