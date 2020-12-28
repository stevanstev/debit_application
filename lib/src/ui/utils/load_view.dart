import 'package:debit/src/ui/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadView {
  final BuildContext context;

  LoadView({this.context});

  void showLoad() {
    final spinkit = SpinKitRotatingCircle(
      color: debitWhite,
      size: 50.0,
    );

    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (_) {
          return Center(
            child: spinkit,
          );
        });
  }

  void hideLoad() {
    Navigator.pop(context);
  }
}
