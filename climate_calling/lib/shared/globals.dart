import 'package:climate_calling/controllers/sprites/NPCSprite.dart';
import 'package:climate_calling/flutter_screens/FlutterScreenManager.dart';
import 'package:climate_calling/shared/ScreenState.dart';

FlutterScreenManager flutterScreenManager = FlutterScreenManager();   //Screen manager that manages betweeen flutter widgets with flame widgets
List<NPCSprite> guidedNPCs = List();    //Variable to allow multiple NPCs being guided by the player
ScreenState screenState = ScreenState.kMainMenu;    //Keeps track of the screen states.