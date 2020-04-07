import 'dart:ui';

import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter_swarm_game/components/player.dart';

class GameController extends Game {
  Size screenSize;
  double tileSize;
  Player player;

  GameController() {
    initialize();
  }

  void render(Canvas c) {
    Rect background = Rect.fromLTWH(0, 0, screenSize.width, screenSize.height);
    Paint backgroundPaint = Paint()..color = Color(0XFFFAFAFA);
    c.drawRect(background, backgroundPaint);
    player.render(c);
  }

  void update(double t) {}

  void resize(Size size) {
    screenSize = size;
    tileSize = screenSize.width / 10;
  }

  void initialize() async {
    resize(await Flame.util.initialDimensions());
    player = Player(this);
  }
}
