import 'package:flutter/material.dart';
import 'package:uni_calculator_test/constants.dart';
import 'package:uni_calculator_test/screens/semester1.dart';
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
              side: const BorderSide(color: primaryBlue, width: 1.4)),
        ),
      ),
      home: const Scaffold(
        body: Welcome(),
      ),
    );
  }
}
