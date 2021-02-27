import 'package:climate_calling/controllers/sprites/Platform.dart';
import 'package:climate_calling/controllers/sprites/PolarBear.dart';
import 'package:climate_calling/controllers/sprites/Terrain.dart';
import 'package:climate_calling/game_screens/levels/BaseLevel.dart';
import 'package:climate_calling/services/SpriteServices.dart';
import 'package:climate_calling/shared/constants.dart';
import 'package:flame/palette.dart';
import 'package:flutter/material.dart';

class TestLevel extends BaseLevel {

  //Fields
  PaletteEntry _green = PaletteEntry(Colors.green);
  List<PolarBear> bears;
  Terrain igloo;

  //Constructor
  TestLevel() : super(250, 0) {
    this._initTerrain();
    this.bears = List();
    this._initPolarBears();
  }

  //Private Methods
  void _initTerrain() async{
    this.igloo = Terrain(SpriteServices.getSpriteImageAsList(await SpriteServices.mergeImage(PATH_IGLOO, 1)), false);
    this.igloo.getAnimationComponent().x = 300;
  }
  void _initPolarBears() {
    PolarBear bear = PolarBear();

    bear.getAnimationComponent().x = 250;
    bear.getAnimationComponent().y = 150 - bear.getAnimationComponent().height;

    this.bears.add(bear);
  }

  //Overridden Methods
  Future<void> initPlatforms() async{
    Platform plt = Platform(SpriteServices.getSpriteImageAsList(await SpriteServices.mergeImage(PATH_ARCTIC_TILE, 4)));

    plt.getAnimationComponent().x = 250;
    plt.getAnimationComponent().y = 250;

    this.platforms.add(plt);
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
    this.igloo.resize(size);
    for (PolarBear bear in this.bears) {
      bear.resize(size);
    }
  }

  @override
  void render(Canvas canvas) {
    canvas.drawRect(Rect.fromLTWH(0, 0, this.size.width, this.size.height), this._green.paint);
    this.igloo.render(canvas);
    super.render(canvas);
    for (PolarBear bear in this.bears) {
      bear.render(canvas);
    }
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
  }
}