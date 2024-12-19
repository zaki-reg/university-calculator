import 'package:flutter/material.dart';
import '../constants.dart';

class AnnualAveragePage extends StatefulWidget {
  const AnnualAveragePage({super.key});

  @override
  State<AnnualAveragePage> createState() => _AnnualAveragePageState();
}

class _AnnualAveragePageState extends State<AnnualAveragePage> {
  final List<Semester> semesters = [
    Semester("Semester 1", 0),
    Semester("Semester 2", 0),
  ];
  double annualAverage = 0.0;

  late List<TextEditingController> controllers;

  @override
  void initState() {
    super.initState();
    controllers = List.generate(semesters.length, (index) {
      return TextEditingController(
          text: semesters[index].average > 0
              ? semesters[index].average.toString()
              : '');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              InkWell(
                                borderRadius: BorderRadius.circular(30),
                                onTap: () => Navigator.pop(context),
                                child: Container(
                                  width: 100.0,
                                  height: 50.0,
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: limeGreen,
                                    border:
                                        Border.all(color: darkGreen, width: 2),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: const Icon(
                                    Icons.arrow_back,
                                    size: 24,
                                    color: darkGreen,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 15),
                              Text(
                                'Annual Average',
                                style: textStyle.copyWith(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w600,
                                    color: darkGreen),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                flex: 2,
                                child: Container(
                                  height: 120,
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    color: limeGreen,
                                    border:
                                        Border.all(color: darkGreen, width: 2),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Flexible(
                                        child: RichText(
                                            text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: 'You got: ',
                                              style: textStyle.copyWith(
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.normal,
                                                  color: darkGreen),
                                            ),
                                            TextSpan(
                                              text: annualAverage
                                                  .toStringAsFixed(2),
                                              style: textStyle.copyWith(
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.bold,
                                                  color: darkGreen),
                                            ),
                                          ],
                                        )),
                                      ),
                                      if (annualAverage > 0) ...[],
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                flex: 1,
                                child: Material(
                                  color: limeGreen,
                                  borderRadius: BorderRadius.circular(20),
                                  child: InkWell(
                                    onTap: () {},
                                    borderRadius: BorderRadius.circular(20),
                                    child: Container(
                                      height: 120,
                                      width: double.infinity,
                                      padding: const EdgeInsets.all(20),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: darkGreen, width: 2),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: const Icon(
                                        Icons.add,
                                        size: 40,
                                        color: darkGreen,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
                          Text(
                            'Custom Inputs',
                            style: textStyle.copyWith(
                                fontSize: 25,
                                fontWeight: FontWeight.w600,
                                color: darkGreen),
                          ),
                          const SizedBox(height: 10),
                          ...semesters.asMap().entries.map((entry) {
                            int index = entry.key;
                            Semester semester = entry.value;
                            return Column(
                              children: [
                                _buildSemesterCard(
                                    semester, controllers[index], index),
                                const SizedBox(height: 15),
                              ],
                            );
                          }),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Material(
                color: limeGreen,
                borderRadius: BorderRadius.circular(50),
                child: InkWell(
                  focusColor: limeGreen,
                  borderRadius: BorderRadius.circular(50),
                  onTap: _calculateAnnualAverage,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    decoration: BoxDecoration(
                      border: Border.all(color: darkGreen, width: 2),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.calculate_rounded,
                          color: darkGreen,
                          size: 25,
                        ),
                        const SizedBox(width: 2),
                        Text(
                          'Calculate',
                          style: textStyle.copyWith(
                              fontSize: 17,
                              color: darkGreen,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSemesterCard(
      Semester semester, TextEditingController controller, int index) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: limeGreen,
        border: Border.all(color: darkGreen, width: 2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 20,
                color: darkGreen,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                semester.name,
                style: textStyle.copyWith(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    color: darkGreen),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Container(
            height: 70,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: backgroundColor,
              border: Border.all(color: darkGreen, width: 2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: TextField(
              textAlignVertical: const TextAlignVertical(y: 1),
              cursorColor: limeGreen,
              controller: controller,
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  semester.average = double.tryParse(value) ?? 0;
                });
              },
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Enter average',
                hintStyle: textStyle.copyWith(
                    color: darkGreen.withAlpha(80), fontSize: 17),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
              ),
              style: textStyle.copyWith(
                  fontSize: 17, color: darkGreen, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }

  void _calculateAnnualAverage() {
    double total = 0;
    int count = 0;

    for (var semester in semesters) {
      if (semester.average > 0) {
        total += semester.average;
        count++;
      }
    }

    setState(() {
      annualAverage = count > 0 ? total / count : 0;
    });
  }

  // ignore: unused_element
  String _getStatusMessage(double average) {
    if (average >= 10) {
      return 'Passed Successfully! 🎉';
    } else {
      return 'Need to improve! 😔';
    }
  }

  // ignore: unused_element
  Color _getStatusColor(double average) {
    if (average >= 10) {
      return richPurple;
    } else {
      return Colors.red;
    }
  }
}

class Semester {
  final String name;
  double average;

  Semester(this.name, this.average);
}
