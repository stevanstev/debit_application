import 'package:debit/src/ui/utils/colors.dart';
import 'package:flutter/material.dart';

class InterviewSchedules extends StatelessWidget {
  final double width, height;
  final IconData statusIcon;
  final Color statusIconColor;
  final String interviewer, interviewDate;

  ///[width] width of the card container
  ///
  ///[height] height of the card container
  ///
  ///[statusIcon] Icon of the card container
  ///
  ///[statusIconColor] Icon Color of the card container
  ///
  ///[interviewer] Interviewer of the card container
  ///
  ///[interviewDate] Date time bar of the card container
  ///```
  ///InterviewSchedules(
  ///width: 200,
  ///height: 200,
  ///statusIcon: Icon(Icons.waiting,
  ///statusIconColor: Colors.red,
  ///interviewer: 'Steve',
  ///interviewDate: '12 Dec 2020'))
  ///```
  InterviewSchedules({
    @required this.width,
    @required this.height,
    @required this.statusIcon,
    @required this.statusIconColor,
    @required this.interviewDate,
    @required this.interviewer,
  });

  @override
  Widget build(BuildContext context) {
    double progressWidth = width * 0.5;
    DateTime _today = DateTime.now();
    DateTime _interviewDateParse = DateTime.parse(interviewDate);
    final _dateDifferences = (_today.difference(_interviewDateParse).inDays);
    double ratio = (_dateDifferences < 0) ? _dateDifferences.abs() / 7 : 1.0;

    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      child: Column(
        children: [
          Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              color: debitWhite,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  flex: 1,
                  child: Icon(
                    statusIcon,
                    color: statusIconColor,
                    size: 35,
                  ),
                ),
                Flexible(
                  flex: 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('Date'),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                  '${_interviewDateParse.day}/${_interviewDateParse.month}/${_interviewDateParse.year}'),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('Interviewer'),
                              SizedBox(
                                width: 20,
                              ),
                              Text(interviewer),
                            ],
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          Container(
                            width: progressWidth,
                            height: 10,
                            decoration: BoxDecoration(color: debitRed300),
                          ),
                          AnimatedContainer(
                            duration: Duration(seconds: 2),
                            width: progressWidth * ratio,
                            height: 10,
                            decoration: BoxDecoration(color: debitGreen),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Flexible(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: (_dateDifferences < 0)
                        ? [
                            Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                color: debitGreen,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: InkWell(
                                  child: Icon(
                                Icons.add_to_home_screen,
                                color: debitWhite,
                              )),
                            ),
                            Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                color: debitYellow800,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: InkWell(
                                  child: Icon(
                                Icons.calendar_today,
                                color: debitWhite,
                              )),
                            ),
                          ]
                        : [
                            Container(
                              width: 35,
                              height: 35,
                            ),
                          ],
                  ),
                )
              ],
            ),
          ),
          Divider(
            height: 0,
            thickness: 2,
          ),
        ],
      ),
    );
  }
}
