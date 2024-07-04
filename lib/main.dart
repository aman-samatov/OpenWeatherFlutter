import 'package:flutter/material.dart';
import 'package:open_weather/src/app/app.dart';
import 'package:timezone/data/latest.dart' as tz;

void main() {
  tz.initializeTimeZones();
  runApp(const FirstApp());
}
