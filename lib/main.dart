import 'package:flutter/material.dart';
import 'package:uni_calculator_test/screens/welcome.dart';

void main() {
  runApp(const UniCal());
}

class UniCal extends StatelessWidget {
  const UniCal({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Welcome(),
      ),
    );
  }
}
