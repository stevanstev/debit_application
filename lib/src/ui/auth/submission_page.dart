import 'package:debit/src/ui/auth/debit_app_bar.dart';
import 'package:debit/src/ui/utils/colors.dart';
import 'package:debit/src/ui/utils/screen_size.dart';
import 'package:debit/src/ui/utils/strings.dart';
import 'package:debit/src/ui/utils/texts.dart';
import 'package:debit/src/ui/widgets/custom_card.dart';
import 'package:flutter/material.dart';

class SubmissionPage extends StatefulWidget {
  @override
  _SubmissionPageState createState() => _SubmissionPageState();
}

class _SubmissionPageState extends State<SubmissionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DebitAppBar(
        title: submissionLabel,
      ),
      body: ListView(
        children: [
          Column(
            children: [
              DefaultTabController(
                  length: 3,
                  child: Container(
                      width: fullWidthSize(context: context) * 0.9,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      child: TabBar(
                        indicatorColor: debitBlue900,
                        tabs: [
                          Tab(
                            child: InkWell(
                              splashColor: debitBlack,
                              child: Text(
                                waitingSubmissionLabel,
                                style: simpleStyle(
                                    color: debitBlack87, fontSize: 16),
                              ),
                            ),
                          ),
                          Tab(
                            child: InkWell(
                                splashColor: debitBlack,
                                child: Text(
                                  doneSubmissionLabel,
                                  style: simpleStyle(
                                      color: debitBlack87, fontSize: 16),
                                )),
                          ),
                          Tab(
                            child: InkWell(
                              splashColor: debitBlack,
                              child: Text(
                                rejectedSubmssionLabel,
                                style: simpleStyle(
                                    color: debitBlack87, fontSize: 16),
                              ),
                            ),
                          )
                        ],
                      ))),
              Container(
                decoration: BoxDecoration(),
                child: Padding(
                  padding:
                      EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        splashColor: debitBlue800,
                        onTap: () {
                          print(unimplementedLabel);
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.sort,
                              color: debitBlue800,
                            ),
                            Text(
                              sortLabel,
                              style: simpleStyle(
                                  fontSize: 14, color: debitBlue800),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Icon(
                              Icons.list,
                              color: debitBlue800,
                            ),
                            Text(
                              filterLabel,
                              style: simpleStyle(
                                  fontSize: 14, color: debitBlue800),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 12, right: 12, top: 5),
                child: Column(
                  children: [
                    CustomCard(
                      image: 'assets/images/irene.jpg',
                      idCard: '908786789768',
                      submissionDate: '12/12/2020',
                      color: Colors.lightBlue,
                      height: fullHeightSize(context: context) * 0.2,
                      width: fullWidthSize(context: context),
                    ),
                    CustomCard(
                      image: 'assets/images/irene.jpg',
                      idCard: '908786789768',
                      submissionDate: '12/12/2020',
                      color: Colors.teal,
                      height: fullHeightSize(context: context) * 0.2,
                      width: fullWidthSize(context: context),
                    ),
                    CustomCard(
                      image: 'assets/images/irene.jpg',
                      idCard: '908786789768',
                      submissionDate: '12/12/2020',
                      color: Colors.lightBlue,
                      height: fullHeightSize(context: context) * 0.2,
                      width: fullWidthSize(context: context),
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
