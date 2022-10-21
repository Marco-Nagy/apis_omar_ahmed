import 'package:apis_omar_ahmed/Features/AddNewEmployee/presentation/providers/add_employee_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../DailyJournalEntry/presentation/widgets/my_icon.dart';

class AttacheFileWithRemove extends StatefulWidget {
  AttacheFileWithRemove({
    Key? key,
    required this.attacheFile,
  }) : super(key: key);
  List attacheFile;
  @override
  _AttacheFileWithRemoveState createState() => _AttacheFileWithRemoveState();
}

class _AttacheFileWithRemoveState extends State<AttacheFileWithRemove> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, AddEmployeeProvider aep, child) {
        return Row(
          children: [
            InkWell(
              onTap: () async {
                await aep.getFileForWeb(widget.attacheFile);

                print('uploadFileEncodedINK ${widget.attacheFile}');
              },
              child: myIcon(
                  prefixIconImage: 'assets/img/attach-file.png', size: 40),
            ),
            if (widget.attacheFile.isNotEmpty)
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.topRight,
                children: [
                  Container(
                    margin: const EdgeInsets.all(15),
                    child: myIcon(
                        prefixIconImage: 'assets/images/pdf.png', size: 40),
                  ),
                  InkWell(
                    onTap: () {
                      aep.deleteFile(widget.attacheFile);
                    },
                    child: myIcon(
                        prefixIconImage: 'assets/img/xIcon.png',
                        color: Colors.red,
                        size: 20),
                  ),
                ],
              ),
            if (widget.attacheFile.isNotEmpty)
              Text(widget.attacheFile[0]['FileLicenseName']),
          ],
        );
      },
    );
  }
}
