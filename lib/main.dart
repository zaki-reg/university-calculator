import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uni_calculator_test/constants.dart';
import 'package:uni_calculator_test/screens/welcome.dart';

void main() {
  runApp(const ProviderScope(child: UniCal()));
}

class UniCal extends ConsumerWidget {
  const UniCal({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      theme: ThemeData(
        popupMenuTheme: PopupMenuThemeData(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: const BorderSide(color: darkGreen, width: 2)),
        ),
      ),
      home: const Scaffold(
        body: Welcome(),
        backgroundColor: backgroundColor,
      ),
    );
  }
}


// CustomShapeWidget(
//           edgeRadius: 30,
//           bigRectHeight: 380,
//           smallRectHeight: 280,
//           smallRectWidth: 120,
//         ),