import 'package:climate_calling/controllers/BackgroundButton.dart';
import 'package:climate_calling/shared/ScreenState.dart';
import 'package:climate_calling/shared/globals.dart';
import "package:flutter/material.dart";

class FlutterMainMenuScreen extends StatefulWidget {
  @override
  _FlutterMainMenuScreenState createState() => _FlutterMainMenuScreenState();
}

class _FlutterMainMenuScreenState extends State<FlutterMainMenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Flexible(
          flex: 2,
          child: Image(
            image: AssetImage("assets/images/logoapp.png"),
          ),
        ),
        SizedBox(
          height: 180,
        ),
        Flexible(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BackgroundButton(
                image: AssetImage("assets/images/sprites/main menu buttons/main menu button.png"),
                text: "Start",
                onTap: (){
                  this.setState(() {
                    screenState = ScreenState.kPolar;   //Changes the screen from main menu to polar bear level TODO: change to the last screen instead
                  });
                },
              ),
              //TODO: Replace with second button widget
              FlatButton(
                textColor: Colors.black,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Text(
                  'Game Settings',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  print('test');
                },
              )
            ],
          ),
        ),
      ],
    );
  }
}
