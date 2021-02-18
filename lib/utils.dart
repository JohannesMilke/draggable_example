import 'package:flutter/material.dart';
import 'package:flushbar/flushbar.dart';

class Utils {
  static final List<Flushbar> flushBars = [];

  static void showSnackBar(
    BuildContext context, {
    @required String text,
    @required Color color,
  }) =>
      _show(
        context,
        Flushbar(
          //padding: EdgeInsets.all(24),
          messageText: Center(
              child: Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: 24),
          )),
          duration: Duration(seconds: 3),
          flushbarPosition: FlushbarPosition.TOP,
          backgroundColor: color,
          animationDuration: Duration(microseconds: 0),
        ),
      );

  static Future _show(BuildContext context, Flushbar newFlushBar) async {
    await Future.wait(flushBars.map((flushBar) => flushBar.dismiss()).toList());
    flushBars.clear();

    newFlushBar.show(context);
    flushBars.add(newFlushBar);
  }
}
