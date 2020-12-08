import 'package:debit/src/ui/utils/colors.dart';
import 'package:debit/src/ui/utils/texts.dart';
import 'package:flutter/material.dart';

class IconMenu extends StatelessWidget {
  final String label;
  final IconData icon;
  final double space;
  final Function onTap;

  IconMenu({
    @required this.label,
    @required this.icon,
    @required this.onTap,
    this.space = 2,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          splashColor: Colors.blue[200],
          onTap: onTap,
          child: ListTile(
            leading: Icon(icon),
            title: Text(
              label,
              style: simpleStyle(fontSize: 17),
            ),
          ),
        ),
        SizedBox(
          height: space,
        )
      ],
    );
  }
}
