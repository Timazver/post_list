import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppUtils {
  static String token = "";
  static SharedPreferences prefs;

  static String refresh = "";

  static Future<bool> clearPrefs() async {
    await prefs.remove("TOKEN");
    await prefs.remove("PIN");
    await prefs.remove("BIOMETRY_GRANTED");
    return true;
  }


  static Future<void> init() async {
    // checkConnection();
    prefs = await SharedPreferences.getInstance();
  }


  static void showMessage(BuildContext context, String title, String text,
      {void Function() onSubmit}) {
    showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
              title: Text(title),
              content: Text(text),
              actions: <Widget>[
                FlatButton(
                  child:
                      Center(child: Text("Ок", style: TextStyle(fontSize: 18))),
                  onPressed: () => onSubmit == null
                      ? Navigator.of(context).pop()
                      : {
                        Navigator.of(context).pop(), 
                      onSubmit()
                      },
                )
              ],
            ));
  }
  
  static void exitApp() {
    exit(0);
  }
  
}
