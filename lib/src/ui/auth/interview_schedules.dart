import 'package:debit/src/ui/utils/colors.dart';
import 'package:debit/src/ui/utils/debit_buttons.dart';
import 'package:debit/src/ui/utils/texts.dart';
import 'package:flutter/material.dart';

class InterviewSchedules extends StatelessWidget {
  final double width, height;

  ///[width] width of the card container
  ///
  ///[height] height of the card container
  ///```
  ///InterviewSchedules(width: 200, height: 200)
  ///```
  InterviewSchedules({
    @required this.width,
    @required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: debitBlack.withOpacity(0.6),
                      offset: Offset(1, 1),
                      blurRadius: 7)
                ],
                borderRadius: BorderRadius.circular(10),
                color: Colors.blueAccent),
            width: width,
            height: height,
            child: Stack(
              children: [
                Positioned(
                    top: 10,
                    left: 10,
                    child: Container(
                      width: width * 0.24,
                      height: height * 0.43,
                      decoration: BoxDecoration(),
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/images/irene.jpg'),
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
                      height: 35,
                      width: 120,
                      label: 'Re-Schedule',
                      labelColor: debitWhite,
                      onTap: () {}),
                ),
                Positioned(
                    right: 5,
                    top: 60,
                    child: Row(
                      children: [
                        debitIconButton(
                            elevation: 10,
                            iconColor: debitWhite,
                            icon: Icons.video_call,
                            buttonColor: debitGreen,
                            splashColor: debitGreen,
                            height: 35,
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
                        style: simpleStyle(color: debitWhite, fontSize: 14),
                      ),
                      Text(
                        'Date: 12 December 2020',
                        style: simpleStyle(color: debitWhite, fontSize: 14),
                      ),
                      Text(
                        'Interviewer: Steve',
                        style: simpleStyle(color: debitWhite, fontSize: 14),
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
    );
  }
}
