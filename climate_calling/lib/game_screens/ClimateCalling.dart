import 'package:climate_calling/controllers/BaseTimedWidget.dart';
import 'package:climate_calling/game_screens/GameOver.dart';
import 'package:climate_calling/game_screens/GameSettings.dart';
import 'package:climate_calling/game_screens/MainMenu.dart';
import 'package:climate_calling/game_screens/levels/ArcticLevel.dart';
import 'package:climate_calling/game_screens/levels/TestLevel.dart';
import 'package:climate_calling/services/GameServices.dart';
import 'package:climate_calling/shared/ScreenState.dart';
import 'package:climate_calling/shared/globals.dart';
import 'package:flame/game/game.dart';
import 'package:flame/gestures.dart';
import 'package:flame/util.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';

import 'levels/ForestLevel.dart';

class ClimateCalling extends Game with TapDetector {
  //Fields
  BaseTimedWidget _menuScreen;
  BaseTimedWidget _levelArctic;
  BaseTimedWidget _levelTest;
  BaseTimedWidget _settingsScreen;
  BaseTimedWidget _gameOverScreen;
  BaseTimedWidget _levelForest;
  Function _fnUpdate;
  Function _callback;

  Size _size = Size(0, 0);

  //Constructor
  ClimateCalling() {
    this._menuScreen = MainMenuScreen();
    // this._levelArctic = ArcticLevel();
    this._levelTest = TestLevel();
    this._settingsScreen = GameSettingsScreen();
    this._gameOverScreen = GameOverScreen();
    this._levelForest = ForestLevel();
    _fnUpdate = _init;
    _callback = _doNothing;
  }

  //Private Methods
  BaseTimedWidget getActiveScreen() {
    switch (screenState) {
      case ScreenState.kGameSettings:
        return this._settingsScreen;

      case ScreenState.kMainMenu:
        return this._menuScreen;

      case ScreenState.kPolar:
        return this._levelArctic;
      
      case ScreenState.kGameOver:
        return this._gameOverScreen;

      case ScreenState.kTest:
        return this._levelTest;

      case ScreenState.kForest:
        return this._levelForest;

      default:
        return this._menuScreen;
    }
  }

  Future<void> _init(double t) async {
    _fnUpdate = _update;

    Util flameUtil = Util();
    await flameUtil.fullScreen();
    await flameUtil.setOrientation(DeviceOrientation.landscapeLeft);
    //TODO: load user data (like level progress and such)
  }

  void _update(double t) {
    getActiveScreen()?.update(t);
  }

  //Public Methods
  void switchScreen(ScreenState newScreen) {
    switch (newScreen) {
      case ScreenState.kMainMenu:
        this._menuScreen = MainMenuScreen();
        this._menuScreen.resize(this._size);
        updateScreenState(newScreen,
            callback: this
                ._callback); //Required to render the main menu flutter widgets
        break;

      case ScreenState.kPolar:
        this._levelArctic = ArcticLevel();
        this._levelArctic.resize(this._size);
        updateScreenState(newScreen, callback: this._callback);
        break;

      case ScreenState.kGameOver:
        this._gameOverScreen = GameOverScreen();
        this._gameOverScreen.resize(this._size);
        updateScreenState(newScreen, callback: this._callback);
        break;

      case ScreenState.kGameSettings:
        this._settingsScreen = GameSettingsScreen();
        this._settingsScreen.resize(this._size);
        updateScreenState(newScreen,
            callback: this
                ._callback); //Required to render the settings menu flutter widgets
        break;

      case ScreenState.kForest:
      this._levelForest = ForestLevel();
      this._levelForest.resize(this._size);
      updateScreenState(newScreen, callback: this._callback);
      break;

      case ScreenState.kTest:
        // this._levelTest = TestLevel();
        // this._levelTest.resize(this._size);
        updateScreenState(newScreen, callback: this._callback); //Test
        break;
        
      default:
        updateScreenState(newScreen);
        break;
    }
  }

  void setCallBack(Function fn) {
    this._callback = fn;
  }

  void _doNothing() {}

  //Overridden Methods
  @override
  void render(Canvas canvas) {
    this.getActiveScreen()?.render(canvas);
  }

  @override
  void update(double t) {
    this._fnUpdate(t);
  }

  @override
  void onTapDown(TapDownDetails details) {
    this.getActiveScreen().onTapDown(details, null);
  }

  @override
  void resize(Size size) {
    // this._menuScreen?.resize(size);
    // this._levelArctic?.resize(size);
    // this._levelTest?.resize(size);
    // this._settingsScreen?.resize(size);
    this.getActiveScreen()?.resize(size);
    this._size = size;
  }
}
