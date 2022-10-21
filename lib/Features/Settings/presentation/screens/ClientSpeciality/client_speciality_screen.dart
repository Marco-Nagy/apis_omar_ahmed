import 'package:apis_omar_ahmed/Features/Settings/presentation/screens/ClientSpeciality/add_client_speciality_dialog.dart';
import 'package:flutter/material.dart';

import '../../../../../config/themes/colors.dart';
import '../../../../../utilities/constants.dart';
import '../../../../../widgets/btn_widgets/bordered_btn.dart';
import '../../../../../widgets/table_header_cell.dart';
import '../../../../../widgets/table_item_cell.dart';

class ClientSpecialityScreen extends StatelessWidget {
  const ClientSpecialityScreen({Key? key}) : super(key: key);

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
                      'Clients Specialities',
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
                                    content: AddClientSpecialityDialog(),
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
                    flex: 4,
                    child: TableHeaderCell(
                      text: 'Cost Type Name',
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
                        flex: 4, child: TableItemCell(text: 'Construction')),
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
