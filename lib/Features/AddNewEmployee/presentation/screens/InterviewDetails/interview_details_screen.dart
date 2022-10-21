import 'package:apis_omar_ahmed/Features/AddNewEmployee/presentation/screens/InterviewDetails/interviewer_dropList.dart';
import 'package:apis_omar_ahmed/widgets/btn_widgets/bordered_btn.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../config/themes/colors.dart';
import '../../../../../widgets/custom_text_field.dart';
import '../../providers/add_employee_provider.dart';
import '../../widgets/attache_file_with_remove.dart';
import '../../widgets/date_dropList.dart';
import '../../widgets/styles.dart';
import '../add_employee_header.dart';
import 'position_dropList.dart';

class InterviewDetailsScreen extends StatefulWidget {
  const InterviewDetailsScreen({Key? key}) : super(key: key);

  @override
  InterviewDetailsScreenState createState() => InterviewDetailsScreenState();
}

class InterviewDetailsScreenState extends State<InterviewDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, AddEmployeeProvider aep, child) {
        return Scaffold(
          body: SafeArea(
            child: Stack(
              children: [
                Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            addEmployeeHeader(context),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          height: 35,
                                        ),
                                        Text(
                                          'Interview Evaluation & Comments',
                                          style: headerStyle,
                                        ),
                                        const SizedBox(height: 10),
                                        SizedBox(
                                          height: 60,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 8.0),
                                                    child: CustomTextField(
                                                      labelText: 'Date',
                                                      hintText: 'Select Date',
                                                      onChanged: () {},
                                                      textController:
                                                          aep.dateCtrl,
                                                      onTap: () {
                                                        aep.onOpenCloseDate();
                                                      },
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 8.0),
                                                    child: CustomTextField(
                                                      labelText: 'Interviewer',
                                                      hintText:
                                                          'Select Interviewer',
                                                      onChanged: () {},
                                                      textController:
                                                          aep.interviewerCtrl,
                                                      onTap: () {
                                                        aep.onOpenCloseInterviewer();
                                                      },
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 8.0),
                                                    child: CustomTextField(
                                                      labelText: 'Position',
                                                      hintText:
                                                          'Select Position',
                                                      onChanged: () {},
                                                      textController:
                                                          aep.positionCtrl,
                                                      onTap: () {
                                                        aep.onOpenClosePosition();
                                                      },
                                                    ),
                                                  ),
                                                ),
                                                const Expanded(
                                                  child: SizedBox(),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        SizedBox(
                                          height: 60,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 8.0),
                                                    child: CustomTextField(
                                                      labelText: 'Comment',
                                                      hintText: '',
                                                      onChanged: () {},
                                                      textController:
                                                          aep.commentCtrl,
                                                      onTap: () {},
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        AttacheFileWithRemove(
                                          attacheFile: aep.interviewFile,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            BorderedButton(
                                              text: 'Cancel',
                                              color: AppColors.appRed,
                                              onTap: () {},
                                            ),
                                            const SizedBox(width: 5),
                                            BorderedButton(
                                              text: 'Save',
                                              color: AppColors.appGreen,
                                              onTap: () {},
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 0,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: aep.dateIsOpen == true ||
                          aep.interviewerIsOpen == true ||
                          aep.positionIsOpen == true
                      ? InkWell(
                          onTap: () {
                            aep.closeAllInterviewDetailsLists();
                          },
                          child: Container(),
                        )
                      : Container(),
                ),
                Positioned(
                  top: 180,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          flex: 3,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 45.0, right: 20),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10.0, right: 10),
                                    child: DateDropList(
                                        isOpen: aep.dateIsOpen,
                                        onChange: (value) {
                                          aep.onDateSelectionChanged(
                                              value,
                                              aep.dateCtrl,
                                              () => aep.onOpenCloseDate());
                                        }),
                                  ),
                                ),
                                const Expanded(
                                  child: Padding(
                                    padding:
                                        EdgeInsets.only(left: 5, right: 15),
                                    child: InterviewerDropList(),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    margin: const EdgeInsets.only(right: 0),
                                    padding: const EdgeInsets.only(right: 20),
                                    child: const PositionDropList(),
                                  ),
                                ),
                                const Expanded(
                                  child: SizedBox(),
                                ),
                              ],
                            ),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
