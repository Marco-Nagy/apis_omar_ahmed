import 'package:apis_omar_ahmed/Features/DailyJournalEntry/presentation/providers/daily_journal_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../config/themes/colors.dart';
import '../../../../../../config/themes/fonts.dart';
import '../../../widgets/decoration_widgets.dart';
import '../../../widgets/my_icon.dart';
import 'account_item_builder.dart';

class ClientWidget extends StatefulWidget {
  const ClientWidget({Key? key}) : super(key: key);

  @override
  ClientWidgetState createState() => ClientWidgetState();
}

class ClientWidgetState extends State<ClientWidget> {
  TextEditingController clientController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                dropDownTitle(title: 'Client'),
                Row(
                  children: [
                    Expanded(
                      child: clientTextFormField(),
                    ),
                    myIcon(
                        prefixIconImage: 'assets/icons/info_red.png', size: 35),
                  ],
                ),
                dropDownDescription(description: 'Client Accounts Report')
              ],
            ),
          ),
        ],
      ),
    );
  }
}

///! Client Widgets
clientTextFormField() {
  return Consumer(
    builder: (context, DailyJournalProvider djp, child) {
      return dropDownTextField(
        onTap: () async {
          djp.onClickClient();
          djp.getClientList();
        },
        widget: Text(
          djp.clientCtrl.text.isEmpty ? "Select Client" : djp.clientCtrl.text,
          style: TextStyle(
              color: djp.clientCtrl.text.isEmpty
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

class ClientDropList extends StatefulWidget {
  const ClientDropList({Key? key}) : super(key: key);

  @override
  State<ClientDropList> createState() => _ClientDropListState();
}

class _ClientDropListState extends State<ClientDropList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DailyJournalProvider>(
      builder: (context, djp, child) {
        return AnimatedContainer(
          constraints: djp.selectedClientText
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
          width: djp.selectedClientText ? 250 : 0,
          height: djp.selectedClientText ? null : 0,
          child: Column(
            children: [
              Container(
                height: djp.selectedClientText ? 40 : 0,
                width: djp.selectedClientText ? double.infinity : 0,
                margin: djp.selectedClientText
                    ? const EdgeInsets.fromLTRB(5, 5, 5, 5)
                    : null,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
                child: TextField(
                  controller: djp.clientSearchController,
                  style: TextStyle(
                      color: djp.clientCtrl.text.isEmpty
                          ? AppColors.textDarkGrey
                          : Colors.black,
                      fontSize: 14,
                      fontFamily: AppFonts.ubuntu,
                      fontWeight: FontWeight.w700),
                  cursorHeight: 20,
                  decoration: InputDecoration(
                    enabledBorder: djp.selectedClientText
                        ? myEnableInputDecoration()
                        : null,
                    focusedBorder: myFocusInputDecoration(),
                    suffixIcon: djp.clientSearchController.text.isNotEmpty &&
                            djp.selectedClientText == true
                        ? GestureDetector(
                            child: const Icon(Icons.close,
                                color: AppColors.appBlue),
                            onTap: () {
                              djp.clientSearchController.clear();
                              FocusScope.of(context).requestFocus(FocusNode());
                            },
                          )
                        : null,
                    hintText: 'search',
                    alignLabelWithHint: true,
                  ),
                  onChanged: (query) {
                    djp.clientsSearchBox(query, context);
                  },
                ),
              ),
              Expanded(
                child: djp.clientModel.result == false
                    ? const Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        controller: djp.clientScrollController,
                        itemCount:
                            djp.clientList.length < djp.currentClientItems
                                ? djp.clientList.length
                                : djp.currentClientItems,
                        itemBuilder: (context, index) {
                          var item = djp.clientList[index];
                          return Container(
                            height: djp.selectedClientText ? 25 : 0,
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            padding: const EdgeInsets.only(bottom: 5),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: InkWell(
                                onTap: () async {
                                  djp.setClientText(
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
