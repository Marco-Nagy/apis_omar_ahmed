import 'package:flutter/material.dart';

import '../../../../../config/themes/colors.dart';
import '../../../../../utilities/constants.dart';
import '../../../../../widgets/btn_widgets/bordered_btn.dart';
import '../../../../../widgets/custom_text_field.dart';

class CreateCostTypeDialog extends StatelessWidget {
  const CreateCostTypeDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      height: 240,
      width: 1100,
      child: Column(children: [
        SizedBox(
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  'Create Cost Type',
                  style: webTitleStyle,
                ),
              ),
              const Spacer(),
              InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                    'assets/icons/cancel_icon.png',
                    color: AppColors.greyDark,
                  ))
            ],
          ),
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: Row(
            children: [
              Expanded(
                child: CustomTextField(
                  labelText: 'Cost Type Name',
                  hintText: '',
                  onChanged: () {},
                  onTap: () {},
                ),
              ),
              const Expanded(
                child: SizedBox(),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Expanded(
              flex: 8,
              child: SizedBox(),
            ),
            Expanded(
              flex: 1,
              child: BorderedButton(
                text: 'Save',
                color: AppColors.appGreen,
                onTap: () {},
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
