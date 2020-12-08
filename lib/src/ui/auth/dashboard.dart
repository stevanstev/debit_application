import 'package:debit/src/blocs/auth_bloc.dart';
import 'package:debit/src/events/auth_event.dart';
import 'package:debit/src/states/auth_state.dart';
import 'package:debit/src/ui/auth/debit_app_bar.dart';
import 'package:debit/src/ui/utils/strings.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  AuthBloc _authBloc = AuthBloc();

  @override
  void initState() {
    super.initState();
    _authBloc.eventSink.add(GetAuthTokenEvent());
  }

  @override
  void dispose() {
    _authBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        initialData: GetAuthTokenState(''),
        stream: _authBloc.stateStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              appBar: DebitAppBar(
                title: dashboardLabel,
              ),
              body: ListView(),
            );
          } else {
            return CircularProgressIndicator();
          }
        });
  }
}
