import 'dart:ui';

import 'package:climate_calling/controllers/BaseTimedWidget.dart';
import 'package:climate_calling/game_screens/Background.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/gestures/tap.dart';

import '../shared/constants.dart';

class MainMenuScreen extends BaseTimedWidget {
  //Fields
  Background _background;

  //Constructor
  MainMenuScreen() {
    this._background = Background(PATH_MAIN_MENU_BG);
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