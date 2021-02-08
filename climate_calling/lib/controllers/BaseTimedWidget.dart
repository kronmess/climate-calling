import 'package:flutter/cupertino.dart';

abstract class BaseTimedWidget {
  /**
   * Renders objects unto the screen
   */
  void render(Canvas canvas);
  /**
   * Performs any update in the data
   */
  void update(double t);
  /**
   * Recalculate the sizing of objects
   */
  void resize(Size size);
  /**
   * Operation to be done when the user taps on the screen
   */ 
  void onTapDown(TapDownDetails details, Function fn);
}