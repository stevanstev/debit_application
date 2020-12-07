import 'package:debit/src/ui/utils/colors.dart';
import 'package:debit/src/ui/utils/debit_buttons.dart';
import 'package:debit/src/ui/utils/debit_form.dart';
import 'package:debit/src/ui/utils/debit_space.dart';
import 'package:debit/src/ui/utils/strings.dart';
import 'package:debit/src/ui/utils/texts.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: debitGrey100,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(right: 40, left: 40),
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      header(
                          context: context,
                          text: appName,
                          type: 7,
                          fontSize: 50,
                          color: debitBlue900),
                    ],
                  ),
                  header(
                      context: context,
                      text: appSubName,
                      type: 4,
                      color: debitBlack54),
                  customDebitTopMargin(8),
                  Form(
                      child: Column(
                    children: [
                      debitNumberField(label: phoneNumberLabel, maxLength: 12),
                      customDebitTopMargin(8),
                      debitSecureField(label: passwordLabel),
                      defaultButton(
                          elevation: 8,
                          top: 20,
                          onTap: () {},
                          labelColor: debitWhite,
                          buttonColor: debitBlue900,
                          splashColor: debitBlue800,
                          label: loginButtonLabel,
                          height: MediaQuery.of(context).size.height * 0.06)
                    ],
                  )),
                  customDebitTopMargin(45),
                  header(
                      context: context,
                      text: createdNewLabel,
                      type: 7,
                      fontSize: 13,
                      color: debitBlack54),
                  defaultButton(
                      labelWeight: FontWeight.bold,
                      top: 3,
                      labelSize: 14,
                      onTap: () {},
                      labelColor: debitBlue800,
                      buttonColor: debitTransparent,
                      splashColor: debitBlue800,
                      label: regisButtonLabel,
                      height: MediaQuery.of(context).size.height * 0.03),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
