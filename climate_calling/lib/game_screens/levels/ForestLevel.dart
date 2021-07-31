import 'dart:ui';

import 'package:climate_calling/controllers/sprites/Background.dart';
import 'package:climate_calling/controllers/sprites/BaseSprite.dart';
import 'package:climate_calling/controllers/sprites/PandaBear.dart';
import 'package:climate_calling/controllers/sprites/Platform.dart';
import 'package:climate_calling/controllers/sprites/Terrain.dart';
import 'package:climate_calling/game_screens/levels/BaseLevel.dart';
import 'package:climate_calling/services/SpriteServices.dart';
import 'package:climate_calling/shared/ScreenState.dart';
import 'package:climate_calling/shared/constants.dart';
import 'package:climate_calling/shared/globals.dart';
import 'package:flame/components/animation_component.dart';
import 'package:flame/flame.dart';



class ForestLevel extends BaseLevel {
  List<PandaBear> _bears;
  int _bearRescued;
  Terrain hut;
  // Constructor
  ForestLevel() : super(50, 
    220,
    fixedPlayerSize: Size(80, 80),
    background: Background(
        PATH_WILDFIRE_BG,
        fixedSize: Size(1920, 1080)
  ), cameraSize: Size(1920, 1080),
  ) 
  {
    this._bearRescued = 0;
    this._bears = [];
    this._initBears();
  }

  // Public methods
  // Method to pick up bear. Returns true if polar bear is successfully picked up.
  Future<bool> pickUpPandaBear() async {
    if (!this.player.isPickingUpBear()) {
      Rect pRect = this.player.getAnimationComponent().toRect();
      for (PandaBear bear in this._bears) {
        if (pRect.overlaps(bear.getAnimationComponent().toRect())) {
          this.player.pickUpBear(bear);
          bear.isPickedUp = true;
          Flame.audio.play(PATH_SOUND_PICK);
          return true;
        }
      }
    }
    return false;
  }
  /// Method to drop polar bear.
  /// Dropped polar bear will be rendered and dropped at the player's current position
  /// Returns true if polar bear is successfully dropped.
  bool dropPandaBear() {
    if (this.player.isPickingUpBear()) {
      PandaBear bear = this.player.pickedUpBear;
      Rect pRect = this.player.getAnimationComponent().toRect();
      //TODO: Uncomment this to make the level passable, remove 'false' in the if statement
      if (pRect.overlaps(this.hut.getAnimationComponent().toRect())) {
        this._bearRescued++;       
      }
      else {
        //Move bear to player pos
        bear.getAnimationComponent().x = this.player.getAnimationComponent().x;
        bear.getAnimationComponent().y = this.player.getAnimationComponent().y;
        bear.isPickedUp = false;
      }
      this.player.dropBear();
      Flame.audio.play(PATH_SOUND_DROP);
      return true;
    }
    return false;
  }

  // Overridden Methods
  @override
  Future<void> initTerrain() async {
    this.hut = Terrain(SpriteServices.getSpriteImageAsList(await SpriteServices.mergeImage(PATH_IGLOO_RIGHT, 1)), false, fixedSize: Size(120, 100));
    this.hut.getAnimationComponent().x = 1400;
    this.hut.getAnimationComponent().y = 330;
  }


  void _initBears() {
    PandaBear bear = PandaBear(gravity: this.gravity, fixedSize: Size(70, 50), xPos: 1020, yPos: 210);
    this._bears.add(bear);

    bear = PandaBear(gravity: this.gravity, fixedSize: Size(70, 50), xPos: 270, yPos: 100, direction: Direction.left);
    this._bears.add(bear);
  }

   @override
  void render(Canvas canvas) async{
    super.render(canvas);
    this.hut?.render(canvas);
    for (PandaBear bear in this._bears) {
      bear?.render(canvas);
    }
    
  }

  @override
  void resize(Size size) {
    super.resize(size);
    this.hut?.resize(size);
    this.camera?.phoneSize = size;
    for (PandaBear bear in this._bears) {
      bear?.resize(size);
    }
  }

  @override
  void update(double t) {
    //Check game status
    if (this._bearRescued == this._bears.length) {
      this.victory = true;
    }
    if(victory == true){
      climateCalling.switchScreen(ScreenState.kGameOver);
    }
    else if(victory == false) {
      climateCalling.switchScreen(ScreenState.kGameOver);
    }
    //Polar bear apply gravity
    for (PandaBear bear in this._bears) {
      bear.update(t); 
      bear.applyGravity();
    }

    super.update(t);
    this.camera?.update();
    this.hut?.update(t);
    bear:
    for (PandaBear bear in this._bears) {
      AnimationComponent bAC = bear.getAnimationComponent();
      for (Platform platform in this.platforms) {
        AnimationComponent platAC = platform.getAnimationComponent();
        if (bAC.toRect().overlaps(platAC.toRect())) {
          if (bAC.y + bAC.height <= platAC.y + this.collisionMargin) {
            bAC.y = platAC.y - bAC.height;
            continue bear;
          }
        }
      }
      if (this.camera != null && bAC.y + bAC.height + this.camera.y> this.camera.mapSize.height) {
      }
    }
  }
  @override
  Future<void> initPlatforms() async{
    Platform plt = Platform(SpriteServices.getSpriteImageAsList(await SpriteServices.mergeImage(PATH_FOREST_TILE, 1)),fixedSize: Size(190,20));

    plt.getAnimationComponent().x = 0;
    plt.getAnimationComponent().y = 330;

    this.platforms.add(plt);

    plt = Platform(SpriteServices.getSpriteImageAsList(await SpriteServices.mergeImage(PATH_FOREST_TILE, 1)),fixedSize: Size(240,20));
    plt.getAnimationComponent().x = 200;
    plt.getAnimationComponent().y = 220;

    this.platforms.add(plt);

    plt = Platform(SpriteServices.getSpriteImageAsList(await SpriteServices.mergeImage(PATH_FOREST_TILE, 1)),fixedSize: Size(260,20));
    plt.getAnimationComponent().x = 720;
    plt.getAnimationComponent().y = 320;

    this.platforms.add(plt);
    
    plt = Platform(SpriteServices.getSpriteImageAsList(await SpriteServices.mergeImage(PATH_FOREST_TILE, 1)),fixedSize: Size(260,20));
    plt.getAnimationComponent().x = 980;
    plt.getAnimationComponent().y = 320;

    this.platforms.add(plt);

    plt = Platform(SpriteServices.getSpriteImageAsList(await SpriteServices.mergeImage(PATH_FOREST_TILE, 1)),fixedSize: Size(260,20));
    plt.getAnimationComponent().x = 1300;
    plt.getAnimationComponent().y = 420;

    this.platforms.add(plt);
  }
  @override 
  void onInitCamera() {
    super.onInitCamera();
    //Add sprites to camera
    this.camera.addSprites(this._bears);
    this.camera.addSprite(this.hut);
  }
}