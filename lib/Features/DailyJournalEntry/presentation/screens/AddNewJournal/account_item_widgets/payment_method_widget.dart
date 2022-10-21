import 'package:apis_omar_ahmed/config/media_query_values.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../config/themes/colors.dart';
import '../../../../../../config/themes/fonts.dart';
import '../../../providers/daily_journal_provider.dart';
import '../../../widgets/my_icon.dart';
import 'account_item_builder.dart';

class PaymentMethodWidget extends StatefulWidget {
  const PaymentMethodWidget({Key? key}) : super(key: key);

  @override
  State<PaymentMethodWidget> createState() => PaymentMethodWidgetState();
}

class PaymentMethodWidgetState extends State<PaymentMethodWidget> {
  TextEditingController paymentMethodNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        dropDownTitle(title: 'paymentMethod'),
        Row(
          children: [
            Expanded(
              child: paymentMethodTextFormField(),
            ),
            myIcon(prefixIconImage: 'assets/icons/check.png', size: 30),
          ],
        ),
        dropDownDescription(
            description:
                'Confirmed by:                           in:    /   /   .')
      ],
    );
  }
}

///! payment Method Widgets
paymentMethodTextFormField() {
  return Consumer(
    builder: (context, DailyJournalProvider djp, child) {
      return dropDownTextField(
        onTap: () async {
          djp.onClickPaymentMethod();
          djp.getPaymentMethodList();
        },
        widget: Text(
          djp.paymentMethodNameCtrl.text.isEmpty
              ? "Select payment Method"
              : djp.paymentMethodNameCtrl.text,
          style: TextStyle(
              color: djp.paymentMethodNameCtrl.text.isEmpty
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

class PaymentMethodDropList extends StatefulWidget {
  const PaymentMethodDropList({Key? key}) : super(key: key);

  @override
  State<PaymentMethodDropList> createState() => _PaymentMethodDropListState();
}

class _PaymentMethodDropListState extends State<PaymentMethodDropList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DailyJournalProvider>(
      builder: (context, djp, child) {
        return AnimatedContainer(
          constraints: djp.selectedPaymentMethodText
              ? const BoxConstraints(maxHeight: 70, maxWidth: 240)
              : const BoxConstraints(
                  minHeight: 0, maxHeight: 60, maxWidth: 240, minWidth: 0),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(width: 1.8, color: AppColors.lightBlue),
              borderRadius: BorderRadius.circular(15)),
          curve: Curves.easeInOutCubicEmphasized,
          duration: const Duration(milliseconds: 1),
          width: djp.selectedPaymentMethodText ? context.width / 4 : 0,
          height: djp.selectedPaymentMethodText ? null : 0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: ListView.builder(
                  //controller: djp.clientScrollController,
                  itemCount: djp.paymentMethodModel.dDLList.length,
                  itemBuilder: (context, index) {
                    var item = djp.paymentMethodModel.dDLList[index];
                    return Container(
                      height: djp.selectedPaymentMethodText ? 25 : 0,
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      padding: const EdgeInsets.only(bottom: 5),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: InkWell(
                          onTap: () async {
                            djp.setPaymentMethodText(
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
