import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FieldYear extends StatefulWidget {
  const FieldYear({super.key});

  @override
  State<FieldYear> createState() => _FieldYearState();
}

class _FieldYearState extends State<FieldYear> {
  String selectedField = 'Choose your field';
  String selectedYear = 'Choose your year';

  final List<String> fields = ['Informatique ING', 'Informatique LMD', 'MI'];
  final List<String> years = [
    '1st year',
    '2nd year',
    '3rd year',
    '4th year',
    '5th year'
  ];

  // Method to show a bottom sheet for selecting options
  void _showBottomSheet(List<String> options, String type) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 250, // Set height for the bottom sheet
          padding: EdgeInsets.all(16),
          child: ListView.builder(
            itemCount: options.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(options[index]),
                onTap: () {
                  setState(() {
                    if (type == 'Field') {
                      selectedField = options[index];
                    } else if (type == 'Year') {
                      selectedYear = options[index];
                    }
                  });
                  Navigator.of(context).pop(); // Close the bottom sheet
                },
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        shape: Border(bottom: BorderSide(color: Colors.black, width: 1.4)),
        backgroundColor: Color(0xFFE5EDFF),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(CupertinoIcons.arrow_left),
          color: Colors.black,
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(35.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {
                    _showBottomSheet(fields, 'Field'); // Show field options
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    height: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Color(0xFF000000), width: 1.4),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          selectedField,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Helvetica',
                          ),
                        ),
                        Icon(Icons.keyboard_arrow_down_sharp),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 12.0),
                InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {
                    _showBottomSheet(years, 'Year'); // Show year options
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    height: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Color(0xFF000000), width: 1.4),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          selectedYear,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Helvetica',
                          ),
                        ),
                        Icon(Icons.keyboard_arrow_down_sharp),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 12),
                InkWell(
                  splashColor: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {
                    // Action on continue button tap
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    height: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Color(0xFF000000), width: 1.4),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Continue',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Helvetica',
                          ),
                        ),
                        Icon(Icons.keyboard_arrow_right_sharp),
                      ],
                    ),
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
