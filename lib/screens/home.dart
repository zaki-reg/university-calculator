import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uni_calculator_test/screens/annual_calculator.dart';
import 'package:uni_calculator_test/screens/semester1.dart';
import 'package:uni_calculator_test/screens/semester2.dart';
import 'package:uni_calculator_test/screens/settings_page.dart';
import '../constants.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  final String enteredText;
  const HomePage({required this.enteredText, super.key});

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
              color: const Color(0xFF01124C),
              borderRadius: BorderRadius.circular(100),
            ),
            height: 65.0,
          ),
        ),
        Row(
          children: [
            _buildNavItem(
              index: 0,
              icon: 'assets/vectors/home.svg',
              label: 'Home',
              activeColor: primaryBlue,
              inactiveColor: primaryBlue,
            ),
            _buildNavItem(
              index: 1,
              icon: 'assets/vectors/study.svg',
              label: 'Study',
              activeColor: primaryBlue,
              inactiveColor: primaryBlue,
            ),
            _buildNavItem(
              index: 2,
              icon: 'assets/vectors/profile.svg',
              label: 'Profile',
              activeColor: primaryBlue,
              inactiveColor: primaryBlue,
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
            color: isSelected ? activeColor : const Color(0xFF01124C),
            borderRadius: BorderRadius.circular(100),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                icon,
                height: 17,
                colorFilter: ColorFilter.mode(
                    isSelected ? whiteBlue : inactiveColor, BlendMode.srcATop),
              ),
              const SizedBox(width: 3.0),
              Text(
                label,
                style: textStyle.copyWith(
                  color: isSelected ? whiteBlue : inactiveColor,
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
      backgroundColor: backgroundDarkBlue,
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
                            width: 100.0,
                            height: 50.0,
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: primaryBlue, width: 1.4),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  width: 16.0,
                                  'assets/vectors/home.svg',
                                  colorFilter: const ColorFilter.mode(
                                      primaryBlue, BlendMode.srcATop),
                                ),
                                const SizedBox(
                                  width: 5.0,
                                ),
                                Text(
                                  'Home',
                                  style: textStyle.copyWith(
                                      fontSize: 14.0, color: primaryBlue),
                                )
                              ],
                            ),
                          ),
                          // InkWell(
                          //   borderRadius: BorderRadius.circular(30),
                          //   onTap: () {
                          //     Navigator.push(
                          //       context,
                          //       MaterialPageRoute(
                          //           builder: (context) => const SettingsPage()),
                          //     );
                          //   },
                          //   child: Container(
                          //     padding: const EdgeInsets.all(12.0),
                          //     width: 50.0,
                          //     height: 50.0,
                          //     decoration: BoxDecoration(
                          //       border:
                          //           Border.all(color: primaryBlue, width: 1.4),
                          //       borderRadius: BorderRadius.circular(30),
                          //     ),
                          //     child: SvgPicture.asset(
                          //       'assets/vectors/settings.svg',
                          //       colorFilter: const ColorFilter.mode(
                          //           primaryBlue, BlendMode.srcATop),
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: [
                          Text(
                            'Hello, ',
                            style: textStyle.copyWith(
                                fontWeight: FontWeight.w500,
                                fontSize: 40.0,
                                color: whiteBlue),
                          ),
                          Text(
                            widget.enteredText,
                            style: textStyle.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 40.0,
                                color: primaryBlue),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: InkWell(
                              highlightColor: darkBlue,
                              splashColor: darkBlue,
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
                                  border: Border.all(
                                      color: primaryBlue, width: 1.4),
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
                                      color: primaryBlue,
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
                                          color: whiteBlue),
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
                              highlightColor: darkBlue,
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
                                  border: Border.all(
                                      color: primaryBlue, width: 1.4),
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
                                      color: primaryBlue,
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
                                          color: whiteBlue),
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
                        highlightColor: darkBlue,
                        splashColor: darkBlue,
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
                            border: Border.all(color: primaryBlue, width: 1.4),
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
                                color: primaryBlue,
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
                                          color: whiteBlue)),
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

                      InkWell(
                        borderRadius: BorderRadius.circular(30),
                        highlightColor: darkBlue,
                        splashColor: darkBlue,
                        onTap: () {},
                        child: CarouselSlider(
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
                                return Container(
                                    width: double.infinity,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 0.0),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: primaryBlue, width: 1.4),

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
                                              color: primaryBlue,
                                              Icons.video_library_rounded),
                                          Text(
                                            'Start Studying $i',
                                            style: textStyle.copyWith(
                                                fontSize: 28.0,
                                                color: whiteBlue,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ],
                                      ),
                                    ));
                              },
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                // _buildBottomNavBar(),
              ]),
        ),
      ),
    );
  }
}
