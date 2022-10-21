import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../config/themes/colors.dart';
import '../../../../../../config/themes/fonts.dart';
import '../../../providers/daily_journal_provider.dart';
import '../../../widgets/decoration_widgets.dart';
import '../../../widgets/my_icon.dart';
import 'account_item_builder.dart';

class ProjectWidget extends StatefulWidget {
  const ProjectWidget({Key? key}) : super(key: key);

  @override
  ProjectWidgetState createState() => ProjectWidgetState();
}

class ProjectWidgetState extends State<ProjectWidget> {
  TextEditingController projectController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<DailyJournalProvider>(
      builder: (context, djp, child) {
        if (djp.clientCtrl.text.isNotEmpty) {
          return Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      dropDownTitle(title: 'Project'),
                      projectTextFormField(),
                      dropDownDescription(
                          description: 'Project Payment Details'),
                    ],
                  ),
                ),
                myIcon(
                    prefixIconImage: 'assets/icons/info_green.png', size: 35),
              ],
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}

///! Project Widgets
projectTextFormField() {
  return Consumer(
    builder: (context, DailyJournalProvider djp, child) {
      return dropDownTextField(
        onTap: () async {
          djp.onClickProject();
          djp.getProjectList(djp.clientId.toString());
        },
        widget: Text(
          djp.projectCtrl.text.isEmpty
              ? "Select Project"
              : djp.projectCtrl.text,
          style: TextStyle(
              color: djp.projectCtrl.text.isEmpty
                  ? AppColors.textDarkGrey
                  : Colors.black,
              fontSize: 12,
              fontFamily: AppFonts.ubuntu,
              fontWeight: FontWeight.w700),
        ),
      );
    },
  );
}

class ProjectDropList extends StatefulWidget {
  const ProjectDropList({Key? key}) : super(key: key);

  @override
  State<ProjectDropList> createState() => _ProjectDropListState();
}

class _ProjectDropListState extends State<ProjectDropList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DailyJournalProvider>(
      builder: (context, djp, child) {
        return AnimatedContainer(
          constraints: djp.selectedProjectText
              ? const BoxConstraints(maxHeight: 250, maxWidth: 240)
              : const BoxConstraints(
                  minHeight: 0, maxHeight: 250, maxWidth: 240, minWidth: 0),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(width: 1.8, color: AppColors.lightBlue),
              borderRadius: BorderRadius.circular(15)),
          curve: Curves.easeInOutCubicEmphasized,
          duration: const Duration(milliseconds: 1),
          width: djp.selectedProjectText ? double.infinity : 0,
          height: djp.selectedProjectText ? null : 0,
          child: Column(
            children: [
              Container(
                height: djp.selectedProjectText ? 40 : 0,
                width: djp.selectedProjectText ? double.infinity : 0,
                margin: djp.selectedProjectText
                    ? const EdgeInsets.fromLTRB(5, 5, 5, 5)
                    : null,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
                child: TextField(
                  controller: djp.projectSearchController,
                  style: TextStyle(
                      color: djp.projectCtrl.text.isEmpty
                          ? AppColors.textDarkGrey
                          : Colors.black,
                      fontSize: 14,
                      fontFamily: AppFonts.ubuntu,
                      fontWeight: FontWeight.w700),
                  cursorHeight: 20,
                  decoration: InputDecoration(
                    enabledBorder: djp.selectedProjectText
                        ? myEnableInputDecoration()
                        : null,
                    focusedBorder: myFocusInputDecoration(),
                    suffixIcon: djp.projectSearchController.text.isNotEmpty &&
                            djp.selectedProjectText == true
                        ? GestureDetector(
                            child: const Icon(Icons.close,
                                color: AppColors.appBlue),
                            onTap: () {
                              djp.projectSearchController.clear();
                              FocusScope.of(context).requestFocus(FocusNode());
                            },
                          )
                        : null,
                    hintText: 'search',
                    alignLabelWithHint: true,

                    // hintStyle: style,
                  ),
                  onChanged: (query) {
                    djp.clientsSearchBox(query, context);
                  },
                ),
              ),
              Expanded(
                child: djp.projectModel.result == false
                    ? const Center(child: CircularProgressIndicator())
                    : djp.projectList.isEmpty
                        ? Center(
                            child: Text(
                              "No Projects Data",
                              style: TextStyle(
                                  color: djp.projectCtrl.text.isEmpty
                                      ? AppColors.textDarkGrey
                                      : Colors.black,
                                  fontSize: 18,
                                  fontFamily: AppFonts.ubuntu,
                                  fontWeight: FontWeight.w900),
                              textAlign: TextAlign.center,
                            ),
                          )
                        : ListView.builder(
                            controller: djp.projectScrollController,
                            itemCount:
                                djp.projectList.length < djp.currentProjectItems
                                    ? djp.projectList.length
                                    : djp.currentProjectItems,
                            itemBuilder: (context, index) {
                              var item = djp.projectList[index];
                              return Container(
                                height: djp.selectedProjectText ? 25 : 0,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                padding: const EdgeInsets.only(bottom: 5),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: InkWell(
                                    onTap: () async {
                                      djp.setProjectText(
                                        name: item.name,
                                        id: item.id,
                                        value: false,
                                      );
                                    },
                                    child: Row(
                                      children: [
                                        Text(
                                          item.name.toString(),
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontFamily: AppFonts.ubuntu,
                                          ),
                                          textAlign: TextAlign.start,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
              ),
            ],
          ),
        );
      },
    );
  }
}
