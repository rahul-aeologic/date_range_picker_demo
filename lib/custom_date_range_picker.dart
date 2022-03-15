import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';

class CustomDateRangePicker extends StatelessWidget {
  final ValueSetter<String>? onChanged;
  // String _selectedDate = '';
  String _range = '';

  CustomDateRangePicker({this.onChanged, Key? key}) : super(key: key);

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    if (args.value is PickerDateRange) {
      _range = '${DateFormat('dd/MM/yyyy').format(args.value.startDate)} -'
          ' ${DateFormat('dd/MM/yyyy').format(args.value.endDate ?? args.value.startDate)}';
      onChanged!(_range);
    }
    // else if (args.value is DateTime) {
    //   _selectedDate = args.value.toString();
    //   onChanged!(_selectedDate);
    // }
    // else if (args.value is List<DateTime>) {
    //   _dateCount = args.value.length.toString();
    // }
    // else {
    //   _rangeCount = args.value.length.toString();
    // }
  }

  @override
  Widget build(BuildContext context) {
    return SfDateRangePicker(
      monthViewSettings: const DateRangePickerMonthViewSettings(
        viewHeaderHeight: 10,
        enableSwipeSelection: true,
      ),
      onSelectionChanged: _onSelectionChanged,
      selectionMode: DateRangePickerSelectionMode.range,
      initialSelectedRange: PickerDateRange(
          DateTime.now().subtract(const Duration(days: 4)),
          DateTime.now().add(const Duration(days: 3))),
      headerHeight: 80,
      headerStyle: const DateRangePickerHeaderStyle(
          textAlign: TextAlign.center,
          textStyle: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
      rangeSelectionColor: Colors.purple,
      startRangeSelectionColor: Colors.blue,
      endRangeSelectionColor: Colors.blue,
    );
  }
}
