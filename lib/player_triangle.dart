
import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:so_much_space/game_instance.dart';

class PlayerTriangle extends SpriteComponent with HasGameRef<GameInstance> {

  PlayerTriangle() : super(size: Vector2.all(32));

  double newX = 1;
  double newY = 1;

  @override
  Future<void> onLoad() async {
    anchor = Anchor.center;
    position = Vector2(gameRef.size.x / 2, gameRef.size.y / 2);
    sprite = await Sprite.load('shalien.png');
  }

  @override
  void update(double dt) {
    // TODO: implement update
    super.update(dt);

    if(position.y >= gameRef.size.y) {
      newY = -1;
    } else if (position.y <= 0) {
      newY = 1;
    }

    if(position.x >= gameRef.size.x) {
      newX =  -1;
    } else if (position.x <= 0) {
      newX = 1;
    }

    angle = angle + ((newX + newY) / 100);

    scale = Vector2(scale.x + (newX / 100), scale.y + (newY / 100));

    position = Vector2(position.x + newX, position.y + newY);
  }

  @override
  void onGameResize(Vector2 size) async {
    // TODO: implement onGameResize
    super.onGameResize(size);
  }

}