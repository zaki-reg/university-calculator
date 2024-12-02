import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample data - replace with actual data from storage
    final List<AcademicYear> academicYears = [
      AcademicYear(
        year: "2023/2024",
        semesters: [
          SemesterHistory(
            name: "Semester 1",
            average: 14.75,
            modules: [
              ModuleHistory(name: "Mathematics", grade: 15.5),
              ModuleHistory(name: "Physics", grade: 14.0),
              ModuleHistory(name: "Computer Science", grade: 16.0),
            ],
          ),
          SemesterHistory(
            name: "Semester 2",
            average: 15.25,
            modules: [
              ModuleHistory(name: "Statistics", grade: 15.0),
              ModuleHistory(name: "Programming", grade: 16.5),
              ModuleHistory(name: "Networks", grade: 14.5),
            ],
          ),
        ],
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with back button
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1.4),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(Icons.arrow_back, size: 24),
                    ),
                  ),
                  const SizedBox(width: 15),
                  const Text(
                    'Academic History',
                    style: TextStyle(
                      fontFamily: 'Helvetica',
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Overall Progress Card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1.4),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.green, size: 24),
                        SizedBox(width: 8),
                        Text(
                          'Overall Progress',
                          style: TextStyle(
                            fontFamily: 'Helvetica',
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      '15.00',
                      style: TextStyle(
                        fontFamily: 'Helvetica',
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Academic Years List
              Expanded(
                child: ListView.builder(
                  itemCount: academicYears.length,
                  itemBuilder: (context, index) {
                    return _buildAcademicYearCard(academicYears[index]);
                  },
                ),
              ),

              // Export Button
              GestureDetector(
                onTap: () {
                  // Implement export functionality
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1.4),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.file_download, color: Colors.green),
                      SizedBox(width: 8),
                      Text(
                        'Export Results',
                        style: TextStyle(
                          fontFamily: 'Helvetica',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
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

  Widget _buildAcademicYearCard(AcademicYear year) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            year.year,
            style: const TextStyle(
              fontFamily: 'Helvetica',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ...year.semesters.map((semester) => Column(
              children: [
                _buildSemesterCard(semester),
                const SizedBox(height: 15),
              ],
            )),
      ],
    );
  }

  Widget _buildSemesterCard(SemesterHistory semester) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1.4),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                semester.name,
                style: const TextStyle(
                  fontFamily: 'Helvetica',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.green, width: 1),
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.green.withOpacity(0.1),
                ),
                child: Text(
                  semester.average.toStringAsFixed(2),
                  style: const TextStyle(
                    fontFamily: 'Helvetica',
                    fontSize: 14,
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          ...semester.modules.map((module) => Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      module.name,
                      style: const TextStyle(
                        fontFamily: 'Helvetica',
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      module.grade.toStringAsFixed(2),
                      style: const TextStyle(
                        fontFamily: 'Helvetica',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}

class AcademicYear {
  final String year;
  final List<SemesterHistory> semesters;

  AcademicYear({
    required this.year,
    required this.semesters,
  });
}

class SemesterHistory {
  final String name;
  final double average;
  final List<ModuleHistory> modules;

  SemesterHistory({
    required this.name,
    required this.average,
    required this.modules,
  });
}

class ModuleHistory {
  final String name;
  final double grade;

  ModuleHistory({
    required this.name,
    required this.grade,
  });
}
