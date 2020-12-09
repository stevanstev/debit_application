import 'dart:async';

import 'package:debit/src/blocs/auth_bloc.dart';
import 'package:debit/src/events/auth_event.dart';
import 'package:debit/src/states/auth_state.dart';
import 'package:debit/src/ui/auth/debit_app_bar.dart';
import 'package:debit/src/ui/utils/colors.dart';
import 'package:debit/src/ui/utils/screen_size.dart';
import 'package:debit/src/ui/utils/strings.dart';
import 'package:debit/src/ui/widgets/credit_card.dart';
import 'package:debit/src/ui/widgets/loading_screen.dart';
import 'package:debit/src/ui/widgets/not_implemented_ui.dart';
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
                height: 150,
                title: dashboardLabel,
              ),
              body: ListView(
                children: [],
              ),
            );
          } else {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
