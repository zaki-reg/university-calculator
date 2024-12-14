import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uni_calculator_test/screens/annual_calculator.dart';
import 'package:uni_calculator_test/screens/semester1.dart';
import 'package:uni_calculator_test/screens/semester2.dart';
import 'package:uni_calculator_test/screens/settings_page.dart';
import '../constants.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  // final String enteredText;
  final String selectedYear;

  const HomePage({
    super.key,
    // required this.enteredText,
    required this.selectedYear,
  });

  @override
  State<HomePage> createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  int _selectedNavIndex = 0;
  void _onNavItemTapped(int index) {
    setState(() {
      _selectedNavIndex = index;
    });
  }

  Widget _buildBottomNavBar() {
    return Stack(
      children: [
        Expanded(
          flex: 3,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: darkGreen, width: 2),
              color: darkGreen,
              borderRadius: BorderRadius.circular(20),
            ),
            height: 65.0,
          ),
        ),
        Row(
          children: [
            _buildNavItem(
              index: 0,
              icon: 'assets/vectors/home.svg',
              label: 'الرئيسية',
              activeColor: limeGreen,
              inactiveColor: limeGreen.withOpacity(0.5),
            ),
            _buildNavItem(
              index: 1,
              icon: 'assets/vectors/study.svg',
              label: 'دراسة',
              activeColor: limeGreen,
              inactiveColor: limeGreen.withOpacity(0.5),
            ),
            _buildNavItem(
              index: 2,
              icon: 'assets/vectors/profile.svg',
              label: 'الحساب',
              activeColor: limeGreen,
              inactiveColor: limeGreen.withOpacity(0.5),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildNavItem({
    required int index,
    required String icon,
    required String label,
    required Color activeColor,
    required Color inactiveColor,
  }) {
    bool isSelected = _selectedNavIndex == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => _onNavItemTapped(index),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 120),
          curve: Curves.easeInOutQuad,
          width: 150,
          height: 65.0,
          decoration: BoxDecoration(
            color: isSelected ? limeGreen : Colors.transparent,
            border: Border.all(
              width: 1.4,
              color: isSelected ? darkGreen : Colors.transparent,
            ),
            // color: isSelected ? activeColor : const Color(0xFF01124C),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                icon,
                height: 17,
                colorFilter: ColorFilter.mode(
                    isSelected ? darkGreen : limeGreen, BlendMode.srcATop),
              ),
              const SizedBox(width: 3.0),
              Text(
                label,
                style: arabicTextStyle.copyWith(
                  color: isSelected ? darkGreen : limeGreen,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 170.0,
                            height: 50.0,
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
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
                                  Icons.home_rounded,
                                  color: darkGreen,
                                  size: 20,
                                ),
                                const SizedBox(
                                  width: 2.0,
                                ),
                                Text(
                                  'الصفحة الرئيسية',
                                  style: arabicTextStyle.copyWith(
                                      fontSize: 14.0,
                                      color: darkGreen,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
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
                        height: 30.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Flexible(
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: RichText(
                                textDirection: TextDirection.rtl,
                                text: TextSpan(
                                  style: textStyle.copyWith(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 40.0,
                                    height: 1,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: 'أهلا ',
                                      style: arabicTextStyle.copyWith(
                                          color: darkGreen,
                                          fontWeight: FontWeight
                                              .normal), // Replace with your WhiteBlue color
                                    ),
                                    TextSpan(
                                      text: widget.selectedYear,
                                      style: arabicTextStyle.copyWith(
                                          color: darkGreen,
                                          fontWeight: FontWeight
                                              .w600), // Replace with your WhiteBlue color
                                    ),
                                    TextSpan(
                                      text: ' 👋',
                                      style: arabicTextStyle.copyWith(
                                          fontWeight: FontWeight
                                              .w500), // Replace with your WhiteBlue color
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: InkWell(
                              highlightColor: darkGreen,
                              splashColor: darkGreen,
                              borderRadius: BorderRadius.circular(30.0),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const Semester1CalculatorPage()),
                                );
                              },
                              child: Container(
                                padding: const EdgeInsets.all(25.0),
                                decoration: BoxDecoration(
                                  color: limeGreen,
                                  border:
                                      Border.all(color: darkGreen, width: 2),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                height: 150.0,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Icon(
                                      size: 40.0,
                                      Icons.calculate_rounded,
                                      color: darkGreen,
                                    ),
                                    const SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                      'Semester 1 Average',
                                      style: textStyle.copyWith(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 23.0,
                                          height: 1,
                                          color: darkGreen),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: InkWell(
                              highlightColor: darkGreen,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const Semester2CalculatorPage()),
                                );
                              },
                              borderRadius: BorderRadius.circular(30.0),
                              child: Container(
                                padding: const EdgeInsets.all(25.0),
                                decoration: BoxDecoration(
                                  color: limeGreen,
                                  border:
                                      Border.all(color: darkGreen, width: 2),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                height: 150.0,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Icon(
                                      size: 40.0,
                                      Icons.calculate_rounded,
                                      color: darkGreen,
                                    ),
                                    const SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                      'Semester 2 Average',
                                      style: textStyle.copyWith(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 23.0,
                                          height: 1,
                                          color: darkGreen),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      InkWell(
                        borderRadius: BorderRadius.circular(30.0),
                        highlightColor: darkGreen,
                        splashColor: darkGreen,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const AnnualAveragePage()),
                          );
                        },
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(25.0),
                          decoration: BoxDecoration(
                            color: limeGreen,
                            border: Border.all(color: darkGreen, width: 2),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          height: 150.0,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(
                                size: 40.0,
                                Icons.calculate_rounded,
                                color: darkGreen,
                              ),
                              const SizedBox(
                                height: 5.0,
                              ),
                              Flexible(
                                child: RichText(
                                  text: TextSpan(
                                      text: 'Annual Average Calculator',
                                      style: textStyle.copyWith(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 28,
                                          height: 1,
                                          color: darkGreen)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      // InkWell(
                      //   borderRadius: BorderRadius.circular(30.0),
                      //   splashColor: darkBlue,
                      //   onTap: () {
                      //     Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //           builder: (context) => const AnnualAveragePage()),
                      //     );
                      //   },
                      //   child: Container(
                      //     width: double.infinity,
                      //     padding: const EdgeInsets.all(25.0),
                      //     decoration: BoxDecoration(
                      //       color: primaryBlue,
                      //       borderRadius: BorderRadius.circular(30),
                      //     ),
                      //     height: 150.0,
                      //     child: Column(
                      //       mainAxisAlignment: MainAxisAlignment.end,
                      //       crossAxisAlignment: CrossAxisAlignment.start,
                      //       children: [
                      //         Text(
                      //           'Start Studying Now!',
                      //           style: textStyle.copyWith(
                      //               fontWeight: FontWeight.w500,
                      //               fontSize: 25.0,
                      //               height: 1,
                      //               color: darkBlue),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),

                      CarouselSlider(
                        options: CarouselOptions(
                          height: 150.0,
                          aspectRatio: 16 / 9,
                          viewportFraction: 1,
                          autoPlay: true,
                          enlargeCenterPage: true,
                          enlargeFactor: 0.2,
                        ),
                        items: [1, 2, 3, 4, 5].map((i) {
                          return Builder(
                            builder: (BuildContext context) {
                              return InkWell(
                                borderRadius: BorderRadius.circular(30),
                                highlightColor: darkGreen,
                                splashColor: darkGreen,
                                onTap: () {},
                                child: Container(
                                    width: double.infinity,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 0.0),
                                    decoration: BoxDecoration(
                                      color: limeGreen,
                                      border: Border.all(
                                          color: darkGreen, width: 2),

                                      // color: primaryBlue,
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(25.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Icon(
                                              size: 40.0,
                                              color: darkGreen,
                                              Icons.video_library_rounded),
                                          Text(
                                            'Start Studying $i',
                                            style: textStyle.copyWith(
                                                fontSize: 28.0,
                                                color: darkGreen,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ],
                                      ),
                                    )),
                              );
                            },
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                _buildBottomNavBar(),
              ]),
        ),
      ),
    );
  }
}
