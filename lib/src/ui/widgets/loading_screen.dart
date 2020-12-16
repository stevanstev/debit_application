import 'package:debit/src/ui/utils/colors.dart';
import 'package:debit/src/ui/utils/strings.dart';
import 'package:debit/src/ui/utils/texts.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double _opacity = 1.0;

  @override
  void initState() {
    super.initState();
    setState(() {
      _opacity = 0.8;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedOpacity(
          opacity: _opacity,
          duration: Duration(seconds: 6),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              header(
                  context: context,
                  text: 'Debit Bank',
                  type: 7,
                  fontSize: 50,
                  color: debitBlue900),
            ],
          ),
        ),
      ),
    );
  }
}
