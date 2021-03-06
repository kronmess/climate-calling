import 'dart:ui';
import 'package:climate_calling/controllers/BaseTimedWidget.dart';
import 'package:climate_calling/legacy/Background.dart';
import 'package:climate_calling/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/gestures/tap.dart';

class GameOverScreen extends BaseTimedWidget {
  //Fields
  Background _background;

  //Constructor
  GameOverScreen() {
    this._background = Background(PATH_ARCTIC_LEVEL_BG + "1.png");
  }

  //Overridden Methods
  @override
  void onTapDown(TapDownDetails details, Function fn) {
    // TODO: implement onTapDown
  }

  @override
  void render(Canvas canvas) {
    this._background?.render(canvas);
  }

  @override
  void resize(Size size) {
    this._background?.resize(size);
  }

  @override
  void update(double t) {
    // TODO: implement update
  }
}