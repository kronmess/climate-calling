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
    return Stack(
      children: <Widget>[
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                widthFactor: 3,
                child: Image(
                  image: AssetImage(PATH_SETTINGS_TILE),
                  height: 400,
                  width: 400,
                ),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                heightFactor: 6,
                widthFactor: 21,
                child: Image(
                  image: AssetImage(PATH_NOTO_FIRE),
                  height: 40,
                  width: 40,
                ),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SingleChildScrollView(
                  child: Center(
                heightFactor: 3,
                widthFactor: 8.5,
                child: Text(
                  'Background Music',
                  style: TextStyle(
                      height: 5, fontSize: 15, fontWeight: FontWeight.bold),
                ),
              )),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SingleChildScrollView(
                child: Center(
                  heightFactor: 10,
                  widthFactor: 21,
                  child: Image(
                    image: AssetImage(PATH_NOTO_FIRE),
                    height: 40,
                    width: 40,
                  ),
                ),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SingleChildScrollView(
                child: Center(
                  heightFactor: 5,
                  widthFactor: 8.5,
                  child: Text(
                    'Sound Effects',
                    style: TextStyle(
                        height: 5, fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SingleChildScrollView(
                child: Center(
                  heightFactor: 0.3,
                  widthFactor: 3,
                  child: Image(
                    image: AssetImage(PATH_BUTTON_MAIN_MENU),
                    height: 350,
                    width: 400,
                  ),
                ),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                heightFactor: 0.2,
                widthFactor: 8.5,
                child: Text(
                  'Settings',
                  style: TextStyle(
                      height: 5, fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SingleChildScrollView(
                child: Center(
                  heightFactor: 15.5,
                  widthFactor: 20,
                  child: Image(
                    image: AssetImage(PATH_SOUND),
                    height: 30,
                    width: 30,
                  ),
                ),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                heightFactor: 10.5,
                widthFactor: 20,
                child: Image(
                  image: AssetImage(PATH_SOUND),
                  height: 30,
                  width: 30,
                ),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                heightFactor: 8,
                widthFactor: 4,
                child: Image(
                  image: AssetImage(PATH_SETTINGS_BORDER),
                  height: 78,
                  width: 200,
                ),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                heightFactor: 11,
                widthFactor: 8,
                child: Image(
                  image: AssetImage(PATH_LOGO_APP),
                  height: 50,
                  width: 80,
                ),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                heightFactor: 20,
                widthFactor: 5.5,
                child: SettingsButton(
                    image: AssetImage(PATH_SETTINGS_BUTTON),
                    text: "Return to Main Menu",
                    onTap: () {
                      climateCalling.switchScreen(ScreenState.kMainMenu);
                    }),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                heightFactor: 6,
                widthFactor: 5.5,
                child: SizedBox(
                  height: 80,
                  width: 220,
                  child: Slider(
                      value: _value,
                      divisions: 10,
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
                ),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                heightFactor: 4,
                widthFactor: 5.5,
                child: SizedBox(
                  height: 80,
                  width: 220,
                  child: Slider(
                      value: _valuetwo,
                      divisions: 10,
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
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
