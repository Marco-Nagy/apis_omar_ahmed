import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier {
  var termsCategoryIDCtrl = TextEditingController();
  bool termsCategoryIDIsOpen = false;
  bool activeChecked = false;
  updateActive() {
    activeChecked = !activeChecked;
    notifyListeners();
  }

  onOpenCloseTermsCategoryID() {
    termsCategoryIDIsOpen = !termsCategoryIDIsOpen;
    notifyListeners();
  }
}
