import 'package:debit/src/ui/utils/colors.dart';
import 'package:debit/src/ui/utils/texts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Notif extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: debitGrey100,
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.only(top: 10, left: 15, right: 15),
        child: ListView(
          children: [
            header(type: 4, text: 'Notifications', color: debitBlack87),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                  color: debitWhite, borderRadius: BorderRadius.circular(8)),
              child: ListTile(
                leading: Icon(
                  Icons.video_call,
                  size: 35,
                  color: debitGreen,
                ),
                title: Text('Interview Schedule'),
                subtitle: Text('Please check your interview Schedule'),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                  color: debitWhite, borderRadius: BorderRadius.circular(8)),
              child: ListTile(
                leading: Icon(
                  Icons.credit_card,
                  size: 35,
                  color: debitBlue900,
                ),
                title: Text('Card Created'),
                subtitle: Text('Submission success and card is created'),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                  color: debitWhite, borderRadius: BorderRadius.circular(8)),
              child: ListTile(
                leading: Icon(
                  Icons.close,
                  size: 35,
                  color: debitRed800,
                ),
                title: Text('Submission Rejected'),
                subtitle: Text('Your Submission was rejected'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
