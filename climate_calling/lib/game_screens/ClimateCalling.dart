import 'package:climate_calling/game_screens/BaseScreen.dart';
import 'package:climate_calling/game_screens/MainMenu.dart';
import 'package:climate_calling/services/GameServices.dart';
import 'package:climate_calling/shared/ScreenState.dart';
import 'package:climate_calling/shared/globals.dart';
import 'package:flame/game/game.dart';
import 'package:flame/gestures.dart';
import 'package:flame/util.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';

class ClimateCalling extends Game with TapDetector{
  //Fields
  BaseScreen _menuScreen;

  Function _fnUpdate;
  Function _callback;

  Size _size = Size(0, 0);

  //Constructor
  ClimateCalling() {
    this._menuScreen = MainMenuScreen();

    _fnUpdate = _init;
    _callback = _doNothing;
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

  Future<void> _init() async {
    _fnUpdate = _update;

    Util flameUtil = Util();
    await flameUtil.fullScreen();
    await flameUtil.setOrientation(DeviceOrientation.portraitDown);
    //TODO: load user data (like level progress and such)
  }

  void _update() {
    _getActiveScreen()?.update();
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

  void setCallBack(Function fn) {
    this._callback = fn;
  }

  void _doNothing(){}

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