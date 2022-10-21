import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../../../config/themes/colors.dart';
import '../../../../../../../../config/themes/fonts.dart';
import '../../../providers/daily_journal_provider.dart';
import '../../../widgets/decoration_widgets.dart';
import '../../../widgets/my_icon.dart';
import 'account_item_builder.dart';

class PurchasePOWidget extends StatefulWidget {
  const PurchasePOWidget({Key? key}) : super(key: key);

  @override
  PurchasePOWidgetState createState() => PurchasePOWidgetState();
}

class PurchasePOWidgetState extends State<PurchasePOWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DailyJournalProvider>(
      builder: (context, djp, child) {
        if (djp.supplierCtrl.text.isNotEmpty && djp.supplierId.isNotEmpty) {
          return Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      dropDownTitle(title: 'PurchasePO'),
                      purchasePOTextFormField(),
                      dropDownDescription(description: 'PurchasePO Details'),
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

///! PurchasePO Widgets
purchasePOTextFormField() {
  return Consumer(
    builder: (context, DailyJournalProvider djp, child) {
      return dropDownTextField(
        onTap: () async {
          djp.onClickPurchasePO();
          djp.getPurchasePOList(djp.supplierId.toString());
        },
        widget: Text(
          djp.purchasePOCtrl.text.isEmpty
              ? "Select PurchasePO"
              : djp.purchasePOCtrl.text,
          style: TextStyle(
              color: djp.purchasePOCtrl.text.isEmpty
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

class PurchasePODropList extends StatefulWidget {
  const PurchasePODropList({Key? key}) : super(key: key);

  @override
  State<PurchasePODropList> createState() => _PurchasePODropListState();
}

class _PurchasePODropListState extends State<PurchasePODropList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DailyJournalProvider>(
      builder: (context, djp, child) {
        return AnimatedContainer(
          constraints: djp.selectedPurchasePOText
              ? const BoxConstraints(maxHeight: 250, maxWidth: 240)
              : const BoxConstraints(
                  minHeight: 0, maxHeight: 250, maxWidth: 240, minWidth: 0),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(width: 1.8, color: AppColors.lightBlue),
              borderRadius: BorderRadius.circular(15)),
          curve: Curves.easeInOutCubicEmphasized,
          duration: const Duration(milliseconds: 1),
          width: djp.selectedPurchasePOText ? double.infinity : 0,
          height: djp.selectedPurchasePOText ? null : 0,
          child: Column(
            children: [
              Container(
                height: djp.selectedPurchasePOText ? 40 : 0,
                width: djp.selectedPurchasePOText ? double.infinity : 0,
                margin: djp.selectedPurchasePOText
                    ? const EdgeInsets.fromLTRB(5, 5, 5, 5)
                    : null,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
                child: TextField(
                  controller: djp.purchasePOSearchController,
                  style: TextStyle(
                      color: djp.purchasePOCtrl.text.isEmpty
                          ? AppColors.textDarkGrey
                          : Colors.black,
                      fontSize: 14,
                      fontFamily: AppFonts.ubuntu,
                      fontWeight: FontWeight.w700),
                  cursorHeight: 20,
                  decoration: InputDecoration(
                    enabledBorder: djp.selectedPurchasePOText
                        ? myEnableInputDecoration()
                        : null,
                    focusedBorder: myFocusInputDecoration(),
                    suffixIcon: djp
                                .purchasePOSearchController.text.isNotEmpty &&
                            djp.selectedPurchasePOText == true
                        ? GestureDetector(
                            child: const Icon(Icons.close,
                                color: AppColors.appBlue),
                            onTap: () {
                              djp.purchasePOSearchController.clear();
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
                child: djp.purchasePOModel.result == false
                    ? const Center(child: CircularProgressIndicator())
                    : djp.purchasePOList.isEmpty
                        ? Center(
                            child: Text(
                              "No PurchasePO Data",
                              style: TextStyle(
                                  color: djp.projectCtrl.text.isEmpty
                                      ? AppColors.textDarkGrey
                                      : Colors.black,
                                  fontSize: 18,
                                  fontFamily: AppFonts.ubuntu,
                                  fontWeight: FontWeight.w900),
                            ),
                          )
                        : ListView.builder(
                            controller: djp.purchasePOScrollController,
                            itemCount: djp.purchasePOList.length <
                                    djp.currentPurchasePOItems
                                ? djp.purchasePOList.length
                                : djp.currentPurchasePOItems,
                            itemBuilder: (context, index) {
                              var item = djp.purchasePOList[index];
                              return Container(
                                height: djp.selectedPurchasePOText ? 25 : 0,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                padding: const EdgeInsets.only(bottom: 5),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: InkWell(
                                    onTap: () async {
                                      djp.setPurchasePOText(
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
