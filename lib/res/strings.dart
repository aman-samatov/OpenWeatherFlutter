
import 'package:flutter/cupertino.dart';

class StringConstants extends InheritedWidget {
  static StringConstants of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<StringConstants>();

  const StringConstants({required Widget child, required Key key})
      : super(key: key, child: child);

  final String maxTemp = 'Макс. температура';
  final String minTemp = 'Мин. температура';
  final String pressure = 'Давление';
  final String humidity = 'Влажность';
  final String buttonTitle = 'Подробнее';
  final String degrees = '°C';

  @override
  bool updateShouldNotify(StringConstants oldWidget) => false;
}
