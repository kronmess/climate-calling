import 'dart:ui';

import 'package:climate_calling/controllers/BaseTimedWidget.dart';
import 'package:flame/animation.dart';
import 'package:flame/components/animation_component.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/src/gestures/tap.dart';

class Player extends BaseTimedWidget {
  //Fields
  AnimationComponent _player;

  //Constructor
  Player() {
    List<Sprite> sprites;   //TODO: Load sprites into a list
    this._player = AnimationComponent(0, 0, Animation.spriteList(sprites, stepTime: 0.1));
  }

  //Overridden Methods
  @override
  void onTapDown(TapDownDetails details, Function fn) {
      // TODO: implement onTapDown
    }
  
    @override
    void render(Canvas canvas) {
      this._player.render(canvas);
    }
  
    @override
    void resize(Size size) {
      this._player.resize(size);
    }
  
    @override
    void update(double t) {
    this._player.update(t);
  }
  
}