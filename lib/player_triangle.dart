
import 'dart:math';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:so_much_space/game_instance.dart';

class PlayerTriangle extends SpriteComponent with HasGameRef<GameInstance>, CollisionCallbacks {

  PlayerTriangle() : super(size: Vector2.all(32));

  double newX = 1;
  double newY = 1;

  @override
  Future<void> onLoad() async {
    await add(RectangleHitbox());
    position = Vector2(Random().nextInt(gameRef.size.x.toInt()).toDouble(), Random().nextInt(gameRef.size.y.toInt()).toDouble());
    sprite = await Sprite.load('shalien.png');

  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    // TODO: implement onCollision
    super.onCollision(intersectionPoints, other);

    if(other is ScreenHitbox) {
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

      print('Boink');
    }
  }

  @override
  void onCollisionEnd(PositionComponent other) {
    // TODO: implement onCollisionEnd
    super.onCollisionEnd(other);

    if(other is ScreenHitbox) {
      print('Not boint');
    }
  }

  @override
  void update(double dt) {
    // TODO: implement update
    super.update(dt);

    angle = angle + 0.01;

//    scale = Vector2.all(Random().nextInt(2).toDouble());

    position = Vector2(position.x + newX, position.y + newY);


  }

  @override
  void onGameResize(Vector2 size) async {
    // TODO: implement onGameResize
    super.onGameResize(size);
  }

}