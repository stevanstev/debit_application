import 'package:flutter/material.dart';

class DebitAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final double height;
  final Widget child;

  DebitAppBar({this.title, this.height, this.child});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace:
          Align(alignment: Alignment.bottomCenter, child: child ?? Container()),
      title: Text(title),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 12),
          child: Icon(Icons.notifications),
        )
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(height ?? 58);
}
