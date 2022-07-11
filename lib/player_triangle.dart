
import 'package:flame/components.dart';

class PlayerTriangle extends SpriteComponent {

  PlayerTriangle() : super(size: Vector2.all(32));

  @override
  Future<void> onLoad() async {
    sprite = await Sprite.load('shalien.png');
  }

}