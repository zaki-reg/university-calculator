import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart' show SvgPicture;
import 'package:uni_calculator_test/custom_shape.dart';
import 'package:uni_calculator_test/providers/providers.dart';
import '../constants.dart';
import 'field_year.dart';

class Welcome extends ConsumerStatefulWidget {
  const Welcome({super.key});

  @override
  ConsumerState<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends ConsumerState<Welcome> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkGreen,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return IntrinsicHeight(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              textDirection: TextDirection.rtl,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 40.0),
                          child: SvgPicture.asset(
                            'assets/vectors/logo.svg',
                            width: 180,
                            colorFilter: const ColorFilter.mode(
                                limeGreen, BlendMode.srcATop),
                          ),
                        ),
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: RichText(
                            textAlign: TextAlign.right,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'مرحباً بك في ',
                                  style: arabicTextStyle.copyWith(
                                      color: limeGreen,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 45.0,
                                      height: 1.2),
                                ),
                                TextSpan(
                                  text: 'نقــــطة! ',
                                  style: arabicTextStyle.copyWith(
                                      color: brightYellow,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 45.0,
                                      height: 1.2),
                                ),
                                TextSpan(
                                  text: 'مــا إســـــــــمك؟',
                                  style: arabicTextStyle.copyWith(
                                    color: limeGreen,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 45.0,
                                    height: 1.2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 10.0),
                      ],
                    ),
                  ),
                ),
                Stack(
                  alignment: const AlignmentDirectional(0.0, -0.87),
                  children: [
                    Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: CustomPaint(
                            size: const Size(double.infinity, 350),
                            painter: CustomShapePainter(
                              edgeRadius: 20,
                              bigRectHeight: 350,
                              smallRectHeight: 235,
                              smallRectWidth: 110 + 25 - 10,
                            ),
                          ),
                        ),
                      ],
                    ),

                    // submit name button
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0, right: 15),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          // enter your name section
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 4.0),
                              child: Container(
                                height: 80.0,
                                decoration: BoxDecoration(
                                  color: darkGreen.withAlpha(80),
                                  border:
                                      Border.all(color: darkGreen, width: 2),
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: TextField(
                                    textAlignVertical:
                                        const TextAlignVertical(y: 0.5),
                                    controller: controller,
                                    style: arabicTextStyle.copyWith(
                                      color: darkGreen,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    textAlign: TextAlign.right,
                                    textDirection: TextDirection.rtl,
                                    decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 20.0),
                                      hintText: '"زكرياء رقيق"',
                                      hintStyle: arabicTextStyle.copyWith(
                                        color: Colors.black.withAlpha(80),
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w500,
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
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          InkWell(
                            borderRadius: BorderRadius.circular(15.0),
                            onTap: () {
                              ref.read(usernameProvider.notifier).state =
                                  controller.text;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CustomDropdownButton(
                                    enteredText: controller.text,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              width: 110.0,
                              height: 80.0,
                              decoration: BoxDecoration(
                                color: brightYellow,
                                border: Border.all(color: darkGreen, width: 2),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: const Icon(
                                CupertinoIcons.arrow_turn_up_left,
                                color: darkGreen,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                // all rights reserved section
                // Padding(
                //   padding: const EdgeInsets.only(bottom: 0.0),
                //   child: Text(
                //     'كل الحقوق محفوظة 2025©',
                //     textDirection: TextDirection.rtl,
                //     style: arabicTextStyle.copyWith(
                //         fontSize: 15,
                //         color: limeGreen,
                //         fontWeight: FontWeight.w500),
                //   ),
                // ),
              ],
            ),
          );
        },
      ),
    );
  }
}
