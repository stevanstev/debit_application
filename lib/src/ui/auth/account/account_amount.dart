import 'package:debit/src/ui/auth/debit_app_bar.dart';
import 'package:debit/src/ui/utils/load_view.dart';
import 'package:debit/src/ui/widgets/development_page.dart';
import 'package:flutter/material.dart';

class AccountAmount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final LoadView loadView = LoadView(context: context);

    return Scaffold(
      appBar: DebitAppBar(
        title: 'Amount',
      ),
      body: Center(
        child: DevelopmentPage(),
      ),
    );
  }
}
