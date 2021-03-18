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
    return SafeArea(
      child: Container(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(PATH_SETTINGS_TILE),
          ),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(PATH_BUTTON_MAIN_MENU),
                    fit: BoxFit.fill
                  ),
                ),
                child: Text(
                  "Settings",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // SizedBox(height: 20.0,),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(PATH_NOTO_FIRE),
                        fit: BoxFit.fitHeight
                      ),
                    ),
                    child: Text("Background Music",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
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
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(PATH_NOTO_FIRE),
                        fit: BoxFit.fitHeight
                      ),
                    ),
                    child: Text("Sound Effects",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
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
                        },
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(PATH_SETTINGS_BORDER),
                        fit: BoxFit.fill,
                      )
                    ),
                    child: SettingsButton(
                      image: AssetImage(PATH_SETTINGS_BUTTON),
                      text: "Return to Main Menu",
                      onTap: () {
                        climateCalling.switchScreen(ScreenState.kMainMenu);
                      },
                    ),
                  ),
                  // SizedBox(height: 5.0,),
                  Image(
                    image: AssetImage(PATH_LOGO_APP),
                    height: 40,
                    width: 40,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
