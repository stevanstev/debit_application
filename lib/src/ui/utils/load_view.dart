import 'package:flutter/material.dart';

class LoadView {
  final BuildContext context;

  LoadView({this.context});

  void showLoad() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (_) {
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  void hideLoad() {
    Navigator.pop(context);
  }
}
