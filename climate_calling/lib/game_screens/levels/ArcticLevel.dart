import 'dart:ui';

import 'package:climate_calling/controllers/sprites/Platform.dart';
import 'package:climate_calling/controllers/sprites/PolarBear.dart';
import 'package:climate_calling/controllers/sprites/Terrain.dart';
import 'package:climate_calling/game_screens/levels/BaseLevel.dart';
import 'package:climate_calling/services/Camera.dart';
import 'package:climate_calling/services/SpriteServices.dart';
import 'package:climate_calling/shared/constants.dart';
import 'package:flame/components/animation_component.dart';
import 'package:flame/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/gestures/tap.dart';

import '../Background.dart';

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
    background: Background(PATH_ARCTIC_LEVEL_BG, size: Size(1920, 1080))
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

      return true;
    }
    return false;
  }

  //Private Methods
  void _initBears() {
    PolarBear bear = PolarBear(gravity: this.gravity, fixedSize: Size(70, 50), xPos: 150, yPos: 20);
    this._bears.add(bear);

    bear = PolarBear(gravity: this.gravity, fixedSize: Size(70, 50), xPos: 300, yPos: 20);
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
      //Polar bear collision with world limit
      if (this.camera != null && bAC.y + bAC.height > this.camera.maxSize.height) {
        //Kill polar bear
        // bear.isPickedUp = true; //Just to make it invisible
        bAC.y = this.size.height - bAC.height;
        bear.isGravityApplied = false;
        this.victory = false;   //Game defeat
      }
    }
  }

  @override
  void initPlatforms() async{
    Platform plt = Platform(SpriteServices.getSpriteImageAsList(await SpriteServices.mergeImage(PATH_ARCTIC_TILE, 4)),fixedSize: Size(1000,50));

    plt.getAnimationComponent().x = 0;
    plt.getAnimationComponent().y = 300;

    this.platforms.add(plt);

    plt = Platform(SpriteServices.getSpriteImageAsList(await SpriteServices.mergeImage(PATH_ARCTIC_TILE, 1)),fixedSize: Size(400,20));
    plt.getAnimationComponent().x = 180;
    plt.getAnimationComponent().y = 400;

    this.platforms.add(plt);
  }

  @override
  void initTerrain() async {
    this.igloo = Terrain(SpriteServices.getSpriteImageAsList(await SpriteServices.mergeImage(PATH_IGLOO, 1)), false);
    this.igloo.getAnimationComponent().x = 20;
    this.igloo.getAnimationComponent().y = 160;
  }

  @override
  void onInitCamera() {
    super.onInitCamera();
    //Add sprites to camera
    this.camera.addSprites(this._bears);
    this.camera.addSprite(this.igloo);
  }
}