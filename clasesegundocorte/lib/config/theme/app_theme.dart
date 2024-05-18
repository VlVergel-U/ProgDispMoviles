import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.red,
];

class AppTheme {
  final int selectedColor;
  final bool theme;

  AppTheme({this.selectedColor = 1, this.theme = false})
      : assert(selectedColor < colorList.length, 'Color no disponible'),
        assert(selectedColor >= 0, 'Color debe ser un número positivo');

  ThemeData getTheme() => ThemeData(
      useMaterial3: true,
      colorSchemeSeed: colorList[selectedColor],
      brightness: theme ? Brightness.dark : Brightness.light,
      appBarTheme: AppBarTheme(
        centerTitle: false,
        backgroundColor: colorList[selectedColor],
        titleTextStyle: const TextStyle(color: Colors.white),
      ));

  AppTheme copyWith({int? selectedColor, bool? theme}) => AppTheme(
      selectedColor: selectedColor ?? this.selectedColor,
      theme: theme ?? this.theme);
}
