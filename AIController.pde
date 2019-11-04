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
      Color move = alice.getMove(game.copiedColors(), game.copiedPlayers());
      game.makeMove(Player.ALICE,move);
      turn = BOB;
    }
    else if (turn == BOB) {
      Color move = bob.getMove(game.copiedColors(), game.copiedPlayers());
      game.makeMove(Player.BOB,move);
      turn = ALICE;
    }
  }
  
  public String getWinner() {
    
  }
}
