import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../../../config/themes/colors.dart';
import '../../providers/daily_journal_provider.dart';
import 'new_journal_entry.dart';

class AddNewJournal extends StatefulWidget {
  const AddNewJournal({Key? key}) : super(key: key);

  @override
  AddNewJournalState createState() => AddNewJournalState();
}

class AddNewJournalState extends State<AddNewJournal> {
  var dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<DailyJournalProvider>(
      builder: (context, djp, child) {
        return Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Stack(
            children: [
              const NewJournalEntry(),
              AnimatedPositioned(
                curve: Curves.easeInOutCubicEmphasized,
                right: 10,
                top: 50,
                duration: const Duration(seconds: 1),
                child: AnimatedContainer(
                  constraints: djp.isDatePicker
                      ? const BoxConstraints(maxHeight: 250)
                      : const BoxConstraints(minHeight: 50, maxHeight: 250),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 1.8, color: AppColors.lightBlue),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  curve: Curves.easeInOutCubicEmphasized,
                  duration: const Duration(seconds: 1),
                  width: djp.isDatePicker ? 250 : 1,
                  height: djp.isDatePicker ? null : 1,
                  child: dateTimePicker(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

dateTimePicker() {
  return Consumer<DailyJournalProvider>(
    builder: (context, djp, child) {
      return SfDateRangePicker(
        initialDisplayDate: DateTime.now(),
        enablePastDates: true,
        onSelectionChanged: djp.onDateSelectionChanged,
        selectionMode: DateRangePickerSelectionMode.single,
      );
    },
  );
}
