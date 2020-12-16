import 'package:debit/src/ui/auth/debit_app_bar.dart';
import 'package:debit/src/ui/auth/interview_schedules.dart';
import 'package:debit/src/ui/utils/colors.dart';
import 'package:debit/src/ui/utils/debit_buttons.dart';
import 'package:debit/src/ui/utils/debit_form.dart';
import 'package:debit/src/ui/utils/screen_size.dart';
import 'package:debit/src/ui/utils/strings.dart';
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
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 15, right: 15, top: 4, bottom: 20),
              child: debitTextField(
                  icon: Icons.search,
                  label: searchLabel,
                  maxLength: 30,
                  onChanged: null,
                  validator: null),
            ),
            InterviewSchedules(
              width: fullWidthSize(context: context) * 0.9,
              height: fullHeightSize(context: context) * 0.23,
            ),
          ],
        ),
      ),
    );
  }
}
