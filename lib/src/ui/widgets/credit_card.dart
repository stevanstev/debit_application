import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class CreditCard extends StatelessWidget {
  final String cardNumber, expiryDate, cardHolderName, cvvCode;
  final bool isCvvFocused;
  final double width, height;
  final Color cardbgColor;

  CreditCard(
      {this.cardNumber,
      this.expiryDate = 'Username',
      this.cardHolderName,
      this.cvvCode,
      this.isCvvFocused,
      this.width,
      this.height,
      this.cardbgColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: Material(
        borderRadius: BorderRadius.circular(10),
        child: CreditCardWidget(
          height: height,
          width: width,
          cardNumber: cardNumber,
          expiryDate: expiryDate,
          cardHolderName: cardHolderName,
          cvvCode: cvvCode,
          showBackView: isCvvFocused,
          cardbgColor: cardbgColor,
        ),
      ),
    );
  }
}
