import 'package:debit/src/blocs/bottom_nav_bloc.dart';
import 'package:debit/src/blocs/theme_bloc.dart';
import 'package:debit/src/events/bottom_nav_event.dart';
import 'package:debit/src/states/bottom_nav_state.dart';
import 'package:debit/src/ui/utils/colors.dart';
import 'package:debit/src/ui/utils/strings.dart';
import 'package:debit/src/ui/utils/texts.dart';
import 'package:debit/src/ui/widgets/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

  Color navigationColor(int index) {
    Color _color;

    switch (index) {
      case 0:
        _color = debitBlue900;
        break;
      case 1:
        _color = debitGreen;
        break;
      case 2:
        _color = debitYellow800;
        break;
      case 3:
        _color = debitBlack;
        break;
      default:
        _color = debitBlack;
        break;
    }

    return _color;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _bloc.stateStream,
        initialData: NavigateState(0),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              bottomNavigationBar: BlocBuilder<ThemeBloc, ThemeState>(
                builder: (context, themeState) => BottomNavigationBar(
                  selectedItemColor: themeState.props[0],
                  type: BottomNavigationBarType.fixed,
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
                      icon: Icon(Icons.video_call),
                      title: Text(
                        interviewLabel,
                        style: simpleStyle(),
                      ),
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.assignment),
                      title: Text(
                        submissionLabel,
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
              ),
              body: _bloc.pages[snapshot.data.index],
            );
          } else if (!snapshot.hasData) {
            return LoadingScreen();
          }
          return LoadingScreen();
        });
  }
}
