import 'package:debit/src/ui/auth/debit_app_bar.dart';
import 'package:debit/src/ui/auth/interview_schedules.dart';
import 'package:debit/src/ui/utils/colors.dart';
import 'package:debit/src/ui/utils/screen_size.dart';
import 'package:debit/src/ui/utils/texts.dart';

import 'package:flutter/material.dart';

class InterviewPage extends StatefulWidget {
  @override
  _InterviewPageState createState() => _InterviewPageState();
}

class _InterviewPageState extends State<InterviewPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: debitGrey100,
      appBar: DebitAppBar(
        title: 'Interview',
      ),
      body: SingleChildScrollView(
          child: Container(
        padding: EdgeInsets.only(top: 20),
        decoration: BoxDecoration(color: debitWhite),
        child: Column(
          children: [
            header(
                text: 'Schedules', color: debitBlack87, type: 7, fontSize: 20),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 60,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Row(
                    children: [
                      Text('Filter'),
                      Icon(
                        Icons.sort,
                        color: debitBlack87,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                    width: 60,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: InkWell(
                        child: Row(
                      children: [
                        Text('Sort'),
                        Icon(
                          Icons.sort,
                          color: debitBlack87,
                        ),
                      ],
                    ))),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Divider(
              height: 0,
              thickness: 2,
            ),
            InterviewSchedules(
              width: fullWidthSize(context: context),
              height: 100,
              statusIcon: Icons.settings_backup_restore,
              statusIconColor: debitYellow800,
              interviewDate: '20201224T130000',
              interviewer: 'Steven',
            ),
            InterviewSchedules(
              width: fullWidthSize(context: context),
              height: 100,
              statusIcon: Icons.assignment_turned_in,
              statusIconColor: debitGreen,
              interviewDate: '20201217T130000',
              interviewer: 'Louis',
            ),
            InterviewSchedules(
              width: fullWidthSize(context: context),
              height: 100,
              statusIcon: Icons.assignment_turned_in,
              statusIconColor: debitGreen,
              interviewDate: '20201217T120000',
              interviewer: 'Kent',
            ),
            InterviewSchedules(
              width: fullWidthSize(context: context),
              height: 100,
              statusIcon: Icons.cancel,
              statusIconColor: debitRed800,
              interviewDate: '20201210T130000',
              interviewer: 'Steven',
            ),
            InterviewSchedules(
              width: fullWidthSize(context: context),
              height: 100,
              statusIcon: Icons.cancel,
              statusIconColor: debitRed800,
              interviewDate: '20201210T130000',
              interviewer: 'Steven',
            ),
          ],
        ),
      )),
    );
  }
}
