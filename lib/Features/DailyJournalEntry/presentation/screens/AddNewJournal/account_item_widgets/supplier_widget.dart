import 'package:apis_omar_ahmed/Features/DailyJournalEntry/presentation/providers/daily_journal_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../config/themes/colors.dart';
import '../../../../../../config/themes/fonts.dart';
import '../../../widgets/decoration_widgets.dart';
import '../../../widgets/my_icon.dart';
import 'account_item_builder.dart';

class SupplierWidget extends StatefulWidget {
  const SupplierWidget({Key? key}) : super(key: key);

  @override
  SupplierWidgetState createState() => SupplierWidgetState();
}

class SupplierWidgetState extends State<SupplierWidget> {
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
                dropDownTitle(title: 'Supplier'),
                supplierTextFormField(),
                dropDownDescription(description: 'Supplier Accounts Report')
              ],
            ),
          ),
          myIcon(prefixIconImage: 'assets/icons/info_red.png', size: 35),
        ],
      ),
    );
  }
}

///! Supplier Widgets
supplierTextFormField() {
  return Consumer(
    builder: (context, DailyJournalProvider djp, child) {
      return dropDownTextField(
        onTap: () async {
          await djp.onClickSupplier();
          await djp.getSupplierList();
        },
        widget: Text(
          djp.supplierCtrl.text.isEmpty
              ? "Select Supplier"
              : djp.supplierCtrl.text,
          style: TextStyle(
              color: djp.supplierCtrl.text.isEmpty
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

class SupplierDropList extends StatefulWidget {
  const SupplierDropList({Key? key}) : super(key: key);

  @override
  State<SupplierDropList> createState() => _SupplierDropListState();
}

class _SupplierDropListState extends State<SupplierDropList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DailyJournalProvider>(
      builder: (context, djp, child) {
        return AnimatedContainer(
          constraints: djp.selectedSupplierText
              ? const BoxConstraints(maxHeight: 250, minWidth: 0, maxWidth: 0)
              : const BoxConstraints(
                  minHeight: 0,
                  maxHeight: 250,
                ),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(width: 1.8, color: AppColors.lightBlue),
              borderRadius: BorderRadius.circular(15)),
          curve: Curves.easeInOutCubicEmphasized,
          duration: const Duration(milliseconds: 1),
          width: djp.selectedSupplierText ? 250 : 0,
          height: djp.selectedSupplierText ? null : 0,
          child: Column(
            children: [
              Container(
                height: djp.selectedSupplierText ? 40 : 0,
                width: djp.selectedSupplierText ? double.infinity : 0,
                margin: djp.selectedSupplierText
                    ? const EdgeInsets.fromLTRB(5, 5, 5, 5)
                    : null,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
                child: TextField(
                  controller: djp.supplierSearchController,
                  style: TextStyle(
                      color: djp.supplierCtrl.text.isEmpty
                          ? AppColors.textDarkGrey
                          : Colors.black,
                      fontSize: 14,
                      fontFamily: AppFonts.ubuntu,
                      fontWeight: FontWeight.w700),
                  cursorHeight: 20,
                  decoration: InputDecoration(
                    enabledBorder: djp.selectedSupplierText
                        ? myEnableInputDecoration()
                        : null,
                    focusedBorder: myFocusInputDecoration(),
                    suffixIcon: djp.supplierSearchController.text.isNotEmpty &&
                            djp.selectedSupplierText == true
                        ? GestureDetector(
                            child: const Icon(Icons.close,
                                color: AppColors.appBlue),
                            onTap: () {
                              djp.supplierSearchController.clear();
                              FocusScope.of(context).requestFocus(FocusNode());
                            },
                          )
                        : null,
                    hintText: 'search',
                    alignLabelWithHint: true,
                  ),
                  onChanged: (query) {
                    djp.supplierSearchBox(query, context);
                  },
                ),
              ),
              Expanded(
                child: djp.supplierModel.result == false
                    ? const Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        controller: djp.projectScrollController,
                        itemCount:
                            djp.supplierList.length < djp.currentSupplierItems
                                ? djp.supplierList.length
                                : djp.currentSupplierItems,
                        itemBuilder: (context, index) {
                          var item = djp.supplierList[index];
                          return Container(
                            height: djp.selectedSupplierText ? 25 : 0,
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            padding: const EdgeInsets.only(bottom: 5),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: InkWell(
                                onTap: () {
                                  djp.setSupplierText(
                                    name: item.name,
                                    id: item.id,
                                    value: false,
                                  );

                                  // print('supplierId ${djp.supplierId}');
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
