import 'package:apis_omar_ahmed/Features/DailyJournalEntry/presentation/providers/daily_journal_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../config/themes/colors.dart';
import '../../../../../../config/themes/fonts.dart';
import '../../../widgets/decoration_widgets.dart';
import 'account_item_builder.dart';

class TypeWidget extends StatefulWidget {
  const TypeWidget({Key? key}) : super(key: key);

  @override
  TypeWidgetState createState() => TypeWidgetState();
}

class TypeWidgetState extends State<TypeWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, DailyJournalProvider djp, child) {
        return Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              dropDownTitle(
                  title: djp.accountCategory == "Income"
                      ? 'Income Type'
                      : djp.accountCategory == "Expenses"
                          ? 'Expenses Type'
                          : 'Type'),
              typeTextField(),
              const SizedBox(
                height: 12,
              ),
            ],
          ),
        );
      },
    );
  }

  ///! Type Widgets
  typeTextField() {
    return Consumer(
      builder: (context, DailyJournalProvider djp, child) {
        return dropDownTextField(
          onTap: () async {
            djp.getIncExpTypeList(djp.accountId);
            djp.onClickType();
          },
          widget: Text(
            djp.typeNameCtrl.text.isEmpty
                ? "Select Type"
                : djp.typeNameCtrl.text,
            style: TextStyle(
                color: djp.typeNameCtrl.text.isEmpty
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
}

class TypeDropList extends StatefulWidget {
  const TypeDropList({Key? key}) : super(key: key);

  @override
  State<TypeDropList> createState() => _TypeDropListState();
}

class _TypeDropListState extends State<TypeDropList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DailyJournalProvider>(
      builder: (context, djp, child) {
        return AnimatedContainer(
          constraints: djp.selectedTypeText
              ? const BoxConstraints(maxHeight: 250, maxWidth: 220)
              : const BoxConstraints(
                  minHeight: 0, maxHeight: 250, maxWidth: 220, minWidth: 0),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(width: 1.8, color: AppColors.lightBlue),
              borderRadius: BorderRadius.circular(15)),
          curve: Curves.easeInOutCubicEmphasized,
          duration: const Duration(milliseconds: 1),
          width: djp.selectedTypeText ? double.infinity : 0,
          height: djp.selectedTypeText ? null : 0,
          child: Column(
            children: [
              Container(
                height: djp.selectedTypeText ? 40 : 0,
                width: djp.selectedTypeText ? double.infinity : 0,
                margin: djp.selectedTypeText
                    ? const EdgeInsets.fromLTRB(5, 5, 5, 5)
                    : null,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
                child: TextField(
                  controller: djp.typeSearchController,
                  style: TextStyle(
                      color: djp.typeNameCtrl.text.isEmpty
                          ? AppColors.textDarkGrey
                          : Colors.black,
                      fontSize: 14,
                      fontFamily: AppFonts.ubuntu,
                      fontWeight: FontWeight.w700),
                  cursorHeight: 20,
                  decoration: InputDecoration(
                    enabledBorder:
                        djp.selectedTypeText ? myEnableInputDecoration() : null,
                    focusedBorder: myFocusInputDecoration(),
                    // icon: Icon(Icons.search, color: style.color),
                    suffixIcon: djp.typeSearchController.text.isNotEmpty &&
                            djp.selectedTypeText == true
                        ? GestureDetector(
                            child: const Icon(Icons.close,
                                color: AppColors.appBlue),
                            onTap: () {
                              djp.typeSearchController.clear();
                              FocusScope.of(context).requestFocus(FocusNode());
                            },
                          )
                        : null,
                    hintText: 'search',
                    // hintStyle: style,
                  ),
                  // style: style,
                  onChanged: (query) {
                    djp.incExpTypeSearchBox(query, context);
                  },
                ),
              ),
              Expanded(
                child: djp.incOrExpTypeListModel.result == false
                    ? const Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        controller: djp.incOrExpTypeScrollController,
                        itemCount:
                            djp.incOrExpTypeItems > djp.incExpTypeList.length
                                ? djp.incExpTypeList.length
                                : djp.incOrExpTypeItems,
                        itemBuilder: (context, index) {
                          return Container(
                            height: djp.selectedTypeText ? 25 : 0,
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            padding: const EdgeInsets.only(bottom: 5),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: InkWell(
                                onTap: () {
                                  djp.setTypeText(
                                      typeName: djp.incExpTypeList[index].name
                                          .toString(),
                                      value: false);
                                },
                                child: Row(
                                  children: [
                                    Text(
                                      djp.incExpTypeList[index].name.toString(),
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
