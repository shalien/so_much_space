

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/parallax.dart';
import 'package:flutter/widgets.dart';

import 'package:so_much_space/player_triangle.dart';

class GameInstance extends FlameGame with HasCollisionDetection {

  final sprites = [
    'shalien.png',
    'shalien2.png',
    'shalien3.png',
    'moa.png',
    'rondo.png',
    'linoyd.png',
    'linoyd2.png',
  ];

  @override
  Future<void> onLoad() async {
    print('${camera.canvasSize.x} ${camera.canvasSize.y} ${camera.viewport.effectiveSize.x} ${camera.viewport.effectiveSize.y}');
    await super.onLoad();
    await add(ScreenHitbox());

    for(var sprite in sprites) {
      await add(PlayerTriangle(sprite));
    }
  }

}