import 'package:apis_omar_ahmed/widgets/check_box_with_text.dart';
import 'package:flutter/material.dart';

import '../../../../../config/themes/colors.dart';
import '../../../../../widgets/btn_widgets/bordered_btn.dart';
import '../../../../../widgets/table_header_cell.dart';
import '../../../../../widgets/table_item_cell.dart';
import 'daily_tranaction_beneficiary_to_type_dialog.dart';

class DailyTransactionBeneficiaryToTypeScreen extends StatelessWidget {
  const DailyTransactionBeneficiaryToTypeScreen({Key? key}) : super(key: key);

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
                                  content:
                                      DailyTransactionBeneficiaryToTypeDialog()));
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
                      text: 'Name',
                      enabled: false,
                    )),
                SizedBox(width: 12),
                Expanded(
                    flex: 3,
                    child: TableHeaderCell(
                      text: 'Description',
                      enabled: false,
                    )),
                SizedBox(width: 12),
                SizedBox(
                    width: 85,
                    child: TableHeaderCell(
                      text: 'Active',
                      enabled: false,
                    )),
                SizedBox(width: 72),
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
                        flex: 3, child: TableItemCell(text: 'Supplier')),
                    const SizedBox(width: 12),
                    const Expanded(
                        flex: 3, child: TableItemCell(text: 'Supplier')),
                    const SizedBox(width: 12),
                    SizedBox(
                        width: 85,
                        child: CheckBoxWithText(
                            text: '', status: true, onTap: () {})),
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
