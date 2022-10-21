import 'package:apis_omar_ahmed/Features/AddNewEmployee/presentation/providers/add_employee_provider.dart';
import 'package:apis_omar_ahmed/Features/AddNewEmployee/presentation/screens/ContractDetails/contracts_details_screen.dart';
import 'package:apis_omar_ahmed/Features/AddNewEmployee/presentation/screens/InterviewDetails/interview_details_screen.dart';
import 'package:apis_omar_ahmed/Features/AddNewEmployee/presentation/screens/JobInformation/job_information_screen.dart';
import 'package:apis_omar_ahmed/Features/AddNewEmployee/presentation/screens/SalaryDetails/salary_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../config/themes/colors.dart';
import '../../../../../widgets/btn_widgets/bordered_btn.dart';
import '../EmployeeAttachments/employee_attachment _screen.dart';

class OtherButtonDropList extends StatefulWidget {
  const OtherButtonDropList({Key? key}) : super(key: key);

  @override
  OtherButtonDropListState createState() => OtherButtonDropListState();
}

class OtherButtonDropListState extends State<OtherButtonDropList> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, AddEmployeeProvider aep, child) {
        return AnimatedContainer(
          duration: const Duration(seconds: 1),
          height: aep.otherIsOpen ? null : 0,
          child: Container(
            color: Colors.white.withOpacity(0.95),
            height: null,
            width: 100,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: BorderedButton(
                              text: 'InterView Details',
                              color: AppColors.appBlue,
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const InterviewDetailsScreen()));
                              }),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: BorderedButton(
                              text: 'Job Information',
                              color: AppColors.appBlue,
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const JobInformationScreen()));
                              }),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: BorderedButton(
                              text: 'Contact Details',
                              color: AppColors.appBlue,
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ContractDetailsScreen()));
                              }),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: BorderedButton(
                              text: 'Employee Attachments',
                              color: AppColors.appBlue,
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const EmployeeAttachmentScreen()));
                              }),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: BorderedButton(
                              text: 'Salary Details',
                              color: AppColors.appBlue,
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SalaryDetailsScreen()));
                              }),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: BorderedButton(
                              text: 'Attendance',
                              color: AppColors.appBlue,
                              onTap: () {}),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: BorderedButton(
                              text: 'Custody',
                              color: AppColors.appBlue,
                              onTap: () {}),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: BorderedButton(
                              text: 'Loans',
                              color: AppColors.appBlue,
                              onTap: () {}),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: BorderedButton(
                              text: 'Warnings',
                              color: AppColors.appBlue,
                              onTap: () {}),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: BorderedButton(
                              text: 'Deductions',
                              color: AppColors.appBlue,
                              onTap: () {}),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: BorderedButton(
                              text: 'Rewardings',
                              color: AppColors.appBlue,
                              onTap: () {}),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: BorderedButton(
                              text: 'My Pay Slip',
                              color: AppColors.appBlue,
                              onTap: () {}),
                        ),
                      ],
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
