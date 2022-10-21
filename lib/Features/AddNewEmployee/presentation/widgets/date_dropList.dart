import 'package:apis_omar_ahmed/Features/AddNewEmployee/presentation/providers/add_employee_provider.dart';
import 'package:apis_omar_ahmed/widgets/date_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DateDropList extends StatefulWidget {
  DateDropList({Key? key, required this.isOpen, required this.onChange})
      : super(key: key);
  bool isOpen;
  Function onChange;
  @override
  DateDropListState createState() => DateDropListState();
}

class DateDropListState extends State<DateDropList> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, AddEmployeeProvider aep, child) {
        return AnimatedContainer(
          duration: const Duration(seconds: 1),
          height: widget.isOpen ? null : 0,
          child: SizedBox(
            height: 200,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: [
                  Expanded(
                    child: DatePicker(
                      initialDate: '',
                      onChanged: widget.onChange,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
