import 'dart:ui';

import 'package:flutter/material.dart';

const String defaultFont = '29LTKaff';
const String defaultFontIcon = 'Baloo';
// ignore: constant_identifier_names
const String UbuntuFont = 'Ubuntu';
// ignore: constant_identifier_names
const String McLarenFont = 'McLaren';

/// url navigation
const String urlSubName = 'https://garas';

const int managerId = 2;
const int inventoryTeamId = 10014;
const int purchasingTeamId = 10015;
const int apiRecallDuration = 60;
const int animationTime = 500;
const int firstDate = 2010;
int lastDate = DateTime.now().year + 10;

const Color lightBlueColor = Color(0xffeefcfd);
const Color blueColor = Color(0xff03a1fe);
const Color darkBlueColor = Color(0xff197093);
const Color secondBlueColor = Color(0xff0053d0);
const Color blueTitleColor = Color(0xff0018af);
const Color greyColor = Color(0xff6b6b6b);
const Color lightGreyColor = Color(0xffeaeaea);
const Color filterGreyColor = Color.fromRGBO(195, 195, 195, 0.25);
const Color yellowColor = Color.fromRGBO(250, 255, 187, 0.25);
const Color pinkColor = Color(0xfff10079);
const Color greenColor = Color(0xff009a05);
const Color redColor = Color.fromRGBO(255, 0, 0, 0.99);
const Color lightGreenColor = Color(0xff01ced1);
const Color filterItemNameColor = Color(0xff000000);

const double paddingSizeWebView = 240;
const double fontLargeSizeMyClientWebView = 30;
const double fontSmallSizeMyClientWebView = 25;
const double fontListSizeMyClientWebView = 18;

const String errorMsg = "An Error has been Occurred, Please try again later.";
const String networkMsg = "Please check Your Internet Connection";

bool navigation = false;

Widget tableDivider = SizedBox(
  height: 35,
  child: VerticalDivider(
    width: 12.0,
    color: Colors.grey.withOpacity(0.50),
  ),
);

Widget resetButton = Container(
  padding: const EdgeInsets.all(8.0),
  decoration: const BoxDecoration(
    color: Colors.red,
    borderRadius: BorderRadius.only(
      topRight: Radius.circular(5.0),
      bottomRight: Radius.circular(25.0),
      topLeft: Radius.circular(25.0),
      bottomLeft: Radius.circular(5.0),
    ),
  ),
  child: const Text(
    "Reset",
    style: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ),
  ),
);

BoxDecoration addButtonDecoration = const BoxDecoration(
  color: Colors.green,
  borderRadius: BorderRadius.only(
    topRight: Radius.circular(5.0),
    bottomRight: Radius.circular(25.0),
    topLeft: Radius.circular(25.0),
    bottomLeft: Radius.circular(5.0),
  ),
);

TextStyle webTitleStyle = const TextStyle(
  fontSize: 22,
  fontWeight: FontWeight.w600,
  color: Color.fromRGBO(75, 131, 240, 0.99),
);

BoxDecoration tablesDecoration = BoxDecoration(
  border: Border.all(
    width: 0.50,
    color: Colors.grey.withOpacity(0.50),
  ),
);

TextStyle addButtonTextStyle = const TextStyle(
  color: Colors.white,
  fontFamily: defaultFont,
  fontSize: 14.0,
  fontWeight: FontWeight.w400,
);

Widget addRowButton = Row(
  children: [
    const Padding(
      padding: EdgeInsets.only(top: 8.0, bottom: 6, left: 8, right: 4),
      child: Icon(
        Icons.add_rounded,
        color: Colors.white,
        size: 25,
      ),
    ),
    Container(
      color: Colors.white,
      height: 40,
      child: const VerticalDivider(
        width: 2,
        color: Colors.white,
      ),
    ),
  ],
);

Widget addButton = Image.asset(
  'assets/img/addButtonIcon.png',
  fit: BoxFit.cover,
  height: 30,
  width: 30,
);

Widget editButton = Container(
  decoration: BoxDecoration(
    color: blueColor,
    borderRadius: BorderRadius.circular(10),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.15),
        spreadRadius: 2,
        blurRadius: 3,
        offset: const Offset(0, 3),
      ),
    ],
  ),
  child: Padding(
    padding: const EdgeInsets.all(4.0),
    child: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Icon(
            Icons.edit_outlined,
            color: Colors.white,
            size: 16,
          ),
        ],
      ),
    ),
  ),
);

Widget addButtonDisable = Image.asset(
  'assets/img/addGrayIcon.png',
  fit: BoxFit.cover,
  height: 30,
  width: 30,
);

Widget textBox(textTextBox) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(7.5),
        bottomRight: Radius.circular(7.5),
        bottomLeft: Radius.circular(7.5),
      ),
      border: Border.all(
        color: Colors.grey,
        width: 1.5,
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          Text(
            textTextBox,
            style: const TextStyle(
              fontFamily: defaultFont,
              fontSize: 14,
              fontWeight: FontWeight.w900,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget titleTextBox(textTextBox) {
  return FittedBox(
    fit: BoxFit.scaleDown,
    alignment: Alignment.centerLeft,
    child: Padding(
      padding: const EdgeInsets.only(left: 12.0),
      child: Text(
        textTextBox,
        style: const TextStyle(
          fontFamily: defaultFont,
          fontSize: 12,
          fontWeight: FontWeight.w900,
          color: Colors.black,
        ),
      ),
    ),
  );
}

Widget titleTextBoxList(textTextBox) {
  return Container(
    decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: Colors.black54.withOpacity(0.10),
          width: 1.0,
        ),
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.all(8),
      child: Text(
        textTextBox,
        style: const TextStyle(
          fontFamily: defaultFont,
          fontSize: 14,
          fontWeight: FontWeight.w900,
          color: Colors.indigo,
        ),
      ),
    ),
  );
}

Widget textBoxList(textTextBox) {
  return Container(
    decoration: BoxDecoration(
      border: Border(
        left: BorderSide(
          color: Colors.black54.withOpacity(0.10),
          width: 1.0,
        ),
        bottom: BorderSide(
          color: Colors.black54.withOpacity(0.10),
          width: 1.0,
        ),
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        textTextBox,
        style: const TextStyle(
          fontFamily: defaultFont,
          fontSize: 14,
          fontWeight: FontWeight.w900,
          color: Colors.black54,
        ),
      ),
    ),
  );
}

BoxDecoration containerDecorationTextForm = BoxDecoration(
  borderRadius: BorderRadius.circular(5),
);

BoxDecoration containerDecorationList = BoxDecoration(
  borderRadius: BorderRadius.circular(10),
  color: Colors.white,
  border: Border.all(
    color: const Color(0xffc1d8fc),
    width: 3.0,
  ),
);

InputDecoration textFormFieldDecoration(textTextLabelFormField) {
  return InputDecoration(
    labelText: textTextLabelFormField,
    labelStyle: const TextStyle(
      fontFamily: defaultFont,
      fontSize: 14,
      fontWeight: FontWeight.w900,
      color: Colors.black,
    ),
    hintStyle: const TextStyle(
      fontFamily: defaultFont,
      fontSize: 16,
      fontWeight: FontWeight.w900,
      color: Colors.black54,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: const BorderSide(
        color: Colors.black54,
        width: 1.0,
      ),
    ),
  );
}

InputDecoration textFormFieldListDecoration(textTextLabelFormField) {
  return InputDecoration(
    hintText: textTextLabelFormField,
    hintStyle: const TextStyle(
      fontFamily: defaultFont,
      fontSize: 16,
      fontWeight: FontWeight.w900,
      color: Colors.black54,
    ),
    prefix: const RotatedBox(
      quarterTurns: 1,
      child: Icon(
        Icons.search,
        color: Colors.black54,
        size: 20,
      ),
    ),
  );
}

/// offers

Widget textBoxHeader(child, boxColor, borderColor) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(7.5),
        bottomRight: Radius.circular(7.5),
        bottomLeft: Radius.circular(7.5),
      ),
      border: Border.all(color: borderColor, width: 2),
      color: boxColor,
    ),
    child: child,
  );
}

Widget box(textTextBox, boxColor) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(2),
        topRight: Radius.circular(2),
        topLeft: Radius.circular(18),
        bottomRight: Radius.circular(18),
      ),
      color: boxColor,
    ),
    child: Center(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            textTextBox,
            style: const TextStyle(
              fontFamily: defaultFont,
              fontSize: 11,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
        ),
      ),
    ),
  );
}

VerticalDivider vDivider = const VerticalDivider(
  color: Colors.transparent,
  width: 15,
);

TextStyle styleOfferTitle(color) {
  return TextStyle(
    fontFamily: defaultFont,
    fontSize: 18,
    fontWeight: FontWeight.w900,
    color: color,
  );
}

Divider hDivider = const Divider(
  color: Colors.transparent,
  height: 5,
);

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

double offerWidth = 350;
double offerHeight = 50;
double offerSmaleTitleHeight = 35;

TextStyle barCodeTextStyle = const TextStyle(
  fontWeight: FontWeight.w600,
  color: Colors.black,
  fontSize: 12,
);

TextStyle rejectedBarCodeTextStyle = const TextStyle(
  fontWeight: FontWeight.w600,
  color: redColor,
  fontSize: 12,
  decoration: TextDecoration.lineThrough,
);

TextStyle projectNameTextStyle = const TextStyle(
  fontWeight: FontWeight.w400,
  color: Colors.black,
  fontSize: 13,
);

TextStyle rejectedProjectNameTextStyle = const TextStyle(
  fontWeight: FontWeight.w400,
  color: redColor,
  fontSize: 13,
  decoration: TextDecoration.lineThrough,
);

TextStyle groupNameTextStyle = const TextStyle(
  fontWeight: FontWeight.w900,
  color: Colors.black,
  fontSize: 13,
);

TextStyle dueDateAndApprovedTextStyle = const TextStyle(
  color: Colors.black,
  fontSize: 13,
  fontWeight: FontWeight.w900,
);

TextStyle dateTextStyle = const TextStyle(
  color: Colors.black45,
  fontSize: 13,
  fontWeight: FontWeight.w900,
);

/// toolTip
Widget toolTip(message, child) {
  return Tooltip(
    message: message,
    textStyle: const TextStyle(fontSize: 14, color: Colors.white),
    decoration: const BoxDecoration(
      color: Colors.black54,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(120),
        bottomRight: Radius.circular(120),
        topRight: Radius.circular(20),
        bottomLeft: Radius.circular(20),
      ),
    ),
    enableFeedback: true,
    padding: const EdgeInsets.all(4),
    child: child,
  );
}

Widget sideMenuIcon = RotatedBox(
  quarterTurns: 2,
  child: Image.asset(
    "assets/img/flutter-logo.png",
    height: 18,
  ),
);
