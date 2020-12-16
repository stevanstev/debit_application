import 'package:debit/src/ui/utils/colors.dart';
import 'package:debit/src/ui/utils/debit_buttons.dart';
import 'package:debit/src/ui/utils/strings.dart';
import 'package:debit/src/ui/utils/texts.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final double height, width, bottomPadding;
  final Color color;
  final String idCard, submissionDate, image;

  CustomCard({
    @required this.width,
    @required this.height,
    @required this.color,
    @required this.idCard,
    @required this.submissionDate,
    @required this.image,
    this.bottomPadding = 30,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: bottomPadding),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: debitTransparent, borderRadius: BorderRadius.circular(8)),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Material(
                elevation: 8,
                color: Colors.transparent,
                child: Container(
                  decoration: BoxDecoration(
                      color: color, borderRadius: BorderRadius.circular(10)),
                  width: width * 0.82,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                height: height * 0.5,
                width: width * 0.2,
                child: CircleAvatar(
                  backgroundImage: AssetImage(image),
                ),
              ),
            ),
            Positioned(
              right: width * 0.07,
              top: height * 0.04,
              child: InkWell(
                child: Icon(
                  Icons.more_vert,
                  color: debitWhite,
                ),
              ),
            ),
            Positioned(
                top: height * 0.1,
                left: width * 0.22,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    header(
                        color: debitWhite,
                        fontSize: 22,
                        text: 'Irene',
                        type: 7),
                    Row(
                      children: [
                        Icon(Icons.perm_identity, color: debitWhite, size: 13),
                        SizedBox(
                          width: 2,
                        ),
                        Text(
                          'ID Card:',
                          style: simpleStyle(color: debitWhite, fontSize: 13),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          idCard,
                          style: simpleStyle(color: debitWhite, fontSize: 13),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.date_range, color: debitWhite, size: 13),
                        SizedBox(
                          width: 2,
                        ),
                        Text(
                          'Submission Date:',
                          style: simpleStyle(color: debitWhite, fontSize: 13),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          submissionDate,
                          style: simpleStyle(color: debitWhite, fontSize: 13),
                        )
                      ],
                    ),
                  ],
                )),
            Positioned(
                right: width * 0.11,
                bottom: height * 0.1,
                child: Row(
                  children: [
                    debitDefaultButton(
                        elevation: 10,
                        buttonColor: debitBlue900,
                        splashColor: debitBlue800,
                        height: height * 0.2,
                        width: width * 0.2,
                        label: detailsLabel,
                        labelColor: debitWhite,
                        onTap: () {}),
                    SizedBox(
                      width: 5,
                    ),
                    debitDefaultButton(
                        elevation: 10,
                        buttonColor: debitRed800,
                        splashColor: debitRed400,
                        height: height * 0.2,
                        width: width * 0.2,
                        label: cancelLabel,
                        labelColor: debitWhite,
                        onTap: () {}),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
