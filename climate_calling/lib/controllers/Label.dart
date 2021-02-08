import 'package:climate_calling/controllers/BaseWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Label extends BaseWidget {
  
  //Fields
  final double _xRatio, _yRatio;
  final String _text;

  TextPainter _painter;
  TextStyle _textStyle;

  Offset _position;

  //Constructor
  Label(this._text, this._xRatio, this._yRatio) {
    this._painter = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    this._textStyle = TextStyle(
      color: Colors.white,
      fontSize: 0,
    );

    this._painter.text = TextSpan(
        text: _text,
        style: _textStyle,
    );

    this._painter.layout();
    _position = Offset(0, 0);
  }
  
  //Overridden Methods
  @override
  void render(Canvas canvas){
    _painter.paint(canvas, _position);
  }

  @override
  void update(){}

  @override
  void resize(Size size){
    this._textStyle = TextStyle(
      color: Colors.white,
      fontSize: size.width * 0.1,
    );

    this._painter.text = TextSpan(
        text: _text,
        style: _textStyle
    );

    this._painter.layout();

    this._position = Offset(
      size.width * _xRatio - (_painter.width * _xRatio),
      size.height * _yRatio - (_painter.height * _yRatio),
    );
  }

  @override
  void onTapDown(TapDownDetails details, Function fn){
  }
}