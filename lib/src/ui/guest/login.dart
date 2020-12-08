import 'package:debit/src/blocs/auth_bloc.dart';
import 'package:debit/src/ui/guest/register.dart';
import 'package:debit/src/ui/utils/colors.dart';
import 'package:debit/src/ui/utils/debit_buttons.dart';
import 'package:debit/src/ui/utils/debit_form.dart';
import 'package:debit/src/ui/utils/debit_space.dart';
import 'package:debit/src/ui/utils/strings.dart';
import 'package:debit/src/ui/utils/texts.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  AuthBloc _authBloc = AuthBloc();

  @override
  void dispose() {
    super.dispose();
    _authBloc.dispose();
  }

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
                  header(
                      context: context,
                      text: appName,
                      type: 7,
                      fontSize: 50,
                      color: debitBlue900),
                  debitCustomTopMargin(3),
                  header(
                      context: context,
                      text: appSubName,
                      type: 4,
                      color: debitBlack54),
                  debitCustomTopMargin(20),
                  Form(
                      child: Column(
                    children: [
                      debitNumberField(
                          label: phoneNumberLabel,
                          maxLength: 12,
                          icon: Icons.phone),
                      debitCustomTopMargin(8),
                      debitSecureField(label: passwordLabel),
                      debitCustomTopMargin(6),
                      debitDefaultButton(
                          elevation: 8,
                          top: 20,
                          onTap: () async {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                '/bottomNavigation',
                                (Route<dynamic> route) => false);
                          },
                          labelColor: debitWhite,
                          buttonColor: debitBlue900,
                          splashColor: debitBlue800,
                          label: loginButtonLabel,
                          height: MediaQuery.of(context).size.height * 0.06)
                    ],
                  )),
                  debitCustomTopMargin(30),
                  header(
                      context: context,
                      text: createdNewLabel,
                      type: 7,
                      fontSize: 13,
                      color: debitBlack54),
                  debitDefaultButton(
                      labelWeight: FontWeight.bold,
                      top: 3,
                      labelSize: 14,
                      onTap: () async {
                        SharedPreferences _preferences =
                            await SharedPreferences.getInstance();
                        _preferences.setString('token', 'ascdasd12312321');

                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return Register();
                        }));
                      },
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
