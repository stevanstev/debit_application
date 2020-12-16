import 'package:debit/src/ui/auth/debit_app_bar.dart';
import 'package:debit/src/ui/utils/colors.dart';
import 'package:debit/src/ui/utils/debit_buttons.dart';
import 'package:debit/src/ui/utils/debit_form.dart';
import 'package:debit/src/ui/utils/screen_size.dart';
import 'package:debit/src/ui/utils/strings.dart';
import 'package:debit/src/ui/utils/texts.dart';
import 'package:debit/src/ui/widgets/bank_card.dart';
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
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blueAccent),
                width: fullWidthSize(context: context) * 0.9,
                height: fullHeightSize(context: context) * 0.23,
                child: Stack(
                  children: [
                    Positioned(
                        top: 10,
                        left: 10,
                        child: Container(
                          width: fullWidthSize(context: context) * 0.23,
                          height: fullHeightSize(context: context) * 0.11,
                          decoration: BoxDecoration(),
                          child: CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/irene.jpg'),
                          ),
                        )),
                    Positioned(
                      right: 5,
                      top: 10,
                      child: debitIconButton(
                          elevation: 10,
                          iconColor: debitWhite,
                          icon: Icons.calendar_today,
                          buttonColor: debitYellow800,
                          splashColor: debitYellow800,
                          height: 40,
                          width: 120,
                          label: 'Re-Schedule',
                          labelColor: debitWhite,
                          onTap: () {}),
                    ),
                    Positioned(
                        right: 5,
                        top: 65,
                        child: Row(
                          children: [
                            debitIconButton(
                                elevation: 10,
                                iconColor: debitWhite,
                                icon: Icons.video_call,
                                buttonColor: debitGreen,
                                splashColor: debitGreen,
                                height: 40,
                                width: 120,
                                label: 'Attend',
                                labelColor: debitWhite,
                                onTap: () {}),
                          ],
                        )),
                    Positioned(
                      bottom: 10,
                      left: 10,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'ID: 1231232123',
                            style: simpleStyle(color: debitWhite, fontSize: 16),
                          ),
                          Text(
                            'Date: 12 December 2020',
                            style: simpleStyle(color: debitWhite, fontSize: 16),
                          ),
                          Text(
                            'Interviewer: Steve',
                            style: simpleStyle(color: debitWhite, fontSize: 16),
                          ),
                        ],
                      ),
                    )
                  ],
                )),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
