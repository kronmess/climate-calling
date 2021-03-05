import 'package:climate_calling/controllers/SettingsButton.dart';
import 'package:climate_calling/shared/ScreenState.dart';
import 'package:climate_calling/shared/globals.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";

import '../shared/constants.dart';

class FlutterGameSettingsScreen extends StatefulWidget {
  @override
  _FlutterGameSettingsScreenState createState() =>
      _FlutterGameSettingsScreenState();
}

class _FlutterGameSettingsScreenState extends State<FlutterGameSettingsScreen> {
  double _value = 0.5;
  double _valuetwo = 0.5;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: 700,
          width: 50,
        ),
        Flexible(
          flex: 3,
          child: Image(
            image: AssetImage(PATH_SETTINGS_TILE),
            height: 1000,
            width: 1000,
          ),
        ),
        SizedBox(
          height: 50,
        ),
        Stack(
          children: [
            Positioned(
              bottom: 270,
              right: 340,
              child: Text(
                'Background Music',
              ),
            )
          ],
        ),
        Stack(
          children: [
            Positioned(
              bottom: 220,
              right: 350,
              child: Text(
                'Sound Effects',
              ),
            ),
            Stack(
              children: [
                Positioned(
                  bottom: 220,
                  right: 259,
                  height: 300,
                  width: 300,
                  child: Image(
                    image: AssetImage(PATH_BUTTON_MAIN_MENU),
                    height: 350,
                    width: 400,
                  ),
                ),
                Stack(
                  children: [
                    Positioned(
                      bottom: 330,
                      right: 350,
                      child: Text(
                        'Settings',
                        style: TextStyle(
                            height: 5,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        Stack(
          children: [
            Positioned(
              bottom: 65,
              right: 300,
              height: 98,
              width: 200,
              child: SettingsButton(
                image: AssetImage(PATH_SETTINGS_BORDER),
              ),
            ),
            Stack(
              children: [
                Positioned(
                  bottom: 100,
                  right: 310,
                  child: SettingsButton(
                    image: AssetImage(PATH_SETTINGS_BUTTON),
                    text: "Enable Hints",
                  ),
                ),
                Stack(
                  children: [
                    Positioned(
                      bottom: 50,
                      right: 330,
                      child: SettingsButton(
                          image: AssetImage(PATH_SETTINGS_BUTTON),
                          text: "Return to Main Menu",
                          onTap: () {
                            climateCalling.switchScreen(ScreenState.kMainMenu);
                          }),
                    ),
                    Container(
                      height: 2000,
                      width: 200,
                    ),
                    Stack(
                      children: [
                        Positioned(
                          bottom: 295,
                          right: 380,
                          height: 40,
                          width: 40,
                          child: SettingsButton(
                            image: AssetImage(PATH_NOTO_FIRE),
                          ),
                        ),
                        Stack(
                          children: [
                            Positioned(
                              bottom: 290,
                              right: 380,
                              child: Text(
                                'Music',
                                style: TextStyle(
                                    height: 5, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Stack(
                              children: [
                                Positioned(
                                  bottom: 150,
                                  right: 380,
                                  height: 40,
                                  width: 40,
                                  child: SettingsButton(
                                    image: AssetImage(PATH_NOTO_FIRE),
                                  ),
                                ),
                                Stack(
                                  children: [
                                    Positioned(
                                      bottom: 150,
                                      right: 360,
                                      child: Text(
                                        'Game Guide',
                                        style: TextStyle(
                                            height: 5,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Stack(
                                      children: [
                                        Positioned(
                                          bottom: 250,
                                          right: 490,
                                          height: 30,
                                          width: 30,
                                          child: SettingsButton(
                                            image: AssetImage(PATH_SOUND),
                                          ),
                                        ),
                                        Stack(
                                          children: [
                                            Positioned(
                                              bottom: 200,
                                              right: 490,
                                              height: 30,
                                              width: 30,
                                              child: SettingsButton(
                                                image: AssetImage(PATH_SOUND),
                                              ),
                                            ),
                                            Stack(children: [
                                              Positioned(
                                                bottom: 80,
                                                right: 410,
                                                height: 80,
                                                width: 80,
                                                child: Image(
                                                  image:
                                                      AssetImage(PATH_LOGO_APP),
                                                  height: 350,
                                                  width: 400,
                                                ),
                                              ),
                                              Stack(
                                                children: [
                                                  Positioned(
                                                    bottom: 223,
                                                    right: 275,
                                                    width: 220,
                                                    height: 80,
                                                    child: Slider(
                                                        value: _value,
                                                        divisions: 10,
                                                        min: 0,
                                                        max: 100,
                                                        activeColor:
                                                            Colors.black,
                                                        inactiveColor:
                                                            Colors.grey,
                                                        label: _value
                                                            .round()
                                                            .toString(),
                                                        onChanged:
                                                            (double newValue) {
                                                          setState(() {
                                                            _value = newValue;
                                                          });
                                                        }),
                                                  ),
                                                  Stack(
                                                    children: [
                                                      Positioned(
                                                        bottom: 170,
                                                        right: 275,
                                                        width: 220,
                                                        height: 80,
                                                        child: Slider(
                                                            value: _valuetwo,
                                                            divisions: 10,
                                                            min: 0,
                                                            max: 100,
                                                            activeColor:
                                                                Colors.black,
                                                            inactiveColor:
                                                                Colors.grey,
                                                            label: _valuetwo
                                                                .round()
                                                                .toString(),
                                                            onChanged: (double
                                                                newValue) {
                                                              setState(() {
                                                                _valuetwo =
                                                                    newValue;
                                                              });
                                                            }),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ]),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ],
    );
  }
}
