

import 'package:flame/components.dart';
import 'package:flame/game.dart';

import 'package:so_much_space/player_triangle.dart';

class GameInstance extends FlameGame with HasCollisionDetection {

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    await add(ScreenHitbox());

    await add(PlayerTriangle());
  }

}