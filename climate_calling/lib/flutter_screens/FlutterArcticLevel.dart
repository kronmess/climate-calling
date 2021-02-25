import 'package:climate_calling/shared/constants.dart';
import "package:flutter/material.dart";

class FlutterArcticLevelScreen extends StatefulWidget {
  @override
  _FlutterArcticLevelScreenState createState() => _FlutterArcticLevelScreenState();
  }

class _FlutterArcticLevelScreenState extends State<FlutterArcticLevelScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Spacer(),
        Row(
          children: [
            SizedBox(width: 48),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    SizedBox(width: 50),
                    GestureDetector(
                    child: Container(
                      height: 48,
                      width: 48,
                      color: Color(0xffffffff),
                      child: Center(
                        child: Image.asset(PATH_BUTTON_MOTION_UP),
                      ),
                    ),
                    onPanDown: (DragDownDetails d) {},
                    onPanEnd: (DragEndDetails d) {},
                  ),
                    SizedBox(width: 50),
                ],
                ),
                Row(
                  children: [
                  GestureDetector(
                    child: Container(
                      height: 48,
                      width: 48,
                      color: Color(0xffffffff),
                      child: Center(
                        child: Image.asset(PATH_BUTTON_MOTION_LEFT),
                      ),
                    ),
                    onPanDown: (DragDownDetails d) {},
                    onPanEnd: (DragEndDetails d) {},
                  ),
                  SizedBox(width: 50),
                  GestureDetector(
                    child: Container(
                      height: 48,
                      width: 48,
                      color: Color(0xffffffff),
                      child: Center(
                        child: Image.asset(PATH_BUTTON_MOTION_RIGHT),
                      ),
                    ),
                    onPanDown: (DragDownDetails d) {},
                    onPanEnd: (DragEndDetails d) {},
                  ),
                ],
                ),
                Row(
                  children: [
                    SizedBox(width: 50),
                    SizedBox(width: 48),
                    SizedBox(width: 50),
                  ],)
              ],
            ),
            Spacer(),//middle space
            Center(
              child: GestureDetector(
                child: Container(
                  height: 64,
                  width: 64,
                  color: Color(0xffffffff),
                  child: Center(
                    child: Image.asset(PATH_BUTTON_PICKUP),
                  ),
                ),
                onTap: () {},
              ),
            ),//space for pick up button
            SizedBox(width: 48),//space for right of button
          ],),
          SizedBox(height:18,)
      ],
      );
  }
}