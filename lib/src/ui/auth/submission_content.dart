import 'package:debit/src/ui/utils/colors.dart';
import 'package:debit/src/ui/utils/screen_size.dart';
import 'package:debit/src/ui/widgets/custom_card.dart';
import 'package:flutter/material.dart';

class SubmissionContent extends StatelessWidget {
  final int userID;
  final String token;
  final int status;

  SubmissionContent({this.userID, this.token, this.status});

  Color _cardColorMap(int status) {
    Color _color;

    switch (status) {
      case 0:
        _color = debitYellow800;
        break;
      case 1:
        _color = debitGreen;
        break;
      case 2:
        _color = debitRed800;
        break;
      default:
        _color = debitBlue900;
        break;
    }

    return _color;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(left: 12, right: 12, top: 20),
        child: Column(
          children: [
            CustomCard(
              image: 'assets/images/irene.jpg',
              idCard: '908786789768',
              submissionDate: '12/12/2020',
              color: _cardColorMap(status),
              height: fullHeightSize(context: context) * 0.2,
              width: fullWidthSize(context: context),
            ),
          ],
        ),
      ),
    );
  }
}
