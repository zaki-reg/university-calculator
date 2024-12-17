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

  // Initialize the TextEditingController list for each semester
  late List<TextEditingController> controllers;

  @override
  void initState() {
    super.initState();
    // Initialize controllers for each semester
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
                          // Header with back button
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () => Navigator.pop(context),
                                child: Container(
                                  width: 100.0,
                                  height: 50.0,
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(color: limeGreen, width: 2),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: const Icon(
                                    Icons.arrow_back,
                                    size: 24,
                                    color: limeGreen,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 15),
                              Text(
                                'Annual Average',
                                style: textStyle.copyWith(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w600,
                                    color: limeGreen),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),

                          // Annual Average Display
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              border: Border.all(color: limeGreen, width: 2),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Icon(Icons.calculate_rounded,
                                        color: limeGreen, size: 24),
                                    const SizedBox(width: 2),
                                    Text(
                                      'Annual Average',
                                      style: textStyle.copyWith(
                                          fontSize: 16, color: highlightWhite),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Text(annualAverage.toStringAsFixed(2),
                                    style: textStyle.copyWith(
                                        fontSize: 40,
                                        fontWeight: FontWeight.bold,
                                        color: limeGreen)),
                                if (annualAverage > 0) ...[
                                  const SizedBox(height: 10),
                                  Text(
                                    _getStatusMessage(annualAverage),
                                    style: textStyle.copyWith(
                                      fontSize: 16,
                                      color: _getStatusColor(annualAverage),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          ),
                          const SizedBox(height: 30),

                          // Semester Inputs
                          Text(
                            'Enter Semester Averages',
                            style: textStyle.copyWith(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: highlightWhite),
                          ),
                          const SizedBox(height: 15),

                          // Semester Cards
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
              InkWell(
                focusColor: limeGreen,
                borderRadius: BorderRadius.circular(50),
                onTap: _calculateAnnualAverage,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                    border: Border.all(color: limeGreen, width: 2),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.calculate_rounded,
                        color: limeGreen,
                        size: 25,
                      ),
                      const SizedBox(width: 2),
                      Text(
                        'Calculate',
                        style: textStyle.copyWith(
                            fontSize: 17,
                            color: limeGreen,
                            fontWeight: FontWeight.w600),
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

  Widget _buildSemesterCard(
      Semester semester, TextEditingController controller, int index) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(color: limeGreen, width: 2),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            semester.name,
            style: textStyle.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: highlightWhite),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              border: Border.all(color: darkGreen, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
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
                hintStyle: textStyle.copyWith(color: darkGreen),
                contentPadding: const EdgeInsets.symmetric(vertical: 8),
              ),
              style: textStyle.copyWith(fontSize: 16, color: highlightWhite),
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

  String _getStatusMessage(double average) {
    if (average >= 10) {
      return 'Passed Successfully! 🎉';
    } else {
      return 'Need to improve! 😔';
    }
  }

  Color _getStatusColor(double average) {
    if (average >= 10) {
      return Colors.green;
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
