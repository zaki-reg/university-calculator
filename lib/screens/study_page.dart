import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uni_calculator_test/screens/settings_page.dart';

import '../constants.dart';

class ActivityGrid extends StatelessWidget {
  // Example activity data
  final Map<String, int> activityData = {
    "2024-12-01": 1,
    "2024-12-02": 2,
    "2024-12-03": 3,
    "2024-12-04": 4,
    "2024-12-05": 5,
    "2024-12-06": 6,
    "2024-12-07": 7,
    "2024-12-08": 8,
    "2024-12-09": 9,
    "2024-12-12": 3,
  };

  Color getColor(int activityCount) {
    if (activityCount > 7) return const Color.fromARGB(250, 48, 166, 60)!;
    if (activityCount > 6) return const Color.fromARGB(210, 46, 169, 60)!;
    if (activityCount > 5) return const Color.fromARGB(180, 48, 166, 60)!;
    if (activityCount > 4) return const Color.fromARGB(150, 48, 166, 60)!;
    if (activityCount > 3) return const Color.fromARGB(120, 48, 166, 60)!;
    if (activityCount > 2) return const Color.fromARGB(90, 48, 166, 60)!;
    if (activityCount > 1) return const Color.fromARGB(70, 48, 166, 60)!;
    if (activityCount > 0) return const Color.fromARGB(40, 48, 166, 60)!;
    return Colors.grey[300]!;
  }

  @override
  Widget build(BuildContext context) {
    // Generate dates for one month (for demo purposes)
    final now = DateTime.now();
    final startOfMonth = DateTime(now.year, now.month, 1);
    final daysInMonth = List.generate(
      DateTime(now.year, now.month + 1, 0).day,
      (i) => startOfMonth.add(Duration(days: i)),
    );

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
                  height: 30.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      'شبكة النشاط 📑',
                      style: arabicTextStyle.copyWith(
                          fontSize: 35, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 4,
                  runSpacing: 4,
                  children: daysInMonth.map((date) {
                    final dateStr =
                        "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
                    final activityCount = activityData[dateStr] ?? 0;

                    return Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: getColor(activityCount),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(
                  height: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          'قائمة المهام 🗓️',
                          style: arabicTextStyle.copyWith(
                              fontSize: 35, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {},
                              splashColor: darkGreen.withAlpha(30),
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                height: 80,
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: darkGreen, width: 2),
                                    borderRadius: BorderRadius.circular(20)),
                                child: const Icon(
                                  Icons.remove_circle_outline_outlined,
                                  color: darkGreen,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {},
                              splashColor: darkGreen.withAlpha(30),
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                height: 80,
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: darkGreen, width: 2),
                                    borderRadius: BorderRadius.circular(20)),
                                child: const Icon(
                                  Icons.grid_view_outlined,
                                  color: darkGreen,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Material(
                        color: limeGreen,
                        borderRadius: BorderRadius.circular(20),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(20),
                          onTap: () {},
                          splashColor: darkGreen.withAlpha(30),
                          child: Container(
                            height: 80,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              border: Border.all(color: darkGreen, width: 2),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Icon(Icons.add),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(color: darkGreen, width: 2),
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 24,
                                  height: 24,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: darkGreen, width: 2),
                                      borderRadius: BorderRadius.circular(40)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Container(
                                      width: 24,
                                      height: 24,
                                      decoration: BoxDecoration(
                                          color: limeGreen,
                                          border: Border.all(
                                              color: Colors.transparent,
                                              width: 0),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Complete hashing playlist.',
                                  style: textStyle.copyWith(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: darkGreen,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 24,
                                  height: 24,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: darkGreen, width: 2),
                                      borderRadius: BorderRadius.circular(40)),
                                  child: Container(
                                    width: 24,
                                    height: 24,
                                    decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        border: Border.all(
                                            color: Colors.transparent,
                                            width: 0),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Watch semi-conductors video.',
                                  style: textStyle.copyWith(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: darkGreen,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: darkGreen, width: 2),
                                  borderRadius: BorderRadius.circular(40)),
                              child: Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                    color: limeGreen,
                                    border: Border.all(
                                        color: Colors.transparent, width: 0),
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Commit 5 times to Github.',
                              style: textStyle.copyWith(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: darkGreen,
                                decoration: TextDecoration.lineThrough,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
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
