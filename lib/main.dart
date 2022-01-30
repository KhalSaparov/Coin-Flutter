import 'package:flutter/material.dart';
import 'price_screen.dart';
import 'constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(
          backgroundColor: kBackgroundColor,
        ),
        scaffoldBackgroundColor: kBackgroundColor,
      ),
      home: PriceScreen(),
    );
  }
}
