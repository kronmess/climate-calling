import 'package:climate_calling/controllers/SettingsButton.dart';
import 'package:climate_calling/shared/ScreenState.dart';
import 'package:climate_calling/shared/globals.dart';
import 'package:flutter/cupertino.dart';
import 'package:climate_calling/shared/constants.dart';
import 'package:flutter/material.dart';

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
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(PATH_SETTINGS_TILE),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            heightFactor: 0.5,
            child: Image(
              image: AssetImage(PATH_BUTTON_MAIN_MENU),
              height: 200,
              width: 350,
            ),
          ),
          Stack(
            children: [
              Center(
                heightFactor: 0,
                child: Text(
                  "Settings",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        heightFactor: 0,
                        widthFactor: 0,
                        child: Image(
                          image: AssetImage(PATH_NOTO_FIRE),
                          height: 50,
                          width: 50,
                        ),
                      ),
                      Text("Background Music",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                image: AssetImage(PATH_SOUND),
                                height: 30,
                                width: 30,
                              ),
                              Slider(
                                  value: _value,
                                  min: 0,
                                  max: 100,
                                  activeColor: Colors.black,
                                  inactiveColor: Colors.grey,
                                  label: _valuetwo.round().toString(),
                                  onChanged: (double newValue) {
                                    setState(() {
                                      _value = newValue;
                                    });
                                  }),
                            ],
                          ),
                          SizedBox(height: 20.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                heightFactor: 0,
                                widthFactor: 0,
                                child: Image(
                                  image: AssetImage(PATH_NOTO_FIRE),
                                  height: 50,
                                  width: 50,
                                ),
                              ),
                              Text("Sound Effects",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image(
                                    image: AssetImage(PATH_SOUND),
                                    height: 30,
                                    width: 30,
                                  ),
                                  Slider(
                                      value: _valuetwo,
                                      min: 0,
                                      max: 100,
                                      activeColor: Colors.black,
                                      inactiveColor: Colors.grey,
                                      label: _valuetwo.round().toString(),
                                      onChanged: (double newValue) {
                                        setState(() {
                                          _valuetwo = newValue;
                                        });
                                      }),
                                ],
                              ),
                              Stack(
                                children: [
                                  SizedBox(
                                    height: 100,
                                    width: 200,
                                    child: Image(
                                      image: AssetImage(PATH_SETTINGS_BORDER),
                                    ),
                                  ),
                                ],
                              ),
                              Align(
                                alignment: Alignment.topCenter,
                                child: Stack(
                                  children: [
                                    SettingsButton(
                                        image: AssetImage(PATH_SETTINGS_BUTTON),
                                        text: "Return to Main Menu",
                                        onTap: () {
                                          climateCalling.switchScreen(
                                              ScreenState.kMainMenu);
                                        }),
                                    Image(
                                      image: AssetImage(PATH_LOGO_APP),
                                      height: 60,
                                      width: 60,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ]),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
