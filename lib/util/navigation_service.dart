import 'package:flutter/cupertino.dart';

class NavigationService {
  static final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();

  static final GlobalKey<NavigatorState> mainScreenTabKey =
      new GlobalKey<NavigatorState>();

  static void navigateTo(Widget route) {
    navigatorKey.currentState.pushReplacement(CupertinoPageRoute(builder: (context) => route));
  }

  static void getBack() {
    navigatorKey.currentState.pop();
  }

  static void returnToInitialTabScreen(String name) {
    navigatorKey.currentState.popUntil(ModalRoute.withName(name));
  }
}