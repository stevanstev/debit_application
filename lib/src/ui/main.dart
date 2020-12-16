import 'package:debit/src/ui/auth/account/pin_view.dart';
import 'package:debit/src/ui/auth/bottom_navigation.dart';
import 'package:debit/src/ui/auth/dashboard.dart';
import 'package:debit/src/ui/guest/app_usage.dart';
import 'package:debit/src/ui/guest/login.dart';
import 'package:debit/src/ui/utils/colors.dart';
import 'package:debit/src/ui/widgets/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Main extends StatelessWidget {
  Future<String> getAuthToken() async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    String token = _preferences.getString('token') ?? '';
    return token;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FutureBuilder(
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data != '') {
              return PinView();
            } else {
              return AppUsage();
            }
          }
          return LoadingScreen();
        },
        future: getAuthToken(),
      ),
      theme: ThemeData(
          appBarTheme: AppBarTheme(color: debitBlue900),
          fontFamily: 'Mulish',
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
              elevation: 0.0,
              selectedItemColor: debitBlue900,
              backgroundColor: debitWhite)),
      debugShowCheckedModeBanner: false,
      routes: {
        '/init': (BuildContext ctx) => AppUsage(),
        '/login': (BuildContext ctx) => Login(),
        '/dashboard': (BuildContext ctx) => Dashboard(),
        '/bottomNavigation': (BuildContext ctx) => BottomNavigation(),
        '/pinView': (BuildContext ctx) => PinView(),
      },
    );
  }
}
