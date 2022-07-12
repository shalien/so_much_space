
import'dart:math';
import 'dart:ui';

double minMaxDouble(double min, double max) => (min + Random.secure().nextDouble()) * max - min;

Color get randomColor => Color.fromARGB(255,
    Random().nextInt(255),
    Random().nextInt(255),
    Random().nextInt(255));

Paint randomPaint() {
  var paint = Paint();
  paint.color = randomColor;
  paint.blendMode = BlendMode.difference;

  return randomPaint();
}