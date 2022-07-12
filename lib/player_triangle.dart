
import 'dart:math';
import 'dart:ui';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:so_much_space/game_instance.dart';
import 'package:so_much_space/utils.dart';

class PlayerTriangle extends SpriteComponent with HasGameRef<GameInstance>, CollisionCallbacks {

  final String spriteName;

  PlayerTriangle(this.spriteName) : super(size: Vector2.all(32));

  double newX = 1;
  double newY = 1;

  @override
  Future<void> onLoad() async {
    await add(RectangleHitbox(size: Vector2.all(32)));
    position = Vector2(Random().nextInt(gameRef.size.x.toInt()).toDouble(), Random().nextInt(gameRef.size.y.toInt()).toDouble());
    sprite = await Sprite.load(spriteName);
    angle = minMaxDouble(-5.0, 5.0);

  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);

    if(other is ScreenHitbox) {
      if(position.y + 32 >= gameRef.size.y) {
        newY = -1;
      } else if (position.y - 32 <= 0) {
        newY = 1;
      }

      if(position.x + 32 >= gameRef.size.x) {
        newX = -1;
      } else if (position.x - 32 <= 0) {
        newX = 1;
      }

      print('Boink');
    }
  }

  @override
  void onCollisionEnd(PositionComponent other) {
    super.onCollisionEnd(other);

    if(other is ScreenHitbox) {
      print('Not boint');
    }
  }

  @override
  void update(double dt) {
    super.update(dt);
//    scale = Vector2.all(Random().nextInt(2).toDouble());

    position = Vector2(position.x + newX, position.y + newY);

    if(angle <= 0) {
      angle = angle -dt;
    } else {
      angle = angle + dt;
    }

    paint = Paint()..color = randomColor;
  }

  @override
  void onGameResize(Vector2 size) async {
    // TODO: implement onGameResize
    super.onGameResize(size);
  }

}