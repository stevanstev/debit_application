import 'package:debit/src/blocs/auth_bloc.dart';
import 'package:debit/src/events/auth_event.dart';
import 'package:debit/src/states/auth_state.dart';
import 'package:debit/src/ui/auth/debit_app_bar.dart';
import 'package:debit/src/ui/utils/colors.dart';
import 'package:debit/src/ui/utils/strings.dart';
import 'package:debit/src/ui/utils/texts.dart';
import 'package:debit/src/ui/widgets/icon_menu.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          IconMenu(
            label: userDataLabel,
            icon: Icons.person,
            onTap: () {
              print(userDataLabel);
            },
          ),
          IconMenu(
            onTap: () {},
            label: securityLabel,
            icon: Icons.security,
          ),
          IconMenu(
            onTap: () {},
            label: helpLabel,
            icon: Icons.help,
          ),
          IconMenu(
            onTap: () {},
            label: termsAndConditionLabel,
            icon: Icons.book,
          ),
          StreamBuilder(
              stream: _bloc.stateStream,
              initialData: RemoveAuthTokenState(false),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data.status == false) {
                    return IconMenu(
                      onTap: () {
                        _bloc.eventSink.add(RemoveAuthTokenEvent());
                      },
                      label: logoutLabel,
                      icon: Icons.exit_to_app,
                    );
                  } else if (snapshot.data.status == true) {
                    WidgetsBinding.instance.addPostFrameCallback((_) =>
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            '/init', (Route<dynamic> route) => false));
                    return const SizedBox();
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
