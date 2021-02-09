import 'package:climate_calling/shared/ScreenState.dart';
import 'package:climate_calling/shared/globals.dart';

void updateScreenState(ScreenState newState, {Function callback}) {
  screenState = newState;
  if (callback != null) callback();
}