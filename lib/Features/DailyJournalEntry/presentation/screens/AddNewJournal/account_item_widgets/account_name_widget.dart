import 'package:apis_omar_ahmed/Features/DailyJournalEntry/presentation/providers/daily_journal_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../config/themes/colors.dart';
import '../../../../../../config/themes/fonts.dart';
import '../../../widgets/decoration_widgets.dart';
import 'account_item_builder.dart';

class AccountNameWidget extends StatefulWidget {
  const AccountNameWidget({Key? key}) : super(key: key);

  @override
  AccountNameWidgetState createState() => AccountNameWidgetState();
}

class AccountNameWidgetState extends State<AccountNameWidget> {
  TextEditingController accountNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<DailyJournalProvider>(
      builder: (context, djp, child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FittedBox(
              fit: BoxFit.scaleDown,
              child: dropDownTitle(title: 'from \\ To Account'),
            ),
            fromToAccountTextFormField(),
            dropDownDescription(
              description: djp.accountNameCtrl.text.isNotEmpty
                  ? 'Account Category : ${djp.accountCategory}'
                  : 'Account Category :  ',
            ),
          ],
        );
      },
    );
  }
}

///! from To Accounts Widgets

fromToAccountTextFormField() {
  return Consumer(
    builder: (context, DailyJournalProvider djp, child) {
      return dropDownTextField(
        onTap: () async {
          djp.onClickFromToAccount();
          djp.getAccountList();
        },
        widget: Text(
          djp.accountNameCtrl.text.isEmpty
              ? "Select fromToAccount"
              : djp.accountNameCtrl.text,
          style: TextStyle(
              color: djp.accountNameCtrl.text.isEmpty
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

class FromToAccountDropList extends StatefulWidget {
  const FromToAccountDropList({Key? key}) : super(key: key);

  @override
  State<FromToAccountDropList> createState() => _FromToAccountDropListState();
}

class _FromToAccountDropListState extends State<FromToAccountDropList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DailyJournalProvider>(
      builder: (context, djp, child) {
        return AnimatedContainer(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 1.8, color: AppColors.lightBlue),
            borderRadius: BorderRadius.circular(15),
          ),
          duration: const Duration(milliseconds: 1),
          height: djp.selectedFromToAccountText ? 300 : 0,
          child: Column(
            children: [
              Container(
                height: djp.selectedFromToAccountText ? 40 : 0,
                width: djp.selectedFromToAccountText ? double.infinity : 0,
                margin: djp.selectedFromToAccountText
                    ? const EdgeInsets.fromLTRB(5, 5, 5, 5)
                    : null,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
                child: TextField(
                  controller: djp.accountNameSearchController,
                  style: TextStyle(
                      color: djp.accountNameCtrl.text.isEmpty
                          ? AppColors.textDarkGrey
                          : Colors.black,
                      fontSize: 14,
                      fontFamily: AppFonts.ubuntu,
                      fontWeight: FontWeight.w700),
                  cursorHeight: 20,
                  decoration: InputDecoration(
                    enabledBorder: djp.selectedFromToAccountText
                        ? myEnableInputDecoration()
                        : null,
                    focusedBorder: myFocusInputDecoration(),
                    suffixIcon: djp
                                .accountNameSearchController.text.isNotEmpty &&
                            djp.selectedFromToAccountText == true
                        ? GestureDetector(
                            child: const Icon(
                              Icons.close,
                              color: AppColors.appBlue,
                            ),
                            onTap: () {
                              djp.accountNameSearchController.clear();
                              FocusScope.of(context).requestFocus(FocusNode());
                            },
                          )
                        : null,
                    hintText: 'search',
                  ),
                  onChanged: (query) {
                    djp.accountsSearchBox(query, context);
                  },
                ),
              ),
              Expanded(
                child: djp.accountListModel.result == false
                    ? const Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        controller: djp.accountScrollController,
                        itemCount: djp.accountItems > djp.accountList.length
                            ? djp.accountList.length
                            : djp.accountItems,
                        itemBuilder: (context, index) {
                          var item = djp.accountList[index];
                          return Container(
                            height: djp.selectedFromToAccountText ? 25 : 0,
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            padding: const EdgeInsets.only(bottom: 5),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: InkWell(
                                onTap: () {
                                  djp.setFromToAccountText(
                                    id: item.iD.toString(),
                                    currency: item.currencyName.toString(),
                                    name: item.accountName.toString(),
                                    type: item.accountTypeName.toString(),
                                    accNumber: item.accountNumber.toString(),
                                    category: item.categoryName.toString(),
                                    value: false,
                                  );
                                },
                                child: Row(
                                  children: [
                                    Text(
                                      djp.accountList[index].accountNumber
                                          .toString(),
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: AppFonts.ubuntu,
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      djp.accountList[index].accountName
                                          .toString(),
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
