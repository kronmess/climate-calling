import 'dart:ui' as ui;

import 'package:climate_calling/controllers/sprites/Platform.dart';
import 'package:climate_calling/controllers/sprites/PolarBear.dart';
import 'package:climate_calling/controllers/sprites/Terrain.dart';
import 'package:climate_calling/game_screens/levels/BaseLevel.dart';
import 'package:climate_calling/services/Camera.dart';
import 'package:climate_calling/services/SpriteServices.dart';
import 'package:climate_calling/shared/constants.dart';
import 'package:flame/palette.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';

class TestLevel extends BaseLevel {

  //Fields
  PaletteEntry _green = PaletteEntry(Colors.green);
  List<PolarBear> bears;
  Terrain igloo;
  Camera camera;

  //Constructor
  TestLevel() : super(0, 0, fixedPlayerSize: Size(80, 80)) {
    this.bears = List();
    this._initPolarBears();
    this.camera = Camera(this.player, phoneSize: this.size, maxSize: Size(1000, 500), sprites: this.platforms);
    this.player.xVelocity = 12;
  }

  //Private Methods
  void _initPolarBears() {
    PolarBear bear = PolarBear();

    bear.getAnimationComponent().x = 250;
    bear.getAnimationComponent().y = 150 - bear.getAnimationComponent().height;

    this.bears.add(bear);
  }

  //Overridden Methods
  Future<void> initPlatforms() async{
    ui.Image platformImg = await SpriteServices.mergeImage(PATH_ARCTIC_TILE, 4);
    List<Sprite> platformImgList = SpriteServices.getSpriteImageAsList(platformImg);
    
    Platform plt = Platform(platformImgList, fixedSize: Size(500, 80));
    plt.getAnimationComponent().x = 250;
    plt.getAnimationComponent().y = 250;
    this.platforms.add(plt);

    // plt = Platform.from(plt, fixedSize: Size(100, 80));
    plt = Platform(platformImgList, fixedSize: Size(400, 80));
    plt.getAnimationComponent().x = 0;
    plt.getAnimationComponent().y = 100;
    this.platforms.add(plt);

    plt = Platform(platformImgList, fixedSize: Size(400, 80));
    plt.getAnimationComponent().x = 750;
    plt.getAnimationComponent().y = 250;
    this.platforms.add(plt);

    plt = Platform(platformImgList, fixedSize: Size(200, 80));
    plt.getAnimationComponent().x = 550;
    plt.getAnimationComponent().y = 120;
    this.platforms.add(plt);
  }

  @override
  void initTerrain() async {
    this.igloo = Terrain(SpriteServices.getSpriteImageAsList(await SpriteServices.mergeImage(PATH_IGLOO, 1)), false);
    this.igloo.getAnimationComponent().x = 300;
  }

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
  void resize(Size size) {
    super.resize(size);
    this.igloo?.resize(size);
    this.camera.phoneSize = size;
    for (PolarBear bear in this.bears) {
      bear.resize(size);
    }
  }

  @override
  void render(Canvas canvas) {
    canvas.drawRect(Rect.fromLTWH(0, 0, this.size.width, this.size.height), this._green.paint);
    // this.igloo?.render(canvas);
    super.render(canvas);
    // for (PolarBear bear in this.bears) {
    //   bear.render(canvas);
    // }
  }

  @override
  void update(double t) async{
    super.update(t);
    for (PolarBear bear in this.bears) {
      bear.applyGravity();
      //If polar bear goes off screen, prevent it from sinkin
      if (bear.getAnimationComponent().y + bear.getAnimationComponent().height >= this.size.height) {
        bear.getAnimationComponent().y = this.size.height - bear.getAnimationComponent().height;
      }
    }
    this.camera.update();
  }
}