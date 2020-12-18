import 'package:flutter/material.dart';
import 'package:debit/src/ui/utils/strings.dart';

class DevelopmentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.face),
        Text(developerDoingLabel),
      ],
    );
  }
}
