import 'package:debit/src/blocs/base_bloc.dart';
import 'package:debit/src/events/bottom_nav_event.dart';
import 'package:debit/src/states/bottom_nav_state.dart';
import 'package:debit/src/ui/auth/card_page.dart';
import 'package:debit/src/ui/auth/dashboard.dart';
import 'package:debit/src/ui/auth/profile_page.dart';
import 'package:flutter/material.dart';

class BottomNavBloc extends BaseBloc<BottomNavEvent, BottomNavState> {
  List<Widget> pages = [Dashboard(), CardPage(), ProfilePage()];

  @override
  void mapEventToState(e) {
    if (e is NavigateEvent) {
      navigateEvent(e);
    }
  }

  navigateEvent(NavigateEvent e) {
    NavigateState state = NavigateState(e.index);
    stateSink.add(state);
  }
}
