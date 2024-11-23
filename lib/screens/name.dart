import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uni_calculator_test/screens/field_year.dart';
import 'package:uni_calculator_test/screens/test.dart';

class Name extends StatefulWidget {
  @override
  State<Name> createState() => _NameState();
}

class _NameState extends State<Name> {
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
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(35.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                textDirection: TextDirection.ltr,
                'Hello there, tell us about yourself!',
                style: TextStyle(
                  fontFamily: 'Helvetica',
                  fontWeight: FontWeight.w500,
                  fontSize: 34.0,
                  height: 1,
                ),
                textAlign: TextAlign.left, // Center-aligns text
              ),
              SizedBox(
                height: 12,
              ),
              SizedBox(
                width: double.infinity, // Set your desired width
                height: 55, // Set your desired height
                child: CupertinoTextField(
                  keyboardType: TextInputType.text,
                  cursorColor: Colors.green,
                  cursorWidth: 2.0,
                  style: TextStyle(fontFamily: 'Helvetica', fontSize: 18),
                  textAlign: TextAlign.left,
                  padding: EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Color(0xFF000000), width: 1.4)),
                  placeholder: 'Enter your name',
                  controller: myController,
                ),
              ),

              SizedBox(height: 12), // Space between input and button
              InkWell(
                splashColor: Colors.green,
                borderRadius: BorderRadius.circular(10),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FieldYear()),
                  );

                  print('Name entered: ${myController.text}');
                },
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16), // Button padding
                  height: 55,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Color(0xFF000000), width: 1.4),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Continue',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Helvetica',
                        ),
                      ),
                      Icon(
                        Icons.keyboard_arrow_right_sharp,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
