import 'package:flutter/material.dart';
import 'package:uni_calculator_test/screens/home.dart';

import '../constants.dart';

class CustomDropdownButton extends StatefulWidget {
  final String enteredText;

  const CustomDropdownButton({super.key, required this.enteredText});

  @override
  _CustomDropdownButtonState createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  String selectedField = "Choose your field";
  late String enteredText;
  bool isFieldSelected = false;
  bool isYearSelected = false;

  final Map<String, List<String>> fieldYears = {
    "Informatique ING": ["ing-1", "ing-2", "ing-3", "ing-4", "ing-5"],
    "Informatique LMD": ["lmd-1", "lmd-2", "lmd-3", "lmd-4", "lmd-5"],
    "Science Matière": ["sci-1", "sci-2", "sci-3", "sci-4", "sci-5"],
    "Mécanique": ["mech-1", "mech-2", "mech-3", "mech-4", "mech-5"],
    "Médecine": ["med-1", "med-2", "med-3", "med-4", "med-5"],
  };

  List<YearRow> additionalRows = [];
  bool hasAddedRow = false; // Control adding rows

  void addNewRow() {
    if (!hasAddedRow) {
      setState(() {
        additionalRows.add(
          YearRow(key: UniqueKey(), years: fieldYears[selectedField]!),
        );
        hasAddedRow = true; // Prevent further additions
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundDarkBlue,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
                      text: '${widget.enteredText}, ',
                      style: textStyle.copyWith(
                          color: primaryBlue,
                          fontWeight: FontWeight
                              .w500), // Replace with your WhiteBlue color
                    ),
                    TextSpan(
                      text: 'What is your',
                      style: textStyle.copyWith(
                          color: whiteBlue,
                          fontWeight: FontWeight
                              .normal), // Replace with your WhiteBlue color
                    ),
                    TextSpan(
                      text: ' speciality? ',
                      style: textStyle.copyWith(
                          color: primaryBlue,
                          fontWeight: FontWeight
                              .w500), // Replace with your WhiteBlue color
                    ),
                    TextSpan(
                      text: 'What ',
                      style: textStyle.copyWith(
                          color: whiteBlue,
                          fontWeight: FontWeight
                              .normal), // Replace with your PrimaryBlue color
                    ),
                    TextSpan(
                      text: 'Year?',
                      style: textStyle.copyWith(
                          color: primaryBlue,
                          fontWeight: FontWeight
                              .w500), // Replace with your WhiteBlue color
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    highlightColor: primaryBlue,
                    borderRadius: BorderRadius.circular(15.0),
                    onTap: () async {
                      final selected = await _showMenu(context);
                      if (selected != null) {
                        setState(() {
                          if (selectedField != selected) {
                            selectedField = selected;
                            isFieldSelected = true;
                            additionalRows.clear(); // Clear previous rows
                            hasAddedRow =
                                false; // Allow adding rows for the new field
                          }
                        });
                      }
                    },
                    child: Material(
                      color: Colors.transparent,
                      child: Container(
                        height: 60,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(color: primaryBlue, width: 1.4),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.arrow_drop_down_circle_outlined,
                                color: primaryBlue),
                            const SizedBox(width: 10),
                            Text(selectedField,
                                style: textStyle.copyWith(
                                    fontSize: 16, color: whiteBlue)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Material(
                  borderRadius: BorderRadius.circular(15.0),
                  color: isFieldSelected ? primaryBlue : Colors.transparent,
                  child: InkWell(
                    highlightColor: darkBlue,
                    borderRadius: BorderRadius.circular(15.0),
                    onTap: isFieldSelected ? addNewRow : null,
                    child: Container(
                      height: 60,
                      width: 70,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(color: primaryBlue, width: 1.4)),
                      child: const Center(
                        child: Icon(Icons.arrow_back, color: whiteBlue),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            ...additionalRows,
          ],
        ),
      ),
    );
  }

  Future<String?> _showMenu(BuildContext context) async {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var offset = renderBox.localToGlobal(Offset.zero);

    double top =
        offset.dy + renderBox.size.height; // Align just below the button
    double left = offset.dx;

    // Add a check to ensure that the left is within screen bounds (optional)
    double screenWidth = MediaQuery.of(context).size.width;
    if (left + renderBox.size.width > screenWidth) {
      left = screenWidth - renderBox.size.width;
    }

    return await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
          left, top, left + renderBox.size.width, top + renderBox.size.height),
      items: fieldYears.keys.map((field) {
        return PopupMenuItem(
          value: field,
          child: Text(
            field,
            style: textStyle.copyWith(fontSize: 15, color: whiteBlue),
          ),
        );
      }).toList(),
      color: Colors.transparent,
      elevation: 0,
    );
  }
}

class YearRow extends StatefulWidget {
  final List<String> years;

  const YearRow({super.key, required this.years});

  @override
  _YearRowState createState() => _YearRowState();
}

class _YearRowState extends State<YearRow> {
  String selectedYear = "Select Year";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              highlightColor: primaryBlue,
              borderRadius: BorderRadius.circular(15.0),
              onTap: () async {
                final selected = await _showYearMenu(context);
                if (selected != null) {
                  setState(() {
                    selectedYear = selected;
                  });
                }
              },
              child: Material(
                color: Colors.transparent,
                child: Container(
                  padding: const EdgeInsets.all(15.0),
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(color: primaryBlue, width: 1.4),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.arrow_drop_down_circle_outlined,
                        color: primaryBlue,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        selectedYear,
                        style:
                            textStyle.copyWith(color: whiteBlue, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Material(
            borderRadius: BorderRadius.circular(15.0),
            color: primaryBlue,
            child: InkWell(
              highlightColor: darkBlue,
              borderRadius: BorderRadius.circular(15.0),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(
                      selectedYear: selectedYear,
                      enteredText: enteredText,
                    ),
                  ),
                );
              },
              child: Container(
                height: 60,
                width: 70,
                decoration: BoxDecoration(
                    // color: isYearSelected ? primaryBlue : Colors.transparent,
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(color: primaryBlue, width: 1.4)),
                child: const Center(
                  child: Icon(Icons.check, color: whiteBlue),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<String?> _showYearMenu(BuildContext context) async {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var offset = renderBox.localToGlobal(Offset.zero);
    double top =
        offset.dy + renderBox.size.height + 5; // A bit more space for clarity
    double left = offset.dx;

    return await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
          left, top, left + renderBox.size.width, top + renderBox.size.height),
      items: widget.years.map((year) {
        return PopupMenuItem(
          value: year,
          child: Text(
            year,
            style: textStyle.copyWith(fontSize: 15, color: whiteBlue),
          ),
        );
      }).toList(),
      color: Colors.transparent,
      elevation: 0,
    );
  }
}
