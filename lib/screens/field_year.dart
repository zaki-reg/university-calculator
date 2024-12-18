import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
  bool hasAddedRow = false;

  void addNewRow() {
    if (!hasAddedRow) {
      setState(() {
        additionalRows.add(
          YearRow(key: UniqueKey(), years: fieldYears[selectedField]!),
        );
        hasAddedRow = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkGreen,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          textDirection: TextDirection.rtl,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40.0),
              child: SvgPicture.asset(
                'assets/vectors/logo.svg',
                width: 180,
                colorFilter:
                    const ColorFilter.mode(limeGreen, BlendMode.srcATop),
              ),
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: RichText(
                textAlign: TextAlign.right,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'أهلا ',
                      style: arabicTextStyle.copyWith(
                          color: limeGreen,
                          fontWeight: FontWeight.normal,
                          fontSize: 45.0,
                          height: 1.2),
                    ),
                    TextSpan(
                      text: widget.enteredText + ', ',
                      style: arabicTextStyle.copyWith(
                          color: brightYellow,
                          fontWeight: FontWeight.w500,
                          fontSize: 45.0,
                          height: 1.2),
                    ),
                    TextSpan(
                      text: 'اختر',
                      style: arabicTextStyle.copyWith(
                        color: limeGreen,
                        fontWeight: FontWeight.w500,
                        fontSize: 45.0,
                        height: 1.2,
                      ),
                    ),
                    TextSpan(
                      text: ' تخصصك, ',
                      style: arabicTextStyle.copyWith(
                        color: brightYellow,
                        fontWeight: FontWeight.w500,
                        fontSize: 45.0,
                        height: 1.2,
                      ),
                    ),
                    TextSpan(
                      text: 'والسنة الجارية.',
                      style: arabicTextStyle.copyWith(
                        color: brightYellow,
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
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    highlightColor: limeGreen,
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
                        height: 80,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(color: limeGreen, width: 2),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.arrow_drop_down_circle_outlined,
                                color: limeGreen),
                            const SizedBox(width: 15),
                            Text(
                              selectedField,
                              style: textStyle.copyWith(
                                fontSize: 18,
                                color: limeGreen,
                              ),
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
                  color: isFieldSelected ? limeGreen : Colors.transparent,
                  child: InkWell(
                    highlightColor: darkGreen,
                    borderRadius: BorderRadius.circular(15.0),
                    onTap: isFieldSelected ? addNewRow : null,
                    child: Container(
                      height: 80,
                      width: 110,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(color: limeGreen, width: 2)),
                      child: const Center(
                        child: Icon(Icons.arrow_back, color: limeGreen),
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
            style: textStyle.copyWith(fontSize: 15, color: darkGreen),
          ),
        );
      }).toList(),
      color: limeGreen,
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
              highlightColor: limeGreen,
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
                    border: Border.all(color: darkGreen, width: 2),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.arrow_drop_down_circle_outlined,
                        color: darkGreen,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        selectedYear,
                        style: textStyle.copyWith(
                            color: darkGreen,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
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
            color: limeGreen,
            child: InkWell(
              highlightColor: darkGreen,
              borderRadius: BorderRadius.circular(15.0),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(
                      selectedYear: selectedYear,
                      // enteredText: enteredText,
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
                    border: Border.all(color: darkGreen, width: 2)),
                child: const Center(
                  child: Icon(Icons.check, color: darkGreen),
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
            style: textStyle.copyWith(fontSize: 15, color: darkGreen),
          ),
        );
      }).toList(),
      color: limeGreen,
      elevation: 0,
    );
  }
}
