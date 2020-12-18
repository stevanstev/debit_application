import 'package:debit/src/ui/auth/notif.dart';
import 'package:flutter/material.dart';

class DebitAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final double height, fontSize;
  final Widget child;
  final FontWeight fontWeight;
  final PreferredSizeWidget bottom;

  DebitAppBar({
    @required this.title,
    this.height,
    this.child,
    this.fontSize = 19,
    this.bottom,
    this.fontWeight = FontWeight.normal,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      bottom: bottom,
      elevation: 0.0,
      flexibleSpace:
          Align(alignment: Alignment.bottomCenter, child: child ?? Container()),
      title: Text(
        title,
        style: TextStyle(fontSize: fontSize, fontWeight: fontWeight),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 12),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                return Notif();
              }));
            },
            child: Icon(Icons.notifications),
          ),
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(height ?? 58);
}
