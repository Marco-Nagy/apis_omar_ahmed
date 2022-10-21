import 'package:flutter/material.dart';

import '../../../../../config/themes/fonts.dart';
import '../../../../../widgets/custom_text_field.dart';
import '../../widgets/attache_file_with_remove.dart';

class AttachmentRow extends StatelessWidget {
  AttachmentRow({
    Key? key,
    required this.title,
    required this.attacheFile,
    required this.onChangedDate,
    required this.onTap,
    required this.textController,
  }) : super(key: key);
  String title;
  List attacheFile;
  Function onChangedDate;
  Function onTap;
  TextEditingController textController;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              fileTitle(title),
              AttacheFileWithRemove(
                attacheFile: attacheFile,
              ),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: CustomTextField(
              labelText: 'Expired Date',
              hintText: 'Select Expired Date',
              onChanged: onChangedDate,
              textController: textController,
              onTap: onTap,
            ),
          ),
        ),
      ],
    );
  }

  Widget fileTitle(title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Text(
        title,
        style: const TextStyle(
          fontFamily: AppFonts.ubuntu,
          fontSize: 14,
          fontWeight: FontWeight.w900,
          color: Colors.black54,
        ),
        textAlign: TextAlign.start,
      ),
    );
  }
}
