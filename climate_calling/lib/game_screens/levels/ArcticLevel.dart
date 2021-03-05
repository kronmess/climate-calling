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
  //Constructor
  ArcticLevel() : super(0, 0 ,fixedPlayerSize: Size(80, 80)) {
    this._bg = Background(PATH_ARCTIC_LEVEL_BG);
    this.camera = Camera(this.player, phoneSize: this.size, maxSize: Size(2000, 1000), sprites: this.platforms);
    this._bears = List();
    this._initBears();
  }

  //Private Methods
  void _initBears() {
    //Initialize polar bears here and add them to _bears List
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
  void render(Canvas canvas) {
    this._bg.render(canvas);
    super.render(canvas);
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

    ///Polar bear interaction
    for (PolarBear bear in this._bears) {
      if (this.player.getAnimationComponent().toRect().overlaps(bear.getAnimationComponent().toRect())) {
        //TODO: pick up polar bear
      }
    }
  }

  @override
  void initPlatforms() async{
    Platform plt = Platform(SpriteServices.getSpriteImageAsList(await SpriteServices.mergeImage(PATH_ARCTIC_TILE, 4)));

    plt.getAnimationComponent().x = 0;
    plt.getAnimationComponent().y = 300;

    this.platforms.add(plt);
  }

  @override
  void initTerrain() async {
    this.igloo = Terrain(SpriteServices.getSpriteImageAsList(await SpriteServices.mergeImage(PATH_IGLOO, 1)), false);
  }
}