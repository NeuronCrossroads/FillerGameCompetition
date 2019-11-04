interface Bot {
  String getName();
  Color getMove(Color[][] colors, Player[][] players, Player curr);
}
