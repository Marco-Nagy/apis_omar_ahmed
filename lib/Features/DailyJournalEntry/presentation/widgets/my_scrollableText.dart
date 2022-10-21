import 'package:flutter/material.dart';

import 'my_custom_scrollBehavior.dart';

myScrollableText(Widget widget) {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    scrollBehavior: MyCustomScrollBehavior(),
    builder: (context, child) {
      return DefaultTextStyle(
        style: const TextStyle(decoration: TextDecoration.none),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: widget,
        ),
      );
    },
  );
}
