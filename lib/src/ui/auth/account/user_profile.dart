import 'package:debit/src/ui/auth/debit_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  @override
  Widget build(Object context) {
    return Scaffold(
      appBar: DebitAppBar(
        title: 'User Profile',
      ),
      body: ListView(),
    );
  }
}
