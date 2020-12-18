import 'package:debit/src/ui/auth/account/pin_view.dart';
import 'package:debit/src/ui/widgets/development_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  @override
  Widget build(Object context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: DevelopmentPage(),
        ),
      ),
    );
  }
}
