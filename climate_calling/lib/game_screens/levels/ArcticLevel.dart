import 'dart:ui';

import 'package:climate_calling/controllers/sprites/Platform.dart';
import 'package:climate_calling/controllers/sprites/PolarBear.dart';
import 'package:climate_calling/controllers/sprites/Terrain.dart';
import 'package:climate_calling/game_screens/levels/BaseLevel.dart';
import 'package:climate_calling/services/Camera.dart';
import 'package:climate_calling/services/SpriteServices.dart';
import 'package:climate_calling/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/gestures/tap.dart';

import '../Background.dart';

class ArcticLevel extends BaseLevel {

  //Fields
  Background _bg;
  Camera camera;
  List<PolarBear> _bears;
  Terrain igloo;
  int _bearRescued;

  //Constructor
  ArcticLevel() : super(50, 0 ,fixedPlayerSize: Size(80, 80)) {
    this._bearRescued = 0;
    this._bg = Background(PATH_ARCTIC_LEVEL_BG);
    this.camera = Camera(this.player, phoneSize: this.size, maxSize: Size(2000, 1000), sprites: this.platforms);
    this._bears = List();
    this._initBears();
  }

  //Private Methods
  void _initBears() {
    //TODO: Initialize polar bears here and add them to _bears List
  }

  //Overridden Methods
  @override
  bool isLevelFinished() {
    // TODO: implement isLevelFinished
    return false;
  }

  @override
  void onTapDown(TapDownDetails details, Function fn) {
    super.onTapDown(details, fn);
    // TODO: implement onTapDown
  }

  @override
  void render(Canvas canvas) async{
    this._bg.render(canvas);
    super.render(canvas);
    //TODO: Render igloo
    for (PolarBear bear in this._bears) {
      bear.render(canvas);
    }
  }

  @override
  void resize(Size size) {
    super.resize(size);
    this._bg.resize(size);
    this.camera.phoneSize = size;
  }

  @override
  void update(double t) {
    super.update(t);
    this.camera.update();
    Rect playerRect = this.player.getAnimationComponent().toRect();

    ///Polar bear interaction
    for (PolarBear bear in this._bears) {
      if (playerRect.overlaps(bear.getAnimationComponent().toRect())) {
        if (!this.player.isPickedUp) {    //If player isnt currently picking up a polar bear
          //TODO: update player animation to the one picking up the polar bear
        }
      }
    }

    //Check collision with igloo
    if (playerRect.overlaps(this.igloo.getAnimationComponent().toRect())) {
      //TODO: wrap in condition if player presses the Use button, drop polar bear and increment _bearRescued++
    }
  }

  @override
  void initPlatforms() async{
    Platform plt = Platform(SpriteServices.getSpriteImageAsList(await SpriteServices.mergeImage(PATH_ARCTIC_TILE, 4)),fixedSize: Size(1000,50));

    plt.getAnimationComponent().x = 0;
    plt.getAnimationComponent().y = 300;

    this.platforms.add(plt);
  }

  @override
  void initTerrain() async {
    this.igloo = Terrain(SpriteServices.getSpriteImageAsList(await SpriteServices.mergeImage(PATH_IGLOO, 1)), false);
    //TODO: position igloo
  }
}