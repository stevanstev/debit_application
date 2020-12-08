import 'package:debit/src/blocs/register_bloc.dart';
import 'package:debit/src/events/register_event.dart';
import 'package:debit/src/states/register_state.dart';
import 'package:debit/src/ui/guest/login.dart';
import 'package:debit/src/ui/utils/colors.dart';
import 'package:debit/src/ui/utils/debit_buttons.dart';
import 'package:debit/src/ui/utils/debit_form.dart';
import 'package:debit/src/ui/utils/debit_space.dart';
import 'package:debit/src/ui/utils/strings.dart';
import 'package:debit/src/ui/utils/texts.dart';
import 'package:debit/src/ui/widgets/curve_painter.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  RegisterBloc _bloc = RegisterBloc();

  @override
  void dispose() {
    super.dispose();
    _bloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.12,
            left: 30,
            right: 30),
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              header(
                  context: context,
                  text: registerHeaderLabel,
                  type: 2,
                  color: debitBlack54),
              debitTopMargin(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomPaint(
                    painter: CurvePainter(),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                    ),
                  ),
                  header(
                      context: context,
                      text: appName,
                      type: 7,
                      fontSize: 25,
                      color: debitBlue900),
                  CustomPaint(
                    painter: CurvePainter(),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                    ),
                  ),
                ],
              ),
              debitTopMargin(),
              Form(
                  child: Column(
                children: [
                  debitNumberField(
                      icon: Icons.phone,
                      label: phoneNumberLabel,
                      maxLength: 12,
                      onChanged: null,
                      validator: null),
                  debitCustomTopMargin(10),
                  debitTextField(
                      icon: Icons.person,
                      label: fullNameLabel,
                      maxLength: 30,
                      onChanged: null,
                      validator: null),
                  debitCustomTopMargin(10),
                  debitSecureField(
                      label: passwordLabel,
                      maxLength: 30,
                      onChanged: null,
                      validator: null),
                  debitCustomTopMargin(10),
                  debitSecureField(
                      label: rePasswordLabel,
                      maxLength: 30,
                      onChanged: null,
                      validator: null),
                  debitCustomTopMargin(10),
                  StreamBuilder(
                      stream: _bloc.stateStream,
                      initialData: GetCheckboxToggleState(false),
                      builder: (ctx, snapshot) {
                        if (!snapshot.hasData) {
                          return CircularProgressIndicator();
                        }

                        return Row(
                          children: [
                            Checkbox(
                                value: snapshot.data.toggle,
                                onChanged: (v) {
                                  _bloc.eventSink
                                      .add(SetCheckboxToggleEvent(v));
                                }),
                            header(
                                type: 5,
                                text: agreeToTerms,
                                color: debitBlack54),
                            SizedBox(
                              width: 3,
                            ),
                            debitClickableWidget(
                                onTap: () {
                                  showDialog(
                                      builder: (context) {
                                        return SimpleDialog(
                                          title: header(
                                              type: 4,
                                              text: termsAndConditions,
                                              color: debitBlack54),
                                          children: [
                                            Column(
                                              children: [
                                                header(
                                                    type: 5,
                                                    text: loremIpsum,
                                                    color: debitBlack54),
                                                header(
                                                    type: 5,
                                                    text: loremIpsum,
                                                    color: debitBlack54),
                                                header(
                                                    type: 5,
                                                    text: loremIpsum,
                                                    color: debitBlack54)
                                              ],
                                            )
                                          ],
                                        );
                                      },
                                      context: context);
                                },
                                child: header(
                                    type: 5, text: here, color: debitRed800))
                          ],
                        );
                      }),
                  debitCustomTopMargin(22),
                  debitDefaultButton(
                      labelColor: debitWhite,
                      buttonColor: debitBlue900,
                      height: MediaQuery.of(context).size.height * 0.06,
                      label: registerSubmitLabel,
                      onTap: null,
                      splashColor: debitBlue800),
                ],
              )),
              debitCustomTopMargin(22),
              Column(
                children: [
                  header(
                      context: context,
                      text: alreadyHaveAccount,
                      type: 7,
                      fontSize: 13,
                      color: debitBlack54),
                  debitDefaultButton(
                      labelWeight: FontWeight.bold,
                      top: 3,
                      labelSize: 14,
                      onTap: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return Login();
                        }));
                      },
                      labelColor: debitBlue800,
                      buttonColor: debitTransparent,
                      splashColor: debitBlue800,
                      label: loginButtonLabel,
                      height: MediaQuery.of(context).size.height * 0.03),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
