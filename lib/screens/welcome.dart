import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uni_calculator_test/screens/home.dart';
import 'package:uni_calculator_test/screens/user_field_year.dart';
import '../constants.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF000B2B),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            children: [
              Expanded(
                child: Container(),
              ),
              Column(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    text: 'there! ',
                                    style: textStyle.copyWith(
                                        color: primaryBlue,
                                        fontWeight: FontWeight
                                            .normal), // Replace with your PrimaryBlue color
                                  ),
                                  TextSpan(
                                    text: 'Tell us about you!',
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
                                  border: Border.all(
                                      color: primaryBlue, width: 1.4),
                                  borderRadius: BorderRadius.circular(15.0)),
                              child: TextField(
                                controller: controller,
                                style: textStyle.copyWith(
                                    color: Colors.white, fontSize: 18.0),
                                cursorColor: Colors.blue,
                                decoration: InputDecoration(
                                  hintText: 'Enter your name',
                                  hintStyle: textStyle.copyWith(
                                      color: Colors.grey, fontSize: 18.0),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            borderRadius: BorderRadius.circular(15.0),
                            onTap: () {
                              String enteredText = controller.text;

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      Userfieldyear(enteredText: enteredText),
                                ),
                              );
                            },
                            splashColor: primaryBlue,
                            child: Container(
                              width: 60.0,
                              height: 60.0,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: primaryBlue, width: 1.4),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Icon(
                                CupertinoIcons.arrow_turn_up_left,
                                color: primaryBlue,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(),
                    Column(
                      children: [
                        Text(
                          'All rights reserved 2025©',
                          style: textStyle.copyWith(
                              fontSize: 15, color: primaryBlue),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
