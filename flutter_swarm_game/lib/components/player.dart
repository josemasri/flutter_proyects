import 'dart:ui';

import 'package:flutter_swarm_game/game_controller.dart';

class Player {
  final GameController gameController;
  int maxHealth;
  int currHealth;
  Rect playerRect;
  bool isDead = false;

  Player(this.gameController) {
    maxHealth = currHealth = 300;
    final size = gameController.tileSize * 1.5;
    playerRect = Rect.fromLTWH(
      gameController.screenSize.width / 2 - size / 2,
      gameController.screenSize.height / 2 - size / 2,
      size,
      size,
    );
  }

  void render(Canvas c) {
    Paint color = Paint()..color = Color(0xFF0000FF);
    c.drawRect(playerRect, color);
  }

  void update(double t) {}
}
