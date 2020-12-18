import 'package:debit/src/ui/auth/debit_app_bar.dart';
import 'package:debit/src/ui/auth/interview_schedules.dart';
import 'package:debit/src/ui/utils/colors.dart';
import 'package:debit/src/ui/utils/screen_size.dart';
import 'package:debit/src/ui/utils/strings.dart';

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
      backgroundColor: debitWhite,
      appBar: DebitAppBar(
        title: interviewPageTitle,
      ),
      body: SingleChildScrollView(
          child: Container(
        margin: const EdgeInsets.only(
          top: 15,
          bottom: 15,
        ),
        decoration: BoxDecoration(color: debitWhite),
        child: Column(
          children: [
            InterviewSchedules(
              width: fullWidthSize(context: context) * 0.8,
              interviewData: {
                'interviewer': <String>[
                  'assets/images/irene.jpg',
                  'assets/images/irene.jpg',
                ],
                'interviewDate': '2021-01-02T13:44:00Z',
                'title': 'Create new Card',
                'subTitle': 'Please attend for create a new card',
              },
            ),
            InterviewSchedules(
              width: fullWidthSize(context: context) * 0.8,
              interviewData: {
                'interviewer': <String>[
                  'assets/images/irene.jpg',
                  'assets/images/irene.jpg',
                ],
                'interviewDate': '2020-12-18T13:44:00Z',
                'title': 'Create new Card',
                'subTitle': 'Thank you for attended the interview',
              },
            ),
            InterviewSchedules(
              width: fullWidthSize(context: context) * 0.8,
              interviewData: {
                'interviewer': <String>[
                  'assets/images/irene.jpg',
                  'assets/images/irene.jpg',
                ],
                'interviewDate': '2020-11-10T13:44:00Z',
                'title': 'Create new Card',
                'subTitle': 'Please submit another submission',
              },
            ),
            InterviewSchedules(
              width: fullWidthSize(context: context) * 0.8,
              interviewData: {
                'interviewer': <String>[
                  'assets/images/irene.jpg',
                  'assets/images/irene.jpg',
                ],
                'interviewDate': '2020-08-06T13:44:00Z',
                'title': 'Create new Card',
                'subTitle': 'Please submit another submission',
              },
            ),
            InterviewSchedules(
              width: fullWidthSize(context: context) * 0.8,
              interviewData: {
                'interviewer': <String>[
                  'assets/images/irene.jpg',
                  'assets/images/irene.jpg',
                ],
                'interviewDate': '2020-05-02T13:44:00Z',
                'title': 'Create new Card',
                'subTitle': 'Please submit another submission',
              },
            ),
          ],
        ),
      )),
    );
  }
}
