import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uni_calculator_test/screens/home.dart';

import '../constants.dart';

class Userfieldyear extends StatelessWidget {
  final String enteredText;

  Userfieldyear({required this.enteredText, super.key});

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF000B2B),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: RichText(
                          text: TextSpan(
                            style: textStyle.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: 40.0,
                              height: 1,
                            ),
                            children: [
                              TextSpan(
                                text: 'Hello ',
                                style: textStyle.copyWith(
                                    color: whiteBlue,
                                    fontWeight: FontWeight
                                        .normal), // Replace with your WhiteBlue color
                              ),
                              TextSpan(
                                text: '$enteredText, ',
                                style: textStyle.copyWith(
                                    color: primaryBlue,
                                    fontWeight: FontWeight
                                        .normal), // Replace with your PrimaryBlue color
                              ),
                              TextSpan(
                                text: 'Whats your field of study? What year?',
                                style: textStyle.copyWith(
                                    color: whiteBlue,
                                    fontWeight: FontWeight
                                        .normal), // Replace with your WhiteBlue color
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          width: 200,
                          height: 60.0,
                          padding: const EdgeInsets.only(
                              left: 20, top: 5, bottom: 5),
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: primaryBlue, width: 1.4),
                              borderRadius: BorderRadius.circular(15.0)),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  HomePage(enteredText: enteredText),
                            ),
                          );
                        },
                        borderRadius: BorderRadius.circular(15.0),
                        splashColor: primaryBlue,
                        child: Container(
                          width: 60.0,
                          height: 60.0,
                          decoration: BoxDecoration(
                            border: Border.all(color: primaryBlue, width: 1.4),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: const Icon(
                            CupertinoIcons.arrow_turn_up_left,
                            color: primaryBlue,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// TextField(
// controller: _controller,
// style: textStyle.copyWith(
// color: whiteBlue, fontSize: 18.0),
// cursorColor: primaryBlue,
// keyboardType: TextInputType.number,
// decoration: InputDecoration(
// hintText: 'Enter you name',
// hintStyle: textStyle.copyWith(
// color: darkBlue, fontSize: 18.0),
// border: InputBorder.none,
// ),
// ),
