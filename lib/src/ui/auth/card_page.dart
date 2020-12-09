import 'package:carousel_slider/carousel_slider.dart';
import 'package:debit/src/ui/auth/debit_app_bar.dart';
import 'package:debit/src/ui/utils/colors.dart';
import 'package:debit/src/ui/utils/debit_space.dart';
import 'package:debit/src/ui/utils/dot_shape.dart';
import 'package:debit/src/ui/utils/screen_size.dart';
import 'package:debit/src/ui/utils/strings.dart';
import 'package:debit/src/ui/utils/texts.dart';
import 'package:debit/src/ui/widgets/credit_card.dart';
import 'package:flutter/material.dart';

class CardPage extends StatefulWidget {
  @override
  _CardPageState createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  bool flip = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DebitAppBar(
        title: cardsLabel,
        height: 150,
      ),
      body: ListView(
        children: [
          debitCustomTopMargin(8),
          CarouselSlider(
              items: [
                GestureDetector(
                    onTap: () {
                      setState(() {
                        flip = !flip;
                      });
                    },
                    child: CreditCard(
                      cardHolderName: 'Stevanus Steven',
                      cardNumber: '6046181989',
                      cvvCode: '15142',
                      isCvvFocused: flip,
                      height: fullHeightSize(context: context) * 0.25,
                      width: fullWidthSize(context: context),
                    )),
              ],
              options: CarouselOptions(
                viewportFraction: 1,
                pageSnapping: true,
                initialPage: 0,
                enlargeCenterPage: true,
              )),
          debitCustomTopMargin(8),
          Align(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DotShape(opacity: 0.8),
                SizedBox(
                  width: fullWidthSize(context: context) * 0.02,
                ),
                DotShape(opacity: 0.4),
                SizedBox(
                  width: fullWidthSize(context: context) * 0.02,
                ),
              ],
            ),
          ),
          debitCustomTopMargin(8),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: debitGrey100,
                    border:
                        Border(top: BorderSide(color: debitGrey200, width: 3))),
                child: Padding(
                  padding:
                      EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        listOfSubmissions,
                        style: simpleStyle(
                            fontSize: 18,
                            color: debitBlack87,
                            fontWeight: FontWeight.w100),
                      ),
                      InkWell(
                        splashColor: debitBlue800,
                        onTap: () {
                          print('Unimplemented');
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
                                  fontSize: 15, color: debitBlue800),
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
                                  fontSize: 15, color: debitBlue800),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
