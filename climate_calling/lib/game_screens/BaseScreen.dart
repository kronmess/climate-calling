import 'package:flutter/cupertino.dart';

abstract class BaseScreen {
  void render(Canvas canvas);
  void update();
  void resize(Size size);
  void onTapDown(TapDownDetails details);
}