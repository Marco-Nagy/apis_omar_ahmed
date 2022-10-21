import 'package:apis_omar_ahmed/Features/AddNewEmployee/presentation/providers/add_employee_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../utilities/constants.dart';
import '../../../../../widgets/loader.dart';

class InterviewerDropList extends StatefulWidget {
  const InterviewerDropList({Key? key}) : super(key: key);

  @override
  InterviewerDropListState createState() => InterviewerDropListState();
}

class InterviewerDropListState extends State<InterviewerDropList> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, AddEmployeeProvider aep, child) {
        return AnimatedContainer(
          duration: const Duration(seconds: 1),
          height: aep.interviewerIsOpen ? null : 0,
          child: Container(
            height: 200,
            decoration: containerDecorationList,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: [
                  false
                      ? const Expanded(child: Loader())
                      : Expanded(
                          child: ListView.builder(
                            shrinkWrap: aep.interviewerIsOpen,
                            padding: EdgeInsets.zero,
                            itemCount: 50,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        // aep.areaAddNewClient.text = aep
                                        //     .filteredAreaListAddNewClient[
                                        //         index]
                                        //     .name;
                                        // aep.areaIdKey = aep
                                        //     .filteredAreaListAddNewClient[
                                        //         index]
                                        //     .id;
                                      });
                                      aep.onOpenCloseInterviewer();
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 5.0, right: 5.0, bottom: 8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: const [
                                          Expanded(
                                            child: FittedBox(
                                              fit: BoxFit.scaleDown,
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                'Interviewer',
                                                style: TextStyle(
                                                  fontFamily: defaultFont,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color(0xff000000),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
