import 'dart:ui';

import 'package:climate_calling/controllers/sprites/BaseSprite.dart';
import 'package:climate_calling/controllers/sprites/Platform.dart';
import 'package:climate_calling/controllers/sprites/PolarBear.dart';
import 'package:climate_calling/controllers/sprites/Terrain.dart';
import 'package:climate_calling/game_screens/Background.dart';
import 'package:climate_calling/game_screens/levels/BaseLevel.dart';
import 'package:climate_calling/services/Camera.dart';
import 'package:climate_calling/services/SpriteServices.dart';
import 'package:climate_calling/shared/ScreenState.dart';
import 'package:climate_calling/shared/constants.dart';
import 'package:climate_calling/shared/globals.dart';
import 'package:flame/components/animation_component.dart';
import 'package:flame/flame.dart';
import 'package:flame/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/gestures/tap.dart';

class ArcticLevel extends BaseLevel {

  //Fields
  List<PolarBear> _bears;
  Terrain igloo;
  int _bearRescued;   //The number of bears that has been rescued 
  // PaletteEntry _camColor = PaletteEntry(Colors.yellow);

  //Constructor
  ArcticLevel() : super(
    50, 
    0,
    fixedPlayerSize: Size(80, 80), 
    background: Background(PATH_ARCTIC_LEVEL_BG)
  ) {
    this._bearRescued = 0;
    this._bears = List();
    this._initBears();
  }

  //Public methods
  /**
   * Method to pick up bear. Returns true if polar bear is successfully picked up.
   */
  Future<bool> pickUpPolarBear() async {
    if (!this.player.isPickingUpBear()) {
      Rect pRect = this.player.getAnimationComponent().toRect();
      for (PolarBear bear in this._bears) {
        if (pRect.overlaps(bear.getAnimationComponent().toRect())) {
          this.player.pickUpPolarBear(bear);
          bear.isPickedUp = true;
          Flame.audio.play(PATH_SOUND_PICK);
          return true;
        }
      }
    }
    return false;
  }
  /**
   * Method to drop polar bear.
   * Dropped polar bear will be rendered and dropped at the player's current position
   * Returns true if polar bear is successfully dropped.
   */
  bool dropPolarBear() {
    if (this.player.isPickingUpBear()) {
      PolarBear bear = this.player.pickedUpBear;
      Rect pRect = this.player.getAnimationComponent().toRect();
      if (pRect.overlaps(this.igloo.getAnimationComponent().toRect())) {
        this._bearRescued++;        //Increase bear rescued counter
        // this._bears.remove(bear);   //Remove bear object
      }
      else {
        //Move bear to player pos
        bear.getAnimationComponent().x = this.player.getAnimationComponent().x;
        bear.getAnimationComponent().y = this.player.getAnimationComponent().y;
        bear.isPickedUp = false;
      }
      this.player.dropPolarBear();
      Flame.audio.play(PATH_SOUND_DROP);
      return true;
    }
    return false;
  }

  //Private Methods
  void _initBears() {
    PolarBear bear = PolarBear(gravity: this.gravity, fixedSize: Size(70, 50), xPos: 760, yPos: 230);
    this._bears.add(bear);

    bear = PolarBear(gravity: this.gravity, fixedSize: Size(70, 50), xPos: 270, yPos: 300, direction: Direction.left);
    this._bears.add(bear);
  }

  //Overridden Methods
  @override
  void onTapDown(TapDownDetails details, Function fn) {
    super.onTapDown(details, fn);
    // TODO: implement onTapDown
  }

  @override
  void render(Canvas canvas) async{
    super.render(canvas);
    this.igloo?.render(canvas);
    for (PolarBear bear in this._bears) {
      bear?.render(canvas);
    }
    // canvas.drawRect(Rect.fromLTWH(this.camera.x - 25, this.camera.y - 25, 50, 50), this._camColor.paint);   //Camera position debug
  }

  @override
  void resize(Size size) {
    super.resize(size);
    this.camera?.phoneSize = size;
    this.igloo?.resize(size);
    for (PolarBear bear in this._bears) {
      bear?.resize(size);
    }
    // this._bg.resize(this.camera.maxSize);
  }

  @override
  void update(double t) {
    //Check game status
    if (this._bearRescued == this._bears.length) {
      this.victory = true;
    }
    // if(this.player.getAnimationComponent().y > 320){
    //   victory = false;
    // }
    if(victory == true){
      climateCalling.switchScreen(ScreenState.kGameOver);
    }
    else if(victory == false) {
      climateCalling.switchScreen(ScreenState.kGameOver);
    }
    //Polar bear apply gravity
    for (PolarBear bear in this._bears) {
      bear.update(t); 
      bear.applyGravity();
    }

    super.update(t);
    this.camera?.update();
    this.igloo?.update(t);
    // Rect playerRect = this.player.getAnimationComponent().toRect();

    //Polar bear collision
    bear:
    for (PolarBear bear in this._bears) {
      AnimationComponent bAC = bear.getAnimationComponent();
      // if(bear.getAnimationComponent().y > 330){
      //   this.victory = false;
      // }
      //Polar bear collision with platform
      for (Platform platform in this.platforms) {
        AnimationComponent platAC = platform.getAnimationComponent();
        if (bAC.toRect().overlaps(platAC.toRect())) {
          if (bAC.y + bAC.height <= platAC.y + this.gravity) {
            bAC.y = platAC.y - bAC.height;
            continue bear;
          }
        }
      }
      // print("Camera: ${this.camera?.y}");
      // print("Bear pos: ${bAC.y + bAC.height + this.camera?.y}");
      if (this.camera != null && bAC.y + bAC.height + this.camera.y> this.camera.maxSize.height) {
        //Kill polar bear
        // bear.isPickedUp = true; //Just to make it invisible
        // bAC.y = this.size.height - bAC.height;
        // bear.isGravityApplied = false;
        // this.victory = false;   //Game defeat
      }
    }
  }

  @override
  void initPlatforms() async{
    Platform plt = Platform(SpriteServices.getSpriteImageAsList(await SpriteServices.mergeImage(PATH_ARCTIC_TILE, 1)),fixedSize: Size(120,20));

    plt.getAnimationComponent().x = 0;
    plt.getAnimationComponent().y = 330;

    this.platforms.add(plt);

    plt = Platform(SpriteServices.getSpriteImageAsList(await SpriteServices.mergeImage(PATH_ARCTIC_TILE, 1)),fixedSize: Size(200,20));
    plt.getAnimationComponent().x = 200;
    plt.getAnimationComponent().y = 380;

    this.platforms.add(plt);

    plt = Platform(SpriteServices.getSpriteImageAsList(await SpriteServices.mergeImage(PATH_ARCTIC_TILE, 1)),fixedSize: Size(40,20));
    plt.getAnimationComponent().x = 500;
    plt.getAnimationComponent().y = 380;

    this.platforms.add(plt);

    plt = Platform(SpriteServices.getSpriteImageAsList(await SpriteServices.mergeImage(PATH_ARCTIC_TILE, 1)),fixedSize: Size(40,20));
    plt.getAnimationComponent().x = 600;
    plt.getAnimationComponent().y = 360;

    this.platforms.add(plt);

    plt = Platform(SpriteServices.getSpriteImageAsList(await SpriteServices.mergeImage(PATH_ARCTIC_TILE, 1)),fixedSize: Size(200,20));
    plt.getAnimationComponent().x = 720;
    plt.getAnimationComponent().y = 320;

    this.platforms.add(plt);
  }

  @override
  void initTerrain() async {
    this.igloo = Terrain(SpriteServices.getSpriteImageAsList(await SpriteServices.mergeImage(PATH_IGLOO_RIGHT, 1)), false, fixedSize: Size(120, 100));
    this.igloo.getAnimationComponent().x = 0;
    this.igloo.getAnimationComponent().y = 240;
  }

  @override 
  void onInitCamera() {
    super.onInitCamera();
    //Add sprites to camera
    this.camera.addSprites(this._bears);
    this.camera.addSprite(this.igloo);
  }
}