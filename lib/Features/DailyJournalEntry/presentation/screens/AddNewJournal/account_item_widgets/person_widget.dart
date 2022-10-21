import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../config/themes/colors.dart';
import '../../../../../../config/themes/fonts.dart';
import '../../../providers/daily_journal_provider.dart';
import '../../../widgets/decoration_widgets.dart';
import 'account_item_builder.dart';

class PersonWidget extends StatefulWidget {
  const PersonWidget({Key? key}) : super(key: key);

  @override
  PersonWidgetState createState() => PersonWidgetState();
}

class PersonWidgetState extends State<PersonWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          dropDownTitle(title: 'Person'),
          Row(
            children: [
              Expanded(
                child: personTextFormField(),
              )
            ],
          ),
          dropDownDescription(description: 'Confirmed in     /     /     .')
        ],
      ),
    );
  }
}

///! Person Widgets
personTextFormField() {
  return Consumer(
    builder: (context, DailyJournalProvider djp, child) {
      return dropDownTextField(
        onTap: () async {
          djp.getPersonList();
          djp.onClickPerson();
        },
        widget: Text(
          djp.personCtrl.text.isEmpty ? "Select Person" : djp.personCtrl.text,
          style: TextStyle(
              color: djp.personCtrl.text.isEmpty
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

class PersonDropList extends StatefulWidget {
  const PersonDropList({Key? key}) : super(key: key);

  @override
  State<PersonDropList> createState() => _PersonDropListState();
}

class _PersonDropListState extends State<PersonDropList> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, DailyJournalProvider djp, child) {
        return AnimatedContainer(
          constraints: djp.selectedPersonText
              ? const BoxConstraints(maxHeight: 250, minWidth: 0)
              : const BoxConstraints(maxHeight: 250, maxWidth: 270),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(width: 1.8, color: AppColors.lightBlue),
              borderRadius: BorderRadius.circular(15)),
          curve: Curves.easeInOutCubicEmphasized,
          duration: const Duration(milliseconds: 1),
          width: djp.selectedPersonText ? double.infinity : 0,
          height: djp.selectedPersonText ? null : 0,
          child: Column(
            children: [
              Container(
                height: djp.selectedPersonText ? 40 : 0,
                width: djp.selectedPersonText ? double.infinity : 0,
                margin: djp.selectedPersonText
                    ? const EdgeInsets.fromLTRB(5, 5, 5, 5)
                    : null,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
                child: TextField(
                  controller: djp.personSearchController,
                  style: TextStyle(
                      color: djp.personCtrl.text.isEmpty
                          ? AppColors.textDarkGrey
                          : Colors.black,
                      fontSize: 14,
                      fontFamily: AppFonts.ubuntu,
                      fontWeight: FontWeight.w700),
                  cursorHeight: 20,
                  decoration: InputDecoration(
                    enabledBorder: djp.selectedPersonText
                        ? myEnableInputDecoration()
                        : null,
                    focusedBorder: myFocusInputDecoration(),
                    // icon: Icon(Icons.search, color: style.color),
                    suffixIcon: djp.personSearchController.text.isNotEmpty &&
                            djp.selectedPersonText == true
                        ? GestureDetector(
                            child: const Icon(Icons.close,
                                color: AppColors.appBlue),
                            onTap: () {
                              djp.personSearchController.clear();
                              FocusScope.of(context).requestFocus(FocusNode());
                            },
                          )
                        : null,
                    hintText: 'search',

                    // hintStyle: style,
                  ),
                  onChanged: (query) {
                    djp.personSearchBox(query, context);
                  },
                ),
              ),
              Expanded(
                child: djp.personModel.result == false
                    ? const Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        controller: djp.purchasePOScrollController,
                        itemCount:
                            djp.personList.length < djp.currentPersonItems
                                ? djp.personList.length
                                : djp.currentPersonItems,
                        itemBuilder: (context, index) {
                          var item = djp.personList[index];
                          return Container(
                            height: djp.selectedPersonText ? 25 : 0,
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            padding: const EdgeInsets.only(bottom: 5),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: InkWell(
                                onTap: () async {
                                  djp.setPersonText(
                                    id: item.id.toString(),
                                    name: item.name.toString(),
                                    value: false,
                                  );
                                },
                                child: Row(
                                  children: [
                                    Text(
                                      djp.personList[index].name.toString(),
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
