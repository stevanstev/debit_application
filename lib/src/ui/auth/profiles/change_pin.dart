import 'package:debit/src/ui/auth/debit_app_bar.dart';
import 'package:debit/src/ui/utils/colors.dart';
import 'package:debit/src/ui/utils/debit_buttons.dart';
import 'package:debit/src/ui/utils/debit_form.dart';
import 'package:debit/src/ui/utils/debit_space.dart';
import 'package:debit/src/ui/utils/screen_size.dart';
import 'package:debit/src/ui/utils/strings.dart';
import 'package:flutter/material.dart';

class ChangePin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: debitGrey100,
        appBar: DebitAppBar(
          title: 'Change PIN',
        ),
        body: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.only(
                top: 15,
                left: 15,
                right: 15,
                bottom: 15,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: debitWhite,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    color: debitBlack54,
                    offset: Offset(1, 1),
                  ),
                ],
              ),
              child: Column(
                children: [
                  debitNumberField(
                    icon: Icons.fiber_pin,
                    label: pinLabel,
                    maxLength: 6,
                    onChanged: null,
                    initialValue: '******',
                  ),
                  debitCustomTopMargin(20),
                  debitDefaultButton(
                    splashColor: debitBlue900,
                    height: fullHeightSize(context: context) * 0.06,
                    label: 'CHANGE',
                    labelColor: debitWhite,
                    onTap: null,
                  )
                ],
              ),
            )
          ],
        ));
  }
}
