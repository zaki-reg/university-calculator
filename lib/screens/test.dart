import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTextInput extends StatefulWidget {
  @override
  _MyTextInputState createState() => _MyTextInputState();
}

class _MyTextInputState extends State<MyTextInput> {
  // Create a TextEditingController
  final TextEditingController myController = TextEditingController();

  @override
  void dispose() {
    // Dispose the controller when the widget is removed
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Text Field Example')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CupertinoTextField(
              placeholder: 'Enter your name',
              controller: myController,
            ),
          ],
        ),
      ),
    );
  }
}
