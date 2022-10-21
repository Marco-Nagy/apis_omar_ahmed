import 'package:apis_omar_ahmed/Features/Settings/presentation/screens/ExpensisType/expensis_type_dialog.dart';
import 'package:flutter/material.dart';

import '../../../../../config/themes/colors.dart';
import '../../../../../widgets/btn_widgets/bordered_btn.dart';
import '../../../../../widgets/table_header_cell.dart';
import '../../../../../widgets/table_item_cell.dart';

class ExpensesTypeScreen extends StatelessWidget {
  const ExpensesTypeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: BorderedButton(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (_) => const AlertDialog(
                                  content: ExpensesTypeDialog()));
                        },
                        text: 'Add',
                        color: AppColors.orange),
                  ),
                ),
                const Expanded(flex: 15, child: SizedBox())
              ],
            ),
            Row(
              children: const [
                Expanded(
                    child: TableHeaderCell(
                  text: 'ID',
                  enabled: false,
                )),
                SizedBox(width: 12),
                Expanded(
                    flex: 3,
                    child: TableHeaderCell(
                      text: 'Expenses Type Name',
                      enabled: false,
                    )),
                SizedBox(width: 12),
                Expanded(
                    flex: 3,
                    child: TableHeaderCell(
                      text: 'Description',
                      enabled: false,
                    )),
                SizedBox(width: 84),
              ],
            ),
            Expanded(
                child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    const Expanded(child: TableItemCell(text: '2')),
                    const SizedBox(width: 12),
                    const Expanded(
                        flex: 3, child: TableItemCell(text: 'Salaries')),
                    const SizedBox(width: 12),
                    const Expanded(
                        flex: 3, child: TableItemCell(text: 'Salaries')),
                    const SizedBox(width: 12),
                    SizedBox(
                        width: 60,
                        child: BorderedButton(
                          text: 'Edit',
                          onTap: () {},
                          color: Colors.orange,
                        )),
                  ],
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}
