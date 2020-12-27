import 'package:debit/src/blocs/theme_bloc.dart';
import 'package:debit/src/ui/auth/debit_app_bar.dart';
import 'package:debit/src/ui/utils/colors.dart';
import 'package:debit/src/ui/utils/texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ApplicationTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DebitAppBar(title: 'Application Theme'),
      body: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, themeState) => Column(
          children: [
            CheckboxListTile(
              value: themeState.props[0] == debitBlue900 ? true : false,
              onChanged: (value) {
                if (value == true) {
                  BlocProvider.of<ThemeBloc>(context)
                      .add(ChangeThemeEvent(color: debitBlue900));
                } else {
                  BlocProvider.of<ThemeBloc>(context)
                      .add(ChangeThemeEvent(color: debitCyan300));
                }
              },
              title: Text(
                'Default Blue',
                style: simpleStyle(
                  color: themeState.props[0] == debitBlue900
                      ? debitBlue900
                      : debitBlack87,
                  fontSize: 17,
                ),
              ),
            ),
            CheckboxListTile(
              value: themeState.props[0] == debitCyan300 ? true : false,
              onChanged: (value) {
                if (value == true) {
                  BlocProvider.of<ThemeBloc>(context)
                      .add(ChangeThemeEvent(color: debitCyan300));
                } else {
                  BlocProvider.of<ThemeBloc>(context)
                      .add(ChangeThemeEvent(color: debitBlue900));
                }
              },
              title: Text(
                'Cyan Color',
                style: simpleStyle(
                  color: themeState.props[0] == debitCyan300
                      ? debitCyan300
                      : debitBlack87,
                  fontSize: 17,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
