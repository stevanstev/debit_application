import 'package:debit/src/blocs/auth_bloc.dart';
import 'package:debit/src/events/auth_event.dart';
import 'package:debit/src/states/auth_state.dart';
import 'package:debit/src/ui/auth/account/user_profile.dart';
import 'package:debit/src/ui/auth/debit_app_bar.dart';
import 'package:debit/src/ui/utils/colors.dart';
import 'package:debit/src/ui/utils/strings.dart';
import 'package:debit/src/ui/utils/texts.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  AuthBloc _bloc = AuthBloc();

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  gotoMainScreen() {
    WidgetsBinding.instance.addPostFrameCallback((_) => Navigator.of(context)
        .pushNamedAndRemoveUntil('/init', (Route<dynamic> route) => false));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: debitGrey100,
      appBar: DebitAppBar(
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.2,
              height: MediaQuery.of(context).size.width * 0.2,
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/irene.jpg'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(
                'Stevanus Steven',
                style: simpleStyle(color: debitWhite, fontSize: 20),
              ),
            )
          ],
        ),
        title: '',
      ),
      body: ListView(
        padding: EdgeInsets.only(),
        children: [
          ListTile(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => UserProfile()));
            },
            leading: Icon(Icons.person),
            trailing: Icon(Icons.chevron_right),
            title: Text(
              userDataLabel,
              style: simpleStyle(color: debitBlack87, fontSize: 16),
            ),
          ),
          ListTile(
            onTap: () {
              print(securityLabel);
            },
            leading: Icon(Icons.security),
            trailing: Icon(Icons.chevron_right),
            title: Text(
              securityLabel,
              style: simpleStyle(color: debitBlack87, fontSize: 16),
            ),
          ),
          ListTile(
            onTap: () {
              print(helpLabel);
            },
            leading: Icon(Icons.help),
            trailing: Icon(Icons.chevron_right),
            title: Text(
              helpLabel,
              style: simpleStyle(color: debitBlack87, fontSize: 16),
            ),
          ),
          ListTile(
            onTap: () {
              print(termsAndConditionLabel);
            },
            leading: Icon(Icons.book),
            trailing: Icon(Icons.chevron_right),
            title: Text(
              termsAndConditionLabel,
              style: simpleStyle(color: debitBlack87, fontSize: 16),
            ),
          ),
          StreamBuilder(
              stream: _bloc.stateStream,
              initialData: RemoveAuthTokenState(false),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data.status == false) {
                    return ListTile(
                      onTap: () {
                        _bloc.eventSink.add(RemoveAuthTokenEvent());
                      },
                      leading: Icon(Icons.exit_to_app),
                      trailing: Icon(Icons.chevron_right),
                      title: Text(
                        logoutLabel,
                        style: simpleStyle(color: debitBlack87, fontSize: 16),
                      ),
                    );
                  } else if (snapshot.data.status == true) {
                    gotoMainScreen();
                    return Container();
                  }
                } else {
                  return Container();
                }

                return Container();
              }),
        ],
      ),
    );
  }
}
