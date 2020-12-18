import 'package:debit/src/ui/auth/video_call/open_window.dart';
import 'package:debit/src/ui/utils/colors.dart';
import 'package:debit/src/ui/utils/custom_date_format.dart';
import 'package:debit/src/ui/utils/texts.dart';
import 'package:debit/src/ui/widgets/vertical_line_painter.dart';
import 'package:flutter/material.dart';

class InterviewSchedules extends StatelessWidget {
  final double width;
  // Will be Model in the future
  final Map<String, dynamic> interviewData;

  ///[width] Width of schedule box
  ///
  ///[interviewData] the schedule data,
  ///```
  ///InterviewSchedules({
  /// width: 100,
  /// interviewData: {
  /// 'interviewer': <String>[
  ///    'assets/images/image.jpg',
  ///    'assets/images/image.jpg',
  ///     ......
  ///  ],
  ///  'interviewDate': '2020-12-18T13:44:00Z',
  /// 'title': 'Create new Card',
  /// 'subTitle': 'Please Attend for create a new card',}
  ///})
  ///```
  InterviewSchedules({
    @required this.width,
    @required this.interviewData,
  });

  Color _statusColorMap(DateTime dt) {
    DateTime now = DateTime.now();
    Color _color;
    int differences = now.difference(dt).inDays;
    // Give user compensation +30 minutes from schedule minutes
    List<int> format = minuteNumberFormat(dt.hour, dt.minute + 30);

    if (differences < 0) {
      // Interview day does not match
      _color = debitYellow800;
    } else if (differences > 0) {
      // Interview schedule is expired and finish
      _color = debitRed800;
    } else {
      // Same Day
      if (now.hour < dt.hour && now.minute < dt.minute) {
        _color = debitYellow800;
      } else if (now.hour == dt.hour && now.minute == dt.minute) {
        _color = debitGreen;
      } else {
        // hour and minutes is matched
        if (format[1] != now.minute && dt.hour + format[0] == now.hour) {
          _color = debitGreen;
        } else {
          _color = debitRed800;
        }
      }
    }

    return _color;
  }

  @override
  Widget build(BuildContext context) {
    DateTime _formatDate = DateTime.parse(interviewData['interviewDate']);
    List<String> interviewer = interviewData['interviewer'];
    Color _interviewStatus = _statusColorMap(_formatDate);

    return Padding(
      padding: EdgeInsets.all(0),
      child: Column(
        children: [
          Container(
            height: 155,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                    flex: 3,
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          header(
                            text: '${_formatDate.day}',
                            type: 3,
                            color: debitBlack54,
                          ),
                          Text('${monthFormat(_formatDate.month)}'),
                          Text('${_formatDate.year}'),
                        ],
                      ),
                    )),
                Flexible(
                  flex: 8,
                  child: Container(
                      width: width,
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: debitWhite,
                          boxShadow: [
                            BoxShadow(
                              color: debitBlack54,
                              blurRadius: 8,
                              offset: Offset(1, 1),
                            )
                          ]),
                      height: 130,
                      child: Row(
                        children: [
                          CustomPaint(
                            painter: VerticalLinePainter(
                              color: _interviewStatus,
                            ),
                            child: Container(),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${_formatDate.hour}:${minuteStringFormat(_formatDate.minute.toString())} ${hourStringFormat(_formatDate.hour)}',
                                    style: simpleStyle(
                                      color: _interviewStatus,
                                    ),
                                  ),
                                  SizedBox(
                                    width: width * 0.35,
                                  ),
                                  InkWell(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return OpenWindow();
                                        }));
                                      },
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.video_call,
                                            color: _interviewStatus,
                                          ),
                                          Text('Open',
                                              style: simpleStyle(
                                                color: _interviewStatus,
                                              )),
                                        ],
                                      )),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    interviewData['title'],
                                    style: simpleStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    interviewData['subTitle'],
                                    style: simpleStyle(
                                      color: debitBlack54,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: interviewer.map((img) {
                                  return Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundImage: AssetImage(
                                          img,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                    ],
                                  );
                                }).toList(),
                              )
                            ],
                          ),
                        ],
                      )),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
