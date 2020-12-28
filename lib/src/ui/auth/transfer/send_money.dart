import 'package:debit/src/ui/auth/debit_app_bar.dart';
import 'package:debit/src/ui/utils/colors.dart';
import 'package:debit/src/ui/utils/debit_buttons.dart';
import 'package:debit/src/ui/utils/debit_form.dart';
import 'package:debit/src/ui/utils/debit_space.dart';
import 'package:debit/src/ui/utils/screen_size.dart';
import 'package:debit/src/ui/utils/strings.dart';
import 'package:debit/src/ui/utils/texts.dart';
import 'package:flutter/material.dart';

class SendMoney extends StatelessWidget {
  final Map<String, dynamic> accountData;

  SendMoney({this.accountData});

  String moneyFormatter(String money) {
    return money;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: debitWhite,
      appBar: DebitAppBar(title: 'Transfer Money'),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: 30,
              left: 15,
              right: 15,
              bottom: 30,
            ),
            decoration: BoxDecoration(
              color: debitWhite,
            ),
            child: Column(
              children: [
                header(
                  color: debitBlack87,
                  type: 7,
                  fontSize: 19,
                  text: 'Account Info',
                ),
                debitCustomTopMargin(10),
                debitNumberField(
                  initialValue: '${accountData['accountNumber']}',
                  icon: Icons.local_atm,
                  label: 'Debit Number',
                  maxLength: 12,
                  readOnly: true,
                ),
                debitCustomTopMargin(10),
                debitTextField(
                    initialValue: '${accountData['accountName']}',
                    icon: Icons.person,
                    label: 'Name',
                    maxLength: 30,
                    readOnly: true),
                debitCustomTopMargin(10),
                debitNumberField(
                  icon: Icons.monetization_on,
                  initialValue: '0',
                  label: 'Amount',
                  maxLength: 12,
                ),
                debitCustomTopMargin(10),
                debitTextField(
                  initialValue: '',
                  icon: Icons.text_format,
                  label: 'Description',
                  maxLength: 30,
                ),
                debitCustomTopMargin(20),
                debitDefaultButton(
                    splashColor: debitBlue800,
                    height: fullHeightSize(context: context) * 0.06,
                    label: 'Send',
                    labelColor: debitWhite,
                    onTap: null)
              ],
            ),
          )
        ],
      ),
    );
  }
}
