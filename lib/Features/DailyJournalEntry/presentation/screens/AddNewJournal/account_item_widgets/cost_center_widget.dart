import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../config/themes/colors.dart';
import '../../../../../../config/themes/fonts.dart';
import '../../../providers/daily_journal_provider.dart';
import '../../../widgets/decoration_widgets.dart';
import '../../../widgets/my_icon.dart';
import 'account_item_builder.dart';

class CostCenterWidget extends StatefulWidget {
  const CostCenterWidget({Key? key}) : super(key: key);

  @override
  CostCenterWidgetState createState() => CostCenterWidgetState();
}

class CostCenterWidgetState extends State<CostCenterWidget> {
  TextEditingController costCenterController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                dropDownTitle(title: 'Cost Center'),
                costCenterTextFormField(),
                dropDownDescription(
                    description: 'Cost Center Details & Analysis')
              ],
            ),
          ),
          myIcon(prefixIconImage: 'assets/icons/info_green.png', size: 35),
        ],
      ),
    );
  }

  ///! CostCenter Widgets

}

costCenterTextFormField() {
  return Consumer(
    builder: (context, DailyJournalProvider djp, child) {
      return dropDownTextField(
        onTap: () async {
          djp.getCostCenterList();
          djp.onClickCostCenter();
        },
        widget: Text(
          djp.costCenterCtrl.text.isEmpty
              ? "Select Cost Center"
              : djp.costCenterCtrl.text,
          style: TextStyle(
              color: djp.costCenterCtrl.text.isEmpty
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

class CostCenterDropList extends StatefulWidget {
  const CostCenterDropList({Key? key}) : super(key: key);

  @override
  State<CostCenterDropList> createState() => _CostCenterDropListState();
}

class _CostCenterDropListState extends State<CostCenterDropList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DailyJournalProvider>(
      builder: (context, djp, child) {
        return AnimatedContainer(
          constraints: djp.selectedCostCenterText
              ? const BoxConstraints(maxHeight: 250, maxWidth: 240)
              : const BoxConstraints(
                  minHeight: 0, maxHeight: 250, maxWidth: 240, minWidth: 0),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(width: 1.8, color: AppColors.lightBlue),
              borderRadius: BorderRadius.circular(15)),
          curve: Curves.easeInOutCubicEmphasized,
          duration: const Duration(milliseconds: 1),
          width: djp.selectedCostCenterText ? 250 : 0,
          height: djp.selectedCostCenterText ? null : 0,
          child: Column(
            children: [
              Container(
                height: djp.selectedCostCenterText ? 40 : 0,
                width: djp.selectedCostCenterText ? double.infinity : 0,
                margin: djp.selectedCostCenterText
                    ? const EdgeInsets.fromLTRB(5, 5, 5, 5)
                    : null,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
                child: TextField(
                  controller: djp.costCenterSearchController,
                  style: TextStyle(
                      color: djp.costCenterCtrl.text.isEmpty
                          ? AppColors.textDarkGrey
                          : Colors.black,
                      fontSize: 14,
                      fontFamily: AppFonts.ubuntu,
                      fontWeight: FontWeight.w700),
                  cursorHeight: 20,
                  decoration: InputDecoration(
                    enabledBorder: djp.selectedCostCenterText
                        ? myEnableInputDecoration()
                        : null,
                    focusedBorder: myFocusInputDecoration(),
                    suffixIcon: djp
                                .costCenterSearchController.text.isNotEmpty &&
                            djp.selectedCostCenterText == true
                        ? GestureDetector(
                            child: const Icon(Icons.close,
                                color: AppColors.appBlue),
                            onTap: () {
                              djp.costCenterSearchController.clear();
                              FocusScope.of(context).requestFocus(FocusNode());
                            },
                          )
                        : null,
                    hintText: 'search',
                    alignLabelWithHint: true,

                    // hintStyle: style,
                  ),
                  onChanged: (query) {
                    djp.costCenterSearchBox(query, context);
                  },
                ),
              ),
              Expanded(
                child: ListView.builder(
                  controller: djp.costCenterScrollController,
                  itemCount:
                      djp.costCenterList.length < djp.currentCostCenterItems
                          ? djp.costCenterList.length
                          : djp.currentCostCenterItems,
                  itemBuilder: (context, index) {
                    var item = djp.costCenterList[index];
                    return Container(
                      height: djp.selectedCostCenterText ? 25 : 0,
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      padding: const EdgeInsets.only(bottom: 5),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: InkWell(
                          onTap: () async {
                            djp.setCostCenterText(
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
