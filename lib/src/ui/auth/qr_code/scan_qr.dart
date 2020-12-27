import 'package:debit/src/ui/auth/debit_app_bar.dart';
import 'package:debit/src/ui/utils/colors.dart';
import 'package:debit/src/ui/utils/debit_buttons.dart';
import 'package:debit/src/ui/utils/screen_size.dart';
import 'package:debit/src/ui/utils/strings.dart';
import 'package:flutter/material.dart';

class ScanQr extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DebitAppBar(title: transferLabel),
      body: Center(
        child: debitDefaultButton(
            elevation: 5,
            buttonColor: debitBlue900,
            splashColor: debitBlue800,
            height: fullHeightSize(context: context) * 0.08,
            width: fullWidthSize(context: context) * 0.5,
            label: scanQrLabel,
            labelColor: debitWhite,
            onTap: () {}),
      ),
    );
  }
}
