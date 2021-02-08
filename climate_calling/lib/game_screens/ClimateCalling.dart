import 'package:climate_calling/game_screens/BaseScreen.dart';
import 'package:climate_calling/game_screens/MainMenu.dart';
import 'package:climate_calling/services/GameServices.dart';
import 'package:climate_calling/shared/ScreenState.dart';
import 'package:climate_calling/shared/globals.dart';
import 'package:flame/game/game.dart';
import 'package:flame/gestures.dart';
import "package:flutter/material.dart";

class ClimateCalling extends Game with TapDetector{
  //Fields
  BaseScreen _menuScreen;

  Function _fnUpdate;
  Function _callback;

  Size _size = Size(0, 0);

  //Constructor
  ClimateCalling() {
    this._menuScreen = MainMenuScreen();
  }

  //Private Methods
  BaseScreen _getActiveScreen() {
    switch (screenState) {
      case ScreenState.kMainMenu:
        return this._menuScreen;

      default:
        return this._menuScreen;
    }
  }

  //Public Methods
  void switchScreen(ScreenState newScreen) {
    switch (newScreen) {
      case ScreenState.kMainMenu:
        this._menuScreen = MainMenuScreen();
        this._menuScreen.resize(this._size);
        updateScreenState(newScreen, callback: this._callback);
        break;

      default:
        updateScreenState(newScreen);
        break;
    }
  }

  //Overridden Methods
  @override
  void render(Canvas canvas) {
      this._getActiveScreen()?.render(canvas);
    }
  
  @override
  void update(double t) {
  // TODO: implement update
  }

  @override
  void onTapDown(TapDownDetails details) {
    this._getActiveScreen().onTapDown(details);
  }

  @override
  void resize(Size size) {
    this._menuScreen?.resize(size);

    this._size = size;
  }
}