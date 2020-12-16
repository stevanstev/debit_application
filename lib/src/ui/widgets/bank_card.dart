import 'package:debit/src/ui/utils/colors.dart';
import 'package:debit/src/ui/utils/texts.dart';
import 'package:debit/src/ui/widgets/circle_shape.dart';
import 'package:flutter/material.dart';

class BankCard extends StatelessWidget {
  final double height, width;
  final List<Text> cardNumbers;
  final List<Color> cardGradient;
  final String cardHolder;

  ///[width] width of the card container
  ///
  ///[height] height of the card container
  ///
  ///[cardNumbers] list of card number in Text widget format
  ///
  ///[cardGradient] color gradient for bank card
  ///
  ///[cardHolder] the name of card holder in string
  /// ```
  /// BankCard({width: 200, height: 200, cardNumbers: [Text(), Text()], cardHolder: 'Annon'})
  /// ```
  BankCard({
    @required this.width,
    @required this.height,
    @required this.cardNumbers,
    @required this.cardGradient,
    @required this.cardHolder,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: cardGradient),
        borderRadius: BorderRadius.circular(8),
      ),
      height: height,
      width: width,
      child: Stack(
        children: [
          Positioned(
              top: 10,
              left: 15,
              child: Row(
                children: [
                  header(
                    color: debitWhite,
                    text: 'Debit Bank',
                    type: 7,
                    fontSize: 19,
                  )
                ],
              )),
          Positioned(
            left: 15,
            top: 35,
            child: Container(
              width: 15,
              height: 15,
              decoration: BoxDecoration(
                  color: debitGrey, borderRadius: BorderRadius.circular(3)),
            ),
          ),
          Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: cardNumbers,
              )),
          Positioned(
              right: 40,
              bottom: 25,
              child: CircleShape(
                  color: Colors.red,
                  width: width * 0.15,
                  height: height * 0.2)),
          Positioned(
            right: 20,
            bottom: 25,
            child: CircleShape(
                color: Colors.red, width: width * 0.15, height: height * 0.2),
          ),
          Positioned(
              bottom: 10,
              right: 15,
              child: header(
                  text: 'mastercard',
                  color: debitBlack45,
                  fontSize: 15,
                  type: 7)),
          Positioned(
              bottom: 10,
              left: 15,
              child: header(
                  text: cardHolder, color: debitWhite, fontSize: 13, type: 7))
        ],
      ),
    );
  }
}
