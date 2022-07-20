

import 'package:flame/components.dart';
import 'package:so_much_space/src/base_game.dart';

class Player extends SpriteComponent with HasGameRef<BaseGame> {

  final int _speed = 300;

  Player() : super(
      position: Vector2.all(100),
      scale: Vector2.all(1),
    size: Vector2.all(50),
  );


  @override
  Future<void> onLoad() async {
    super.onLoad();
    sprite = Sprite(gameRef.images.fromCache('Player00.png'));
  }

  @override
  void update(double dt) {
    super.update(dt);


  }

}