import 'package:flutter/material.dart';
import 'package:uni_calculator_test/screens/settings_page.dart';

import '../constants.dart';

class ActivityGrid extends StatelessWidget {
  // Example activity data

  ActivityGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            width: 70.0,
                            height: 50.0,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: limeGreen,
                              border: Border.all(color: darkGreen, width: 2),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: const Icon(
                              Icons.arrow_back,
                              size: 24,
                              color: darkGreen,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Container(
                          width: 120.0,
                          height: 50.0,
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          decoration: BoxDecoration(
                            color: limeGreen,
                            border: Border.all(color: darkGreen, width: 2),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.library_books_outlined,
                                color: darkGreen,
                                size: 20,
                              ),
                              const SizedBox(
                                width: 2.0,
                              ),
                              Text(
                                'دراسة',
                                style: arabicTextStyle.copyWith(
                                    fontSize: 14.0,
                                    color: darkGreen,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(30),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SettingsPage()),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(12.0),
                        width: 50.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: limeGreen,
                          border: Border.all(color: darkGreen, width: 2),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Icon(
                          Icons.settings_rounded,
                          color: darkGreen,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 70,
                      height: 40,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(20),
                        onTap: () {},
                        splashColor: darkGreen.withAlpha(30),
                        child: const Icon(
                          Icons.arrow_back_ios,
                          color: darkGreen,
                          size: 20,
                        ),
                      ),
                    ),
                    Text(
                      textAlign: TextAlign.right,
                      textDirection: TextDirection.rtl,
                      'المراجع الدراسية 📕',
                      style: arabicTextStyle.copyWith(
                          fontSize: 35, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Column(
                    children: [
                      Material(
                        borderRadius: BorderRadius.circular(20),
                        color: limeGreen,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(20),
                          onTap: () {},
                          splashColor: darkGreen.withAlpha(30),
                          child: Container(
                            width: double.infinity,
                            height: 80,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              border: Border.all(color: darkGreen, width: 2),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.videocam_rounded,
                                        size: 25,
                                        color: darkGreen,
                                      ),
                                      const SizedBox(
                                        width: 7,
                                      ),
                                      Text(
                                        'خوارزميات وبنية المعلومات',
                                        style: arabicTextStyle.copyWith(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500,
                                            color: darkGreen),
                                      ),
                                    ],
                                  ),
                                  const Icon(
                                    Icons.arrow_back_ios,
                                    size: 20,
                                    color: darkGreen,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Material(
                        borderRadius: BorderRadius.circular(20),
                        color: limeGreen,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(20),
                          onTap: () {},
                          splashColor: darkGreen.withAlpha(30),
                          child: Container(
                            width: double.infinity,
                            height: 80,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              border: Border.all(color: darkGreen, width: 2),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.videocam_rounded,
                                        size: 25,
                                        color: darkGreen,
                                      ),
                                      const SizedBox(
                                        width: 7,
                                      ),
                                      Text(
                                        'أساسيات لغة سي من الصفر',
                                        style: arabicTextStyle.copyWith(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500,
                                            color: darkGreen),
                                      ),
                                    ],
                                  ),
                                  const Icon(
                                    Icons.arrow_back_ios,
                                    size: 20,
                                    color: darkGreen,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Material(
                        borderRadius: BorderRadius.circular(20),
                        color: limeGreen,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(20),
                          onTap: () {},
                          splashColor: darkGreen.withAlpha(30),
                          child: Container(
                            width: double.infinity,
                            height: 80,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              border: Border.all(color: darkGreen, width: 2),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.videocam_rounded,
                                        size: 25,
                                        color: darkGreen,
                                      ),
                                      const SizedBox(
                                        width: 7,
                                      ),
                                      Text(
                                        'كالكيلس 3 بالكامل',
                                        style: arabicTextStyle.copyWith(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500,
                                            color: darkGreen),
                                      ),
                                    ],
                                  ),
                                  const Icon(
                                    Icons.arrow_back_ios,
                                    size: 20,
                                    color: darkGreen,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
