import 'package:debit/src/ui/guest/app_usage.dart';
import 'package:debit/src/ui/guest/login.dart';
import 'package:flutter/material.dart';

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AppUsage(),
      initialRoute: '/init',
      theme: ThemeData(fontFamily: 'Mulish'),
      debugShowCheckedModeBanner: false,
      routes: {
        '/init': (BuildContext ctx) => AppUsage(),
        '/login': (BuildContext ctx) => Login(),
      },
    );
  }
}
