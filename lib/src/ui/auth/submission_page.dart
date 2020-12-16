import 'package:debit/src/ui/auth/debit_app_bar.dart';
import 'package:debit/src/ui/auth/submission_content.dart';
import 'package:debit/src/ui/utils/colors.dart';
import 'package:debit/src/ui/utils/screen_size.dart';
import 'package:debit/src/ui/utils/strings.dart';
import 'package:debit/src/ui/utils/texts.dart';
import 'package:flutter/material.dart';

class SubmissionPage extends StatefulWidget {
  @override
  _SubmissionPageState createState() => _SubmissionPageState();
}

class _SubmissionPageState extends State<SubmissionPage>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  List<Tab> tabs = [
    Tab(
      icon: Icon(
        Icons.settings_backup_restore,
        size: 15,
        color: debitYellow800,
      ),
      child: Text(
        waitingSubmissionLabel,
        style: simpleStyle(color: debitYellow800, fontSize: 15),
      ),
    ),
    Tab(
      icon: Icon(
        Icons.assignment_turned_in,
        size: 15,
        color: debitGreen,
      ),
      child: Text(
        doneSubmissionLabel,
        style: simpleStyle(color: debitGreen, fontSize: 15),
      ),
    ),
    Tab(
      icon: Icon(
        Icons.cancel,
        size: 15,
        color: debitRed800,
      ),
      child: Text(
        rejectedSubmssionLabel,
        style: simpleStyle(color: debitRed800, fontSize: 15),
      ),
    )
  ];

  @override
  void initState() {
    super.initState();
    tabController =
        TabController(length: tabs.length, initialIndex: 0, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: debitGrey200,
      appBar: DebitAppBar(
        height: 115,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(20),
          child: Container(
            padding: EdgeInsets.only(top: 0),
            height: fullWidthSize(context: context) * 0.18,
            decoration: BoxDecoration(color: debitWhite),
            child: TabBar(
              controller: tabController,
              indicatorColor: debitBlack12,
              tabs: tabs,
            ),
          ),
        ),
        title: submissionLabel,
      ),
      body: Container(
        decoration: BoxDecoration(color: debitWhite),
        child: TabBarView(
          children: [
            SubmissionContent(
              status: 0,
              token: 'token',
              userID: 1,
            ),
            SubmissionContent(
              status: 1,
              token: 'token',
              userID: 1,
            ),
            SubmissionContent(
              status: 2,
              token: 'token',
              userID: 1,
            ),
          ],
          controller: tabController,
        ),
      ),
    );
  }
}
