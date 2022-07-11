
import 'package:flame/game.dart';
import 'package:flutter/widgets.dart';
import 'package:so_much_space/game_instance.dart';


void main() {
  final gameInstance = GameInstance();
  runApp(GameWidget(game: gameInstance));
}