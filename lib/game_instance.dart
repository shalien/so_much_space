import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/parallax.dart';
import 'package:flutter/material.dart';

class GameInstance extends FlameGame with HasCollisionDetection {

  @override
  backgroundColor() => Colors.blue;

  @override
  Future<void> onLoad() async {
    final parallaxComponent = await loadParallaxComponent(
      [
        ParallaxImageData('backgrounds/snowland/SnowLand_Background_2.png'),
        ParallaxImageData('backgrounds/snowland/SnowLand_Background_3.png'),
        ParallaxImageData('backgrounds/snowland/SnowLand_Background_4.png'),
        ParallaxImageData('backgrounds/snowland/SnowLand_Background_5.png'),
        ParallaxImageData('backgrounds/snowland/SnowLand_Background_6.png'),
      ],
      baseVelocity: Vector2(20, 0),
      velocityMultiplierDelta: Vector2(2.0, 1.0),
      repeat: ImageRepeat.repeatX,
      fill: LayerFill.height,
    );

    add(parallaxComponent);
  }

  @override
  void update(double dt) {
    // TODO: implement update
      super.update(dt);

      camera.position.x = camera.position.x + 1 * dt;
  }


}