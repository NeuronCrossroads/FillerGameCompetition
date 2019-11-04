public class RandomBot implements Bot {
  String name;
  public RandomBot(String n) {
    name = n;
  }
  
  public String getName() {
    return name;
  }
  
  public Color getMove(Color[][] colors, Player[][] players) {
    ArrayList<Color> valid = new ArrayList<Color>();
    for (Color c : Color.values())
      if (c != colors[0][0] && c != colors[15][15])
        valid.add(c);
    return valid.get((int)(Math.random()*valid.size()));
  }
}
