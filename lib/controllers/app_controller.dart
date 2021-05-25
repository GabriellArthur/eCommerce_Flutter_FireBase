import 'package:flutter/cupertino.dart';

class AppController extends ChangeNotifier {
  static AppController instance = AppController();
  bool isDartTheme = true;
  changeTheme() {
    print('Dark');
    isDartTheme = !isDartTheme;
    notifyListeners();
  }
}
