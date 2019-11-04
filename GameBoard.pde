enum Color {
  RED, 
    ORANGE, 
    YELLOW, 
    GREEN, 
    BLUE, 
    INDIGO
}

enum Player {
  ALICE, 
    BOB, 
    NONE,
}

class GameBoard {
  private Color[][] colors;
  private Player[][] players;
  private Color ALICEColor;
  private Color BOBColor;

  public GameBoard() {
    colors = new Color[16][16];
    players = new Player[16][16];
    for (int r = 0; r < 16; r++) {
      for (int c = 0; c < 16; c++) {
        Color chosen = Color.values()[(int)(Math.random()*6.0)];
        colors[r][c] = chosen;
        players[r][c] = Player.NONE;
      }
    }
    players[0][0] = Player.ALICE;
    ALICEColor = colors[0][0];
    players[15][15] = Player.BOB;
    BOBColor = colors[15][15];
    updateBoards();
  }

  public Color[][] getColors() {
    return colors;
  }

  public Player[][] getPlayers() {
    return players;
  }

  public void updateBoards() {

    for (int r = 0; r < 16; r++) {
      for (int c = 0; c < 16; c++) {
        Player here = players[r][c];
        switch(here) {
        case ALICE:
          colors[r][c] = ALICEColor;
          break;
        case BOB:
          colors[r][c] = BOBColor;
          break;
        default:
          break;
        }
      }
    }

    for (int r = 0; r < 16; r++) {
      for (int c = 0; c < 16; c++) {
        Player pHere = players[r][c];
        if (pHere != Player.NONE) {
          Color here = colors[r][c];
          if (r > 0) {
            Color other = colors[r-1][c];
            if (here == other) players[r-1][c] = players[r][c];
          }
          if (r < 15) {
            Color other = colors[r+1][c];
            if (here == other) players[r+1][c] = players[r][c];
          }
          if (c > 0) {
            Color other = colors[r][c-1];
            if (here == other) players[r][c-1] = players[r][c];
          }
          if (c < 15) {
            Color other = colors[r][c+1];
            if (here == other) players[r][c+1] = players[r][c];
          }
        }
      }
    }
  }

  public void makeMove(Player side, Color colour) {
    if (!checkValid(colour)) return;//no mode made
    switch(side) {
    case ALICE:
      ALICEColor = colour;
      break;
    case BOB:
      BOBColor = colour;
      break;
    default:
      break;
    }
  }

  private int getCount(Player opt) {
    int count = 0;
    for (int r = 0; r < 16; r++) {
      for (int c = 0; c < 16; c++) {
        if (players[r][c] == opt) count++;
      }
    }
    return count;
  }

  public boolean checkValid(Color c) {
    return c != ALICEColor && c != BOBColor;
  }

  public Color[][] copiedColors() {
    Color[][] out = new Color[16][16];
    for (int r = 0; r < 16; r++) {
      for (int c = 0; c < 16; c++) {
        out[r][c] = colors[r][c];
      }
    }
    return out;
  }

  public Player[][] copiedPlayers() {
    Player[][] out = new Player[16][16];
    for (int r = 0; r < 16; r++) {
      for (int c = 0; c < 16; c++) {
        out[r][c] = players[r][c];
      }
    }
    return out;
  }
  public Player checkWin() {
    int ac = getCount(Player.ALICE);
    int bc = getCount(Player.BOB);
    int nc = getCount(Player.NONE);
    print(ac+" "+bc+" "+nc+"\n");
    if (ac + nc < bc) {
      return Player.BOB;
    }
    if (bc + nc < ac) {
      return Player.ALICE;
    }
    return Player.NONE;
  }

  public void render(int x, int y, int w, int h) {
    float ws = w/16.;
    float hs = h/16.;
    for (int r = 0; r < 16; r++) {
      for (int c = 0; c < 16; c++) {
        Color col = colors[r][c];
        switch (col) {
        case RED: 
          fill(209, 0, 0); 
          break;
        case ORANGE: 
          fill(255, 102, 34); 
          break;
        case YELLOW: 
          fill(255, 218, 33); 
          break;
        case GREEN: 
          fill(51, 221, 0); 
          break;
        case BLUE: 
          fill(17, 51, 2014); 
          break;
        case INDIGO: 
          fill(24, 0, 102); 
          break;
        }
        noStroke();
        rect(x+c*ws, y+r*hs, ws, hs);
        if (players[r][c] != Player.NONE) {
          fill(255, 255, 255, sin(frameCount/10.)*100+50);
          rect(x+c*ws, y+r*hs, ws, hs);
        }
      }
    }
  }
}
