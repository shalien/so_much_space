import 'package:flame/game.dart';

import 'player/player.dart';

class BaseGame extends FlameGame {

  @override
  Future<void> onLoad() async {
    super.onLoad();
    await images.loadAll(['Player00.png']);



    await add(Player());
  }




}