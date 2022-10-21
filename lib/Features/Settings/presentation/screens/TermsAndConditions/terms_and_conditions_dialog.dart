import 'package:apis_omar_ahmed/Features/Settings/presentation/providers/settingsProvider.dart';
import 'package:apis_omar_ahmed/Features/Settings/presentation/screens/TermsAndConditions/terms_category_id%20_dropList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../config/themes/colors.dart';
import '../../../../../utilities/constants.dart';
import '../../../../../widgets/btn_widgets/bordered_btn.dart';
import '../../../../../widgets/check_box_with_text.dart';
import '../../../../../widgets/custom_text_field.dart';

class TermsAndConditionsDialog extends StatelessWidget {
  const TermsAndConditionsDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, SettingsProvider sp, child) {
        return Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          height: 360,
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
                      'Add New Terms and Conditions',
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
                      )),
                ],
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          labelText: 'Name',
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
                  const SizedBox(height: 20),
                  CustomTextField(
                    labelText: 'Description',
                    hintText: '',
                    onChanged: () {},
                    onTap: () {},
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    child: Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 135,
                            child: Stack(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: CustomTextField(
                                            labelText: 'Terms Category ID',
                                            hintText:
                                                'Select Terms Category ID',
                                            onChanged: () {},
                                            textController:
                                                sp.termsCategoryIDCtrl,
                                            onTap: () {
                                              sp.onOpenCloseTermsCategoryID();
                                            },
                                          ),
                                        ),
                                        const Expanded(
                                          child: SizedBox(),
                                        ),
                                      ],
                                    ),
                                    CheckBoxWithText(
                                      onTap: () {
                                        sp.updateActive();
                                      },
                                      text: 'Active',
                                      status: sp.activeChecked,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        const Expanded(
                                          flex: 4,
                                          child: SizedBox(),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: BorderedButton(
                                                  text: 'Cancel',
                                                  color: AppColors.appRed,
                                                  onTap: () =>
                                                      Navigator.pop(context),
                                                ),
                                              ),
                                              const SizedBox(width: 5),
                                              Expanded(
                                                child: BorderedButton(
                                                  text: 'Save',
                                                  color: AppColors.appGreen,
                                                  onTap: () {},
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Positioned(
                                  top: 40,
                                  bottom: 0,
                                  left: 0,
                                  right: 0,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                          child: Row(
                                        children: const [
                                          Expanded(
                                            child: TermsCategoryIdDropList(),
                                          ),
                                          Expanded(child: SizedBox())
                                        ],
                                      )),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ]),
        );
      },
    );
  }
}
