import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import '../constants.dart';
import 'field_year.dart';

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
      backgroundColor: backgroundColor,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  textDirection: TextDirection.rtl,
                  children: [
                    // Top Card Section
                    Expanded(
                      child: Card(
                        margin: EdgeInsets.zero,
                        elevation: 0,
                        shape: const BeveledRectangleBorder(
                          side: BorderSide(width: 1, color: darkGreen),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                          ),
                        ),
                        color: limeGreen,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 30.0, horizontal: 20.0),
                          child: Center(
                            child: SvgPicture.asset(
                              'assets/vectors/logo.svg',
                              width: 180,
                              colorFilter: const ColorFilter.mode(
                                  darkGreen, BlendMode.srcATop),
                            ),
                          ),
                        ),
                      ),
                    ),

                    // Middle Section
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Welcome Text
                            Directionality(
                              textDirection: TextDirection.rtl,
                              child: RichText(
                                textAlign: TextAlign.right,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'مرحباً بك! ',
                                      style: arabicTextStyle.copyWith(
                                          color: limeGreen,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 45.0,
                                          height: 1.2),
                                    ),
                                    TextSpan(
                                      text: 'ما الإسم الكريم؟',
                                      // text: 'كي سمّاك الله؟',
                                      style: arabicTextStyle.copyWith(
                                          color: darkGreen,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 45.0,
                                          height: 1.2),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            const SizedBox(height: 10.0),

                            // Input Row
                            Row(
                              textDirection: TextDirection.rtl,
                              children: [
                                // Submit Button
                                InkWell(
                                  borderRadius: BorderRadius.circular(15.0),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            CustomDropdownButton(
                                          enteredText: controller.text,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    width: 60.0,
                                    height: 60.0,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: darkGreen, width: 2),
                                      borderRadius:
                                          BorderRadius.circular(15.0),
                                    ),
                                    child: const Icon(
                                      CupertinoIcons.arrow_turn_up_left,
                                      color: darkGreen,
                                    ),
                                  ),
                                ),

                                const SizedBox(width: 10),

                                // Text Input
                                Expanded(
                                  child: Container(
                                    height: 60.0,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: darkGreen, width: 2),
                                      borderRadius:
                                          BorderRadius.circular(15.0),
                                    ),
                                    child: Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: TextField(
                                        controller: controller,
                                        style: textStyle.copyWith(
                                          color: darkGreen,
                                          fontSize: 18.0,
                                        ),
                                        textAlign: TextAlign.right,
                                        textDirection: TextDirection.rtl,
                                        decoration: InputDecoration(
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 20.0),
                                          hintText: 'أدخِل اسمك هنا',
                                          hintStyle: arabicTextStyle.copyWith(
                                            color: Colors.grey,
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          border: InputBorder.none,
                                        ),
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.done,
                                        enableInteractiveSelection: true,
                                        autocorrect: false,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Bottom Section
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: Text(
                        'كل الحقوق محفوظة 2025©',
                        textDirection: TextDirection.rtl,
                        style: arabicTextStyle.copyWith(
                          fontSize: 15,
                          color: darkGreen,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
