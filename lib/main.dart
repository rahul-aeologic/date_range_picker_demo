import 'package:date_range_picker_demo/custom_date_range_picker.dart';
import 'package:flutter/material.dart';

void main() {
  return runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  String _range = '';
  bool isShowCal = false;

  // void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
  //   setState(() {
  //     if (args.value is PickerDateRange) {
  //       _range = '${DateFormat('dd/MM/yyyy').format(args.value.startDate)} -'
  //           ' ${DateFormat('dd/MM/yyyy').format(args.value.endDate ?? args.value.startDate)}';
  //     } else if (args.value is DateTime) {
  //       _selectedDate = args.value.toString();
  //     } else if (args.value is List<DateTime>) {
  //       _dateCount = args.value.length.toString();
  //     } else {
  //       _rangeCount = args.value.length.toString();
  //     }
  //   });
  // }

  _getDateRange(String value) {
    setState(() {
      _range = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.blue,
            appBar: AppBar(
              title: const Text('Date Picker demo'),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Selected range: $_range'),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        if (isShowCal)
                          CustomDateRangePicker(onChanged: _getDateRange),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                isShowCal = !isShowCal;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 20),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: _range == ''
                                  ? Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        const Text('Open calendar'),
                                        const SizedBox(
                                          width: 80,
                                        ),
                                        isShowCal
                                            ? const Icon(
                                                Icons.keyboard_arrow_up)
                                            : const Icon(
                                                Icons.keyboard_arrow_down),
                                      ],
                                    )
                                  : Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(_range),
                                        const SizedBox(
                                          width: 80,
                                        ),
                                        isShowCal
                                            ? const Icon(
                                                Icons.keyboard_arrow_up)
                                            : const Icon(
                                                Icons.keyboard_arrow_down),
                                      ],
                                    ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )));
  }
}
