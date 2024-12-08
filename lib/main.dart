import 'package:flutter/material.dart';
import 'package:uni_calculator_test/screens/field_year.dart';
import 'package:uni_calculator_test/screens/welcome.dart';

void main() {
  runApp(const UniCal());
}

class UniCal extends StatelessWidget {
  const UniCal({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        popupMenuTheme: PopupMenuThemeData(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: const BorderSide(color: Colors.black, width: 1.4)),
        ),
      ),
      home: const Scaffold(
        body: Welcome(),
      ),
    );
  }
}
