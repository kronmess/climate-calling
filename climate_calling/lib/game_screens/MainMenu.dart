import 'dart:ui';

import 'package:climate_calling/game_screens/Background.dart';
import 'package:climate_calling/game_screens/BaseScreen.dart';
import 'package:flame/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/gestures/tap.dart';

class MainMenuScreen extends BaseScreen {
  //Fields
  Background _background;

  //Constructor
  MainMenuScreen() {
    this._background = Background("MainMenuTest.png");
  }

  //Overridden Methods
  @override
  void onTapDown(TapDownDetails details) {
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
  void update() {
    // TODO: implement update
  }

}