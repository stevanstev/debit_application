import 'package:debit/src/ui/auth/debit_app_bar.dart';
import 'package:debit/src/ui/utils/colors.dart';
import 'package:debit/src/ui/utils/screen_size.dart';
import 'package:flutter/material.dart';

class OpenWindow extends StatefulWidget {
  @override
  _OpenWindowState createState() => _OpenWindowState();
}

class _OpenWindowState extends State<OpenWindow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              width: 80,
              height: 50,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: debitBlack45,
                    offset: Offset(1, 1),
                    blurRadius: 8,
                  )
                ],
                color: debitBlue900,
                borderRadius: BorderRadius.circular(10),
              ),
              child: InkWell(
                onTap: () {},
                child: Icon(
                  Icons.videocam_off,
                  color: debitWhite,
                  size: 30,
                ),
              )),
          SizedBox(
            width: 20,
          ),
          Container(
            width: 80,
            height: 50,
            decoration: BoxDecoration(
              color: debitRed800,
              boxShadow: [
                BoxShadow(
                  color: debitBlack45,
                  offset: Offset(1, 1),
                  blurRadius: 8,
                )
              ],
              borderRadius: BorderRadius.circular(10),
            ),
            child: InkWell(
              onTap: () => Navigator.of(context).pop(),
              child: Icon(
                Icons.close,
                color: debitWhite,
                size: 30,
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: DebitAppBar(
        title: 'Interview',
      ),
      body: ListView(
        children: [
          Container(
            width: fullWidthSize(context: context),
            height: fullHeightSize(context: context) * 0.36,
            decoration: BoxDecoration(
              color: debitBlack87,
            ),
          ),
          Container(
            width: fullWidthSize(context: context),
            height: fullHeightSize(context: context) * 0.36,
            decoration: BoxDecoration(
              color: debitCyan300,
            ),
          ),
        ],
      ),
    );
  }
}
