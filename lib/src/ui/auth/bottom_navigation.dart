import 'package:debit/src/blocs/bottom_nav_bloc.dart';
import 'package:debit/src/events/bottom_nav_event.dart';
import 'package:debit/src/states/bottom_nav_state.dart';
import 'package:debit/src/ui/utils/strings.dart';
import 'package:debit/src/ui/utils/texts.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  BottomNavBloc _bloc = BottomNavBloc();

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _bloc.stateStream,
        initialData: NavigateState(0),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: snapshot.data.index,
                onTap: (index) {
                  _bloc.eventSink.add(NavigateEvent(index));
                },
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    title: Text(
                      dashboardLabel,
                      style: simpleStyle(),
                    ),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.credit_card),
                    title: Text(
                      cardsLabel,
                      style: simpleStyle(),
                    ),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    title: Text(
                      profileLabel,
                      style: simpleStyle(),
                    ),
                  )
                ],
              ),
              body: _bloc.pages[snapshot.data.index],
            );
          } else {
            return CircularProgressIndicator();
          }
        });
  }
}
