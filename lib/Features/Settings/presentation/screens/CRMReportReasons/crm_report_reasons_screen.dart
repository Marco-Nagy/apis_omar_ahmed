import 'package:apis_omar_ahmed/config/themes/colors.dart';
import 'package:apis_omar_ahmed/widgets/btn_widgets/bordered_btn.dart';
import 'package:apis_omar_ahmed/widgets/table_header_cell.dart';
import 'package:apis_omar_ahmed/widgets/table_item_cell.dart';
import 'package:flutter/material.dart';

import '../../../../../widgets/check_box_with_text.dart';
import 'create_crm_report_reasons_dialog.dart';

class CRMReportReasonsScreen extends StatelessWidget {
  const CRMReportReasonsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
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
                              builder: (context) => const AlertDialog(
                                    content: CreateCRMReportReasonsDialog(),
                                  ));
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
                      text: 'CRM Report Reasons Name',
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
                        flex: 3, child: TableItemCell(text: 'Complaint')),
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
