import 'package:apis_omar_ahmed/Features/Settings/presentation/providers/settingsProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../utilities/constants.dart';
import '../../../../../widgets/loader.dart';

class TermsCategoryIdDropList extends StatelessWidget {
  const TermsCategoryIdDropList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, SettingsProvider sp, child) {
        return AnimatedContainer(
          duration: const Duration(seconds: 1),
          height: sp.termsCategoryIDIsOpen ? null : 0,
          child: Container(
            height: 150,
            decoration: containerDecorationList,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: [
                  false
                      ? const Expanded(child: Loader())
                      : Expanded(
                          child: ListView.builder(
                            shrinkWrap: sp.termsCategoryIDIsOpen,
                            padding: EdgeInsets.zero,
                            itemCount: 4,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      // setState(() {
                                      //   // sp.areaAddNewClient.text = sp
                                      //   //     .filteredAreaListAddNewClient[
                                      //   //         index]
                                      //   //     .name;
                                      //   // sp.areaIdKey = sp
                                      //   //     .filteredAreaListAddNewClient[
                                      //   //         index]
                                      //   //     .id;
                                      // });
                                      sp.onOpenCloseTermsCategoryID();
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 5.0, right: 5.0, bottom: 8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: const [
                                          Expanded(
                                            child: FittedBox(
                                              fit: BoxFit.scaleDown,
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                'Salary Type',
                                                style: TextStyle(
                                                  fontFamily: defaultFont,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color(0xff000000),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
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
