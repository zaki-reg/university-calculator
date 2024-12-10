import 'package:flutter/material.dart';
import '../module_calculator.dart';
import 'package:uni_calculator_test/constants.dart';

class Semester1CalculatorPage extends StatefulWidget {
  const Semester1CalculatorPage({super.key});

  @override
  State<Semester1CalculatorPage> createState() =>
      _Semester1CalculatorPageState();
}

class _Semester1CalculatorPageState extends State<Semester1CalculatorPage> {
  final List<Module> modules = [];
  double semesterAverage = 0.0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    for (var module in modules) {
      module.dispose();
    }
    super.dispose();
  }

  // setstate for keep track of the selected year
  void _onYearSelected(String year) {
    setState(() {
      selectedYear = year;
      modules = presets[year] ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundDarkBlue,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      width: 100.0,
                      height: 50.0,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: Border.all(color: primaryBlue, width: 1.4),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Icon(
                        Icons.arrow_back,
                        size: 24,
                        color: primaryBlue,
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Text(
                    'Semester 1',
                    style: textStyle.copyWith(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        color: primaryBlue),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      height: 105.0,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        border: Border.all(color: primaryBlue, width: 1.4),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Semester Average',
                            style: textStyle.copyWith(
                                fontSize: 14, color: whiteBlue),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            semesterAverage.toStringAsFixed(2),
                            style: textStyle.copyWith(
                                fontSize: 32,
                                fontWeight: FontWeight.w600,
                                color: primaryBlue),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        _showPresetDropdown(context);
                      },
                      child: Container(
                        height: 105.0,
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          border: Border.all(color: primaryBlue, width: 1.4),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Select a preset',
                              style: textStyle.copyWith(
                                  fontSize: 14, color: whiteBlue),
                            ),
                            const SizedBox(
                              height: 3.0,
                            ),
                            const SizedBox(height: 4),
                            const Icon(
                              Icons.tune_rounded,
                              size: 40.0,
                              color: primaryBlue,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Modules List
              Expanded(
                child: ListView.builder(
                  itemCount: modules.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        _buildModuleCard(modules[index], index),
                        const SizedBox(height: 15),
                      ],
                    );
                  },
                ),
              ),

              // Add Module Button
              InkWell(
                focusColor: primaryBlue,
                borderRadius: BorderRadius.circular(50),
                onTap: _showAddModuleDialog,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                    border: Border.all(color: primaryBlue, width: 1.4),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.add,
                        color: primaryBlue,
                        size: 25,
                      ),
                      const SizedBox(width: 2),
                      Text(
                        'Add Module',
                        style: textStyle.copyWith(
                            fontSize: 17,
                            color: primaryBlue,
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

  Widget _buildModuleCard(Module module, int index) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(color: primaryBlue, width: 1.4),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                module.name,
                style: textStyle.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: whiteBlue),
              ),
              InkWell(
                borderRadius: BorderRadius.circular(10.0),
                highlightColor: Colors.black,
                // splashColor: Colors.red,
                onTap: () => _deleteModule(module),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0x52F41D1D),
                    border: Border.all(color: Colors.black, width: 1.4),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: const Icon(Icons.delete_outline, color: Colors.red),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              _buildGradeInput('TD', module.tdController),
              const SizedBox(width: 10),
              _buildGradeInput('TP', module.tpController),
              const SizedBox(width: 10),
              _buildGradeInput('Exam', module.examController),
              const SizedBox(width: 10),
              _buildGradeInput('Coef', module.coefficientController),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildGradeInput(String label, TextEditingController controller) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: textStyle.copyWith(fontSize: 14, color: whiteBlue),
          ),
          const SizedBox(height: 4),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              border: Border.all(color: primaryBlue, width: 1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextField(
              style: textStyle.copyWith(color: whiteBlue),
              cursorColor: primaryBlue,
              controller: controller,
              keyboardType: TextInputType.number,
              onChanged: (_) => _calculateAverage(),
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showAddModuleDialog() {
    // Initialize variables outside the builder
    String moduleName = '';
    double coefficient = 1.0;
    double examRatio = 0.6;
    double tdTpRatio = 0.4;
    bool isTdTp = false; // Start with false

    showDialog(
      barrierColor: const Color(0x50000000),
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter dialogSetState) {
            return AlertDialog(
              clipBehavior: Clip.antiAlias,
              backgroundColor: const Color(0xF0000F40),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              title: Text(
                'Add Module',
                style: textStyle.copyWith(color: primaryBlue),
              ),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      cursorColor: primaryBlue,
                      style: textStyle.copyWith(color: whiteBlue),
                      onChanged: (value) {
                        moduleName = value;
                      },
                      decoration: InputDecoration(
                        labelText: 'Module Name',
                        labelStyle:
                            textStyle.copyWith(color: const Color(0xFF285efe)),
                        floatingLabelStyle:
                            textStyle.copyWith(color: primaryBlue),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: const BorderSide(
                                color: primaryBlue, width: 1.4)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: const BorderSide(
                                color: primaryBlue, width: 1.4)),
                      ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    TextField(
                      cursorColor: primaryBlue,
                      style: textStyle.copyWith(color: whiteBlue),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        coefficient = double.tryParse(value) ?? 1.0;
                      },
                      decoration: InputDecoration(
                        labelText: 'Coefficient',
                        labelStyle:
                            textStyle.copyWith(color: const Color(0xFF0C37CD)),
                        floatingLabelStyle:
                            textStyle.copyWith(color: primaryBlue),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: const BorderSide(
                                color: primaryBlue, width: 1.4)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(
                                color: primaryBlue, width: 1.4)),
                      ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    TextField(
                      cursorColor: primaryBlue,
                      style: textStyle.copyWith(color: whiteBlue),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        examRatio = double.tryParse(value) ?? 0.6;
                      },
                      decoration: InputDecoration(
                        labelText: 'Exam Ratio',
                        hintText: 'Example: 0.6',
                        hintStyle: TextStyle(
                            fontFamily: 'Helvetica',
                            fontSize: 15,
                            color: Colors.grey[400]),
                        labelStyle:
                            textStyle.copyWith(color: const Color(0xFF0C37CD)),
                        floatingLabelStyle:
                            textStyle.copyWith(color: primaryBlue),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: const BorderSide(
                                color: primaryBlue, width: 1.4)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: const BorderSide(
                                color: primaryBlue, width: 1.4)),
                      ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    TextField(
                      cursorColor: primaryBlue,
                      style: textStyle.copyWith(color: whiteBlue),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        tdTpRatio = double.tryParse(value) ?? 0.4;
                      },
                      decoration: InputDecoration(
                        labelText: 'TD/TP Ratio',
                        hintText: 'Example: 0.4',
                        hintStyle: TextStyle(
                            fontFamily: 'Helvetica',
                            fontSize: 15,
                            color: Colors.grey[400]),
                        labelStyle:
                            textStyle.copyWith(color: const Color(0xFF0C37CD)),
                        floatingLabelStyle:
                            textStyle.copyWith(color: primaryBlue),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: const BorderSide(
                                color: primaryBlue, width: 1.4)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: const BorderSide(
                                color: primaryBlue, width: 1.4)),
                      ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Container(
                      height: 56,
                      padding: const EdgeInsets.symmetric(horizontal: 14.5),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(color: primaryBlue, width: 1.4),
                          borderRadius: BorderRadius.circular(15.0)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Has both TD/TP?',
                            style: textStyle.copyWith(
                                fontSize: 15.0, color: const Color(0xFF0C37CD)),
                          ),
                          Switch(
                            value: isTdTp, // Use the external variable
                            onChanged: (bool value) {
                              // Use dialogSetState to update the local variable
                              dialogSetState(() {
                                isTdTp = value;
                                // print(isTdTp);
                              });
                            },
                            activeColor: primaryBlue,
                            activeTrackColor: const Color(0xFF0015FF),
                            inactiveThumbColor: const Color(0xFF0C37CD),
                            inactiveTrackColor: darkBlue,
                            trackOutlineColor: WidgetStateProperty.all(
                                const Color(0x000c37cd)),
                            trackOutlineWidth: WidgetStateProperty.all(0.0),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  style: TextButton.styleFrom(
                      side: const BorderSide(width: 1.4, color: primaryBlue),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0))),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Cancel',
                    style: textStyle.copyWith(color: primaryBlue),
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                      side: const BorderSide(width: 1.4, color: primaryBlue),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0))),
                  onPressed: () {
                    if (moduleName.isNotEmpty) {
                      setState(() {
                        modules.add(Module(moduleName, coefficient, examRatio,
                            tdTpRatio, isTdTp));
                        _calculateAverage();
                      });
                      Navigator.pop(context);
                    }
                  },
                  child: Text(
                    'Add',
                    style: textStyle.copyWith(color: primaryBlue),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _deleteModule(Module module) {
    setState(() {
      modules.remove(module);
      module.dispose(); // Dispose of controllers
      _calculateAverage();
    });
  }

  void _calculateAverage() {
    setState(() {
      semesterAverage = calculateSemesterAverage(modules);
    });
  }

  void _showPresetDropdown(BuildContext context) {
    showDialog(
      barrierColor: const Color(0x50000000),
      context: context,
      builder: (context) {
        return AlertDialog(
          clipBehavior: Clip.antiAlias,
          backgroundColor: const Color(0xF0000F40),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          title: Text(
            'Select a Preset',
            style: textStyle.copyWith(color: primaryBlue),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: presets.keys.map((key) {
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 4.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: primaryBlue,
                    width: 1.4,
                  ),
                ),
                child: ListTile(
                  splashColor: primaryBlue,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  title: Text(
                    key,
                    style: textStyle.copyWith(color: primaryBlue),
                  ),
                  onTap: () {
                    setState(() {
                      // Dispose of existing module controllers
                      for (var module in modules) {
                        module.dispose();
                      }
                      modules.clear();
                      modules.addAll(applyPreset(key));
                      _calculateAverage();
                    });
                    Navigator.pop(context);
                  },
                ),
              );
            }).toList(),
          ),
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                side: const BorderSide(width: 1.4, color: primaryBlue),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
              onPressed: () => Navigator.pop(context),
              child: Text(
                'Cancel',
                style: textStyle.copyWith(color: primaryBlue),
              ),
            ),
          ],
        );
      },
    );
  }
}
