import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../../utilities/constants.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({required this.initialDate, required this.onChanged});
  final String initialDate;
  final Function onChanged;

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateRangePickerController datePickerController = DateRangePickerController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: containerDecorationList,
      child: SfDateRangePicker(
        onSelectionChanged: (value) =>
            widget.onChanged(datePickerController.selectedDate),
        selectionMode: DateRangePickerSelectionMode.single,
        selectionColor: Colors.blueAccent,
        initialSelectedDate: widget.initialDate.isEmpty
            ? DateTime.now()
            : DateFormat('yyyy-MM-dd').parse(widget.initialDate),
        controller: datePickerController,
      ),
    );
  }
}
