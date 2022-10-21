import 'package:flutter/material.dart';

import '../../../../../utilities/constants.dart';

class FilterBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset(
          "assets/img/open_filter_icon.png",
          width: 13,
          height: 13,
          color: Colors.blue,
        ),
        const VerticalDivider(color: Colors.transparent, width: 5.0),
        const Text(
          'Filter',
          style: TextStyle(
            fontFamily: defaultFont,
            color: Colors.blue,
            fontSize: 15,
            fontWeight: FontWeight.w800,
          ),
        )
      ],
    );
  }
}
