import 'dart:async';

import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    _showLoadingScreen();
  }

  _showLoadingScreen() async {
    Duration _timer = Duration(seconds: 5);
    return Timer(_timer, _callback);
  }

  Widget _callback() {
    return CircularProgressIndicator();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Loading!'),
      ),
    );
  }
}
