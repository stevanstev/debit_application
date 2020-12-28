import 'package:debit/src/blocs/auth_bloc.dart';
import 'package:debit/src/blocs/theme_bloc.dart';
import 'package:debit/src/events/auth_event.dart';
import 'package:debit/src/states/auth_state.dart';
import 'package:debit/src/ui/auth/account/pin_view.dart';
import 'package:debit/src/ui/auth/account/user_profile.dart';
import 'package:debit/src/ui/auth/biometrics/prompt_fingerprint.dart';
import 'package:debit/src/ui/auth/biometrics/set_fingerprint.dart';
import 'package:debit/src/ui/auth/notif.dart';
import 'package:debit/src/ui/auth/profiles/application_theme.dart';
import 'package:debit/src/ui/auth/profiles/change_pin.dart';
import 'package:debit/src/ui/utils/colors.dart';
import 'package:debit/src/ui/utils/load_view.dart';
import 'package:debit/src/ui/utils/screen_size.dart';
import 'package:debit/src/ui/utils/strings.dart';
import 'package:debit/src/ui/utils/texts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SliverView extends StatefulWidget {
  @override
  _SliverViewState createState() => _SliverViewState();
}

class _SliverViewState extends State<SliverView> {
  AuthBloc _bloc = AuthBloc();
  LoadView _loadView;
  bool _showLoading = false;

  @override
  void initState() {
    super.initState();
    _loadView = LoadView(context: context);
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  _mapStateToWidget(AuthState state) {
    if (state is RemoveAuthTokenState && _showLoading) {
      _hideLoadingBar();
      gotoMainScreen();
    }
  }

  gotoMainScreen() {
    WidgetsBinding.instance.addPostFrameCallback((_) => Navigator.of(context)
        .pushNamedAndRemoveUntil('/init', (Route<dynamic> route) => false));
  }

  _hideLoadingBar() {
    _showLoading = false;
    WidgetsBinding.instance.addPostFrameCallback((_) => _loadView.hideLoad());
  }

  _showLoadingBar() {
    _showLoading = true;
    WidgetsBinding.instance.addPostFrameCallback((_) => _loadView.showLoad());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, themeState) => CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: themeState.props[0],
            elevation: 8,
            pinned: true,
            expandedHeight: 100,
            flexibleSpace: Container(
              child: Stack(
                children: [
                  Positioned(
                      bottom: 13,
                      left: 10,
                      child: Text(
                        'Profile',
                        style: simpleStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: debitWhite),
                      )),
                ],
              ),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 12),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (ctx) {
                      return Notif();
                    }));
                  },
                  child: Icon(
                    Icons.notifications,
                    color: debitWhite,
                  ),
                ),
              ),
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                  margin: EdgeInsets.only(top: 0),
                  decoration: BoxDecoration(color: themeState.props[0]),
                  child: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: fullWidthSize(context: context) * 0.18,
                          height: fullHeightSize(context: context) * 0.09,
                          child: CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/irene.jpg'),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        header(
                          type: 7,
                          fontSize: 16,
                          text: 'Stevanus Steven',
                          color: debitWhite,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  )),
              Container(
                  margin: EdgeInsets.only(top: 15),
                  decoration: BoxDecoration(color: debitWhite),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        header(
                            text: 'Account',
                            color: debitBlack87,
                            type: 7,
                            fontSize: 17),
                        ListTile(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => UserProfile()));
                          },
                          subtitle: Text(
                            'Change your personal Data',
                            style: simpleStyle(fontSize: 12),
                          ),
                          leading: Icon(Icons.person),
                          trailing: Icon(Icons.chevron_right),
                          title: Text(
                            userDataLabel,
                            style:
                                simpleStyle(color: debitBlack87, fontSize: 15),
                          ),
                        ),
                        Divider(
                          height: 0,
                        ),
                      ],
                    ),
                  )),
              Container(
                  margin: EdgeInsets.only(top: 15),
                  decoration: BoxDecoration(color: debitWhite),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        header(
                            text: 'Security',
                            color: debitBlack87,
                            type: 7,
                            fontSize: 17),
                        ListTile(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  PinView(navigateAfterInputPin: () {
                                Navigator.of(context).pop();
                                WidgetsBinding.instance.addPostFrameCallback(
                                    (timeStamp) => Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ChangePin())));
                              }),
                            ));
                          },
                          subtitle: Text(
                            'Change your Application\'s Login PIN',
                            style: simpleStyle(fontSize: 12),
                          ),
                          leading: Icon(Icons.fiber_pin),
                          trailing: Icon(Icons.chevron_right),
                          title: Text(
                            'PIN',
                            style:
                                simpleStyle(color: debitBlack87, fontSize: 15),
                          ),
                        ),
                        Divider(
                          height: 0,
                        ),
                        ListTile(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => SetFingerprint()));
                          },
                          subtitle: Text(
                            'Fingerprint to Access Application',
                            style: simpleStyle(fontSize: 12),
                          ),
                          leading: Icon(Icons.touch_app),
                          trailing: Icon(Icons.chevron_right),
                          title: Text(
                            'Fingerprint Login',
                            style:
                                simpleStyle(color: debitBlack87, fontSize: 15),
                          ),
                        ),
                        Divider(
                          height: 0,
                        ),
                      ],
                    ),
                  )),
              Container(
                  margin: EdgeInsets.only(top: 15),
                  decoration: BoxDecoration(color: debitWhite),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        header(
                            text: 'Settings',
                            color: debitBlack87,
                            type: 7,
                            fontSize: 17),
                        ListTile(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ApplicationTheme()));
                          },
                          subtitle: Text(
                            'Set the Application Theme',
                            style: simpleStyle(fontSize: 12),
                          ),
                          leading: Icon(Icons.color_lens),
                          trailing: Icon(Icons.chevron_right),
                          title: Text(
                            'Theme',
                            style:
                                simpleStyle(color: debitBlack87, fontSize: 15),
                          ),
                        ),
                        Divider(
                          height: 0,
                        ),
                      ],
                    ),
                  )),
              Container(
                  margin: EdgeInsets.only(top: 15),
                  decoration: BoxDecoration(color: debitWhite),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        header(
                            text: 'Help',
                            color: debitBlack87,
                            type: 7,
                            fontSize: 17),
                        ListTile(
                          subtitle: Text(
                            'Read our terms and conditions',
                            style: simpleStyle(fontSize: 12),
                          ),
                          onTap: () {
                            print(termsAndConditionLabel);
                          },
                          leading: Icon(Icons.book),
                          trailing: Icon(Icons.chevron_right),
                          title: Text(
                            termsAndConditionLabel,
                            style:
                                simpleStyle(color: debitBlack87, fontSize: 16),
                          ),
                        ),
                        Divider(
                          height: 0,
                        ),
                        ListTile(
                          onTap: () {
                            print(helpLabel);
                          },
                          subtitle: Text(
                            'Contact us',
                            style: simpleStyle(fontSize: 12),
                          ),
                          leading: Icon(Icons.perm_contact_calendar),
                          trailing: Icon(Icons.chevron_right),
                          title: Text(
                            'Application Support',
                            style:
                                simpleStyle(color: debitBlack87, fontSize: 15),
                          ),
                        ),
                        Divider(
                          height: 0,
                        ),
                      ],
                    ),
                  )),
              Container(
                  margin: EdgeInsets.only(top: 15),
                  decoration: BoxDecoration(color: debitWhite),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        header(
                            text: 'Navigate',
                            color: debitBlack87,
                            type: 7,
                            fontSize: 17),
                        StreamBuilder(
                            stream: _bloc.stateStream,
                            builder: (context, snapshot) {
                              var data = snapshot.data;
                              if (snapshot.hasData) {
                                _mapStateToWidget(data);
                              }

                              return ListTile(
                                subtitle: Text(
                                  'Exit from our App',
                                  style: simpleStyle(fontSize: 12),
                                ),
                                onTap: () {
                                  _showLoadingBar();
                                  _bloc.eventSink.add(RemoveAuthTokenEvent());
                                },
                                leading: Icon(Icons.exit_to_app),
                                trailing: Icon(Icons.chevron_right),
                                title: Text(
                                  logoutLabel,
                                  style: simpleStyle(
                                      color: debitBlack87, fontSize: 15),
                                ),
                              );
                            }),
                      ],
                    ),
                  )),
            ]),
          ),
        ],
      ),
    );
  }
}
