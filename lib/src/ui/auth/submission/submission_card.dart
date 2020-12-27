import 'package:debit/src/ui/utils/colors.dart';
import 'package:debit/src/ui/utils/debit_buttons.dart';
import 'package:debit/src/ui/utils/screen_size.dart';
import 'package:debit/src/ui/utils/texts.dart';
import 'package:flutter/material.dart';

class SubmissionCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String cardHeader = 'Create new Card';
    String cardSubHeader = 'Submission Date: 12 Dec';
    String cardUsername = 'Steven';

    Color cardTextColor = debitBlack87;

    double width = fullWidthSize(context: context) * 0.9;

    double height = fullHeightSize(context: context) * 0.23;

    String cardImage = 'assets/images/irene.jpg';

    Color cardColor = debitWhite;

    List<GestureDetector> cardButtonActions = [
      debitButtonWithIcon(
        buttonText: 'Cancel',
        color: debitRed800,
        icon: Icons.close,
        onTap: () {},
      ),
      debitButtonWithIcon(
        buttonText: 'Contact',
        color: debitYellow800,
        icon: Icons.call,
        onTap: () {},
      ),
      debitButtonWithIcon(
        buttonText: 'Details',
        color: debitGreen,
        icon: Icons.add_to_home_screen,
        onTap: () {},
      ),
    ];

    return Container(
      margin: EdgeInsets.only(top: 15, left: 15, right: 15),
      padding: EdgeInsets.only(
        top: 20,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: debitBlack87,
            blurRadius: 7,
            offset: Offset(1, 1),
          )
        ],
        color: cardColor,
      ),
      height: height,
      width: width,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  header(
                    type: 7,
                    text: cardHeader,
                    fontSize: 17,
                    color: cardTextColor,
                  ),
                  Text(
                    cardSubHeader,
                    style: TextStyle(color: cardTextColor),
                  ),
                  Text(
                    cardUsername,
                    style: TextStyle(color: cardTextColor),
                  ),
                ],
              ),
              CircleAvatar(
                backgroundImage: AssetImage(cardImage),
              )
            ],
          ),
          SizedBox(
            height: 18,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: cardButtonActions.map((e) => e).toList(),
          ),
        ],
      ),
    );
  }
}
