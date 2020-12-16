import 'package:debit/src/blocs/login_bloc.dart';
import 'package:debit/src/events/login_event.dart';
import 'package:debit/src/states/login_state.dart';
import 'package:debit/src/ui/guest/register.dart';
import 'package:debit/src/ui/utils/colors.dart';
import 'package:debit/src/ui/utils/debit_buttons.dart';
import 'package:debit/src/ui/utils/debit_form.dart';
import 'package:debit/src/ui/utils/debit_space.dart';
import 'package:debit/src/ui/utils/load_view.dart';
import 'package:debit/src/ui/utils/strings.dart';
import 'package:debit/src/ui/utils/texts.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  LoginBloc _loginBloc;
  Map<String, dynamic> formData = {};
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isLoadingShow = false;
  LoadView _loadView;

  @override
  void initState() {
    super.initState();
    _loginBloc = LoginBloc();
    _loadView = LoadView(context: context);
  }

  @override
  void dispose() {
    _loginBloc.dispose();
    super.dispose();
  }

  _showLoad() {
    isLoadingShow = true;
    WidgetsBinding.instance.addPostFrameCallback((_) => _loadView.showLoad());
  }

  _closeLoad() {
    isLoadingShow = false;
    WidgetsBinding.instance.addPostFrameCallback((_) => _loadView.hideLoad());
  }

  _mapStateToWidget(LoginState state, BuildContext context) async {
    if (state is LoadingProgressState) {
      _showLoad();
      _loginBloc.eventSink.add(SendRequestToServerEvent(
        phoneNumber: formData['phoneNumber'],
        password: formData['password'],
      ));
    } else if (state is ValidationErrorsState && isLoadingShow) {
      _closeLoad();
    } else if (state is SuccessLoginState && isLoadingShow) {
      SharedPreferences _preferences = await SharedPreferences.getInstance();
      _preferences.setString('token', state.token);

      _closeLoad();

      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        Navigator.of(context).pushNamedAndRemoveUntil(
            '/pinView', (Route<dynamic> route) => false);
      });
    }
  }

  void _onSave() {
    _formKey.currentState.save();
    _loginBloc.eventSink.add(SubmitLoginEvent(
      phoneNumber: formData['phoneNumber'],
      password: formData['password'],
    ));
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
                      key: _formKey,
                      child: StreamBuilder(
                          stream: _loginBloc.stateStream,
                          builder: (context, snapshot) {
                            var data = snapshot.data;
                            if (snapshot.hasData) {
                              _mapStateToWidget(data, context);
                            }

                            return Column(
                              children: [
                                debitNumberField(
                                    onChanged: (v) =>
                                        formData['phoneNumber'] = v,
                                    onSaved: (v) => formData['phoneNumber'] = v,
                                    label: phoneNumberLabel,
                                    maxLength: 12,
                                    icon: Icons.phone),
                                AnimatedOpacity(
                                  duration: Duration(seconds: 2),
                                  opacity:
                                      data is ValidationErrorsState ? 1.0 : 0.0,
                                  child: Column(
                                    children: [
                                      Text(
                                          data is ValidationErrorsState
                                              ? data.errors['phoneNumber'] ?? ''
                                              : '',
                                          style: simpleStyle(
                                            color: debitRedAccent,
                                            fontSize: 14,
                                          )),
                                    ],
                                  ),
                                ),
                                debitSecureField(
                                  label: passwordLabel,
                                  onChanged: (v) => formData['password'] = v,
                                  onSaved: (v) => formData['password'] = v,
                                ),
                                AnimatedOpacity(
                                  duration: Duration(seconds: 2),
                                  opacity:
                                      data is ValidationErrorsState ? 1.0 : 0.0,
                                  child: Column(
                                    children: [
                                      Text(
                                          data is ValidationErrorsState
                                              ? data.errors['password'] ?? ''
                                              : '',
                                          style: simpleStyle(
                                            color: debitRedAccent,
                                            fontSize: 14,
                                          )),
                                    ],
                                  ),
                                ),
                                debitDefaultButton(
                                    elevation: 8,
                                    top: 20,
                                    onTap: () {
                                      _onSave();
                                    },
                                    labelColor: debitWhite,
                                    buttonColor: debitBlue900,
                                    splashColor: debitBlue800,
                                    label: loginButtonLabel,
                                    height: MediaQuery.of(context).size.height *
                                        0.06)
                              ],
                            );
                          })),
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
                      onTap: () {
                        Navigator.of(context).push(PageRouteBuilder(
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            var begin = Offset(0.0, 1.0);
                            var end = Offset.zero;
                            var tween = Tween(begin: begin, end: end);
                            var offsetAnimation = animation.drive(tween);
                            return SlideTransition(
                              position: offsetAnimation,
                              child: child,
                            );
                          },
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  Register(),
                        ));
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
