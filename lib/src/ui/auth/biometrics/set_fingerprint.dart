import 'package:debit/src/ui/auth/biometrics/prompt_fingerprint.dart';
import 'package:debit/src/ui/auth/debit_app_bar.dart';
import 'package:debit/src/ui/utils/colors.dart';
import 'package:debit/src/ui/utils/debit_buttons.dart';
import 'package:debit/src/ui/utils/debit_space.dart';
import 'package:debit/src/ui/utils/screen_size.dart';
import 'package:debit/src/ui/utils/texts.dart';
import 'package:flutter/material.dart';

class SetFingerprint extends StatefulWidget {
  @override
  _SetFingerprint createState() => _SetFingerprint();
}

class _SetFingerprint extends State<SetFingerprint> {
  final PromptFingerprint promptFingerprint = PromptFingerprint();
  String message = 'Click button below to set fingerprint';
  bool isProcessing = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DebitAppBar(title: 'Fingeprint Login'),
      body: Center(
          child: Container(
        margin: EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: debitWhite,
          borderRadius: BorderRadius.circular(9),
          boxShadow: [
            BoxShadow(
                blurRadius: 10, color: debitBlack54, offset: Offset(1, 1)),
          ],
        ),
        height: fullHeightSize(context: context) * 0.4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.fingerprint,
              color: debitBlue900,
              size: fullHeightSize(context: context) * 0.08,
            ),
            debitCustomTopMargin(20),
            AnimatedContainer(
              duration: Duration(seconds: 2),
              child: header(
                color: debitBlack87,
                type: 7,
                fontSize: 17,
                text: message,
              ),
            ),
            debitCustomTopMargin(20),
            debitDefaultButton(
              splashColor: debitBlue800,
              height: fullHeightSize(context: context) * 0.06,
              label: 'Set Fingerprint',
              labelColor: debitWhite,
              onTap: () async {
                bool canBiometric = await promptFingerprint.checkBiometrics();
                if (canBiometric) {
                  setState(() {
                    message = "Processing";
                    isProcessing = true;
                  });
                  bool isAuth = await promptFingerprint.authenticate();
                  if (isAuth) {
                    setState(() {
                      message = "Setting Fingerprint Success";
                      isProcessing = false;
                    });
                  } else {
                    setState(() {
                      message = "Setting Fingerprint Failed";
                      isProcessing = false;
                    });
                  }
                } else {
                  message = "You're device does\'nt support fingerprint";
                  isProcessing = false;
                }
              },
            )
          ],
        ),
      )),
    );
  }
}
