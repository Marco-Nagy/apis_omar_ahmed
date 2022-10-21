import 'package:flutter/material.dart';

import '../../../../../config/themes/colors.dart';
import '../../../../../utilities/constants.dart';
import '../../../../../widgets/btn_widgets/bordered_btn.dart';
import '../../../../../widgets/table_header_cell.dart';
import '../../../../../widgets/table_item_cell.dart';
import 'add_supplier_speciality_dialog.dart';

class SupplierSpecialityScreen extends StatelessWidget {
  const SupplierSpecialityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      'Suppliers Specialities',
                      style: webTitleStyle,
                    ),
                  ),
                  const Expanded(
                    flex: 1,
                    child: SizedBox(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: BorderedButton(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) => const AlertDialog(
                                    content: AddSupplierSpecialityDialog(),
                                  ));
                        },
                        text: 'Add',
                        color: AppColors.orange),
                  ),
                ],
              ),
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
                SizedBox(width: 170),
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
                        flex: 3, child: TableItemCell(text: 'Trader')),
                    const SizedBox(width: 12),
                    SizedBox(
                        width: 60,
                        child: BorderedButton(
                          text: 'Edit',
                          onTap: () {},
                          color: Colors.orange,
                        )),
                    const SizedBox(width: 12),
                    SizedBox(
                        width: 85,
                        child: BorderedButton(
                          text: 'Delete',
                          onTap: () {},
                          color: Colors.red,
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
