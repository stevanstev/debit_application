import 'package:carousel_slider/carousel_slider.dart';
import 'package:debit/src/blocs/auth_bloc.dart';
import 'package:debit/src/events/auth_event.dart';
import 'package:debit/src/models/monthly_data.dart';
import 'package:debit/src/states/auth_state.dart';
import 'package:debit/src/ui/auth/advertisement.dart';
import 'package:debit/src/ui/auth/card_monthly_usage.dart';
import 'package:debit/src/ui/auth/debit_app_bar.dart';
import 'package:debit/src/ui/utils/colors.dart';
import 'package:debit/src/ui/utils/debit_border.dart';
import 'package:debit/src/ui/utils/debit_space.dart';
import 'package:debit/src/ui/utils/dot_shape.dart';
import 'package:debit/src/ui/utils/screen_size.dart';
import 'package:debit/src/ui/utils/strings.dart';
import 'package:debit/src/ui/utils/texts.dart';
import 'package:debit/src/ui/widgets/clippers.dart';
import 'package:debit/src/ui/widgets/credit_card.dart';
import 'package:debit/src/ui/widgets/loading_screen.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  AuthBloc _authBloc = AuthBloc();
  bool flip = false;
  int _cardIndex = 0;
  List<List<MonthlyData>> _monthlyDatas = [
    [
      MonthlyData('Jan', 3),
      MonthlyData('Feb', 7),
      MonthlyData('Mar', 10),
      MonthlyData('Apr', 4),
      MonthlyData('Jun', 35),
    ],
    [
      MonthlyData('Jan', 5),
      MonthlyData('Feb', 10),
      MonthlyData('Mar', 5),
      MonthlyData('Apr', 9),
      MonthlyData('Jun', 14),
    ]
  ];

  @override
  void initState() {
    super.initState();
    _authBloc.eventSink.add(GetAuthTokenEvent());
  }

  @override
  void dispose() {
    _authBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        initialData: GetAuthTokenState(''),
        stream: _authBloc.stateStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              backgroundColor: debitGrey100,
              appBar: DebitAppBar(
                title: appName,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              body: ListView(
                children: [
                  Container(
                    width: fullWidthSize(context: context),
                    height: fullHeightSize(context: context) * 0.15,
                    child: Stack(
                      children: [
                        ClipPath(
                          clipper: DefaultClipper(),
                          child: Container(
                            width: fullWidthSize(context: context),
                            height: fullHeightSize(context: context) * 0.2,
                            color: debitBlue900,
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: EdgeInsets.only(left: 16),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Good Evening, Stevanus',
                                      style: simpleStyle(
                                          color: debitWhite,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: DefaultTabController(
                              length: 3,
                              child: Container(
                                  width: fullWidthSize(context: context) * 0.9,
                                  decoration: BoxDecoration(
                                      color: debitBlack54,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: TabBar(
                                    indicatorColor: debitTransparent,
                                    tabs: [
                                      Tab(
                                        child: InkWell(
                                          splashColor: debitBlack,
                                          child: Text(
                                            amountLabel,
                                            style: TextStyle(color: debitWhite),
                                          ),
                                        ),
                                        icon: Icon(
                                          Icons.attach_money,
                                          color: debitWhite,
                                        ),
                                      ),
                                      Tab(
                                        child: InkWell(
                                            splashColor: debitBlack,
                                            child: Text(
                                              sendLabel,
                                              style:
                                                  TextStyle(color: debitWhite),
                                            )),
                                        icon: Icon(
                                          Icons.send,
                                          color: debitWhite,
                                        ),
                                      ),
                                      Tab(
                                        child: InkWell(
                                          splashColor: debitBlack,
                                          child: Text(
                                            historyLabel,
                                            style: TextStyle(color: debitWhite),
                                          ),
                                        ),
                                        icon: Icon(
                                          Icons.history,
                                          color: debitWhite,
                                        ),
                                      )
                                    ],
                                  ))),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Container(
                      width: fullWidthSize(context: context),
                      decoration: BoxDecoration(color: debitGrey100),
                      child: Column(
                        children: [
                          CarouselSlider(
                              items: [
                                GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        flip = !flip;
                                      });
                                    },
                                    child: Container(
                                      child: CreditCard(
                                        cardbgColor: debitYellow800,
                                        expiryDate: 'Stevanus Steven',
                                        cardHolderName: 'Debit Gold',
                                        cardNumber: '6046181989',
                                        cvvCode: '15142',
                                        isCvvFocused: flip,
                                        height:
                                            fullHeightSize(context: context) *
                                                0.23,
                                        width: fullWidthSize(context: context),
                                      ),
                                    )),
                                GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        flip = !flip;
                                      });
                                    },
                                    child: Container(
                                      child: CreditCard(
                                        cardbgColor: Colors.blueGrey[100],
                                        expiryDate: 'Stevanus Steven',
                                        cardHolderName: 'Debit Silver',
                                        cardNumber: '6046181967',
                                        cvvCode: '15132',
                                        isCvvFocused: flip,
                                        height:
                                            fullHeightSize(context: context) *
                                                0.23,
                                        width: fullWidthSize(context: context),
                                      ),
                                    )),
                              ],
                              options: CarouselOptions(
                                onPageChanged: (index, reason) {
                                  setState(() {
                                    _cardIndex = index;
                                  });
                                },
                                viewportFraction: 1,
                                pageSnapping: true,
                                initialPage: 0,
                                enlargeCenterPage: true,
                              )),
                          Align(
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [0, 1].map((i) {
                                return Row(
                                  children: [
                                    DotShape(
                                        opacity: (i == _cardIndex) ? 0.8 : 0.4),
                                    SizedBox(
                                      width: fullWidthSize(context: context) *
                                          0.02,
                                    )
                                  ],
                                );
                              }).toList(),
                            ),
                          ),
                          debitCustomTopMargin(8)
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Container(
                      width: fullWidthSize(context: context) * 0.8,
                      decoration: BoxDecoration(
                          color: debitWhite,
                          border: Border(
                              top: debitDefaultBorderSide,
                              bottom: debitDefaultBorderSide)),
                      child: Padding(
                        padding: EdgeInsets.all(15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CardMonthlyUsage(
                              key: UniqueKey(),
                              datas: _monthlyDatas[_cardIndex],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 0),
                    child: Container(
                      height: fullHeightSize(context: context) * 0.27,
                      width: fullWidthSize(context: context),
                      decoration: BoxDecoration(
                          color: debitWhite,
                          border: Border(bottom: debitDefaultBorderSide)),
                      child: Padding(
                        padding: EdgeInsets.only(top: 8, bottom: 8),
                        child: Advertisement(
                          items: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image(
                                image: AssetImage('assets/images/adv1.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                            ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image(
                                  image: AssetImage('assets/images/adv2.png'),
                                  fit: BoxFit.cover,
                                )),
                            ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image(
                                  image: AssetImage('assets/images/adv3.png'),
                                  fit: BoxFit.cover,
                                ))
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return LoadingScreen();
          }
        });
  }
}
