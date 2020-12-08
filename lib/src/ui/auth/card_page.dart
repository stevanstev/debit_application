import 'package:debit/src/ui/auth/debit_app_bar.dart';
import 'package:debit/src/ui/utils/strings.dart';
import 'package:flutter/material.dart';

class CardPage extends StatefulWidget {
  @override
  _CardPageState createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DebitAppBar(
        title: cardsLabel,
      ),
      body: ListView(),
    );
  }
}
