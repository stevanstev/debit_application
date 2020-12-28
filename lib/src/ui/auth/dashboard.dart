import 'package:carousel_slider/carousel_slider.dart';
import 'package:debit/src/blocs/auth_bloc.dart';
import 'package:debit/src/blocs/theme_bloc.dart';
import 'package:debit/src/events/auth_event.dart';
import 'package:debit/src/models/monthly_data.dart';
import 'package:debit/src/states/auth_state.dart';
import 'package:debit/src/ui/auth/account/account_amount.dart';
import 'package:debit/src/ui/auth/advertisement.dart';
import 'package:debit/src/ui/auth/card_monthly_usage.dart';
import 'package:debit/src/ui/auth/debit_app_bar.dart';
import 'package:debit/src/ui/auth/permissions/access_camera.dart';
import 'package:debit/src/ui/auth/qr_code/generate_qr.dart';
import 'package:debit/src/ui/auth/transfer/send_money.dart';
import 'package:debit/src/ui/utils/load_view.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:debit/src/ui/utils/colors.dart';
import 'package:debit/src/ui/utils/debit_border.dart';
import 'package:debit/src/ui/utils/debit_buttons.dart';
import 'package:debit/src/ui/utils/debit_space.dart';
import 'package:debit/src/ui/utils/dot_shape.dart';
import 'package:debit/src/ui/utils/screen_size.dart';
import 'package:debit/src/ui/utils/strings.dart';
import 'package:debit/src/ui/utils/texts.dart';
import 'package:debit/src/ui/widgets/bank_card.dart';
import 'package:debit/src/ui/widgets/clippers.dart';
import 'package:debit/src/ui/widgets/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  AuthBloc _authBloc = AuthBloc();
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
                  BlocBuilder<ThemeBloc, ThemeState>(
                    builder: (context, themeState) => Container(
                      width: fullWidthSize(context: context),
                      height: fullHeightSize(context: context) * 0.15,
                      child: Stack(
                        children: [
                          ClipPath(
                            clipper: DefaultClipper(),
                            child: Container(
                              width: fullWidthSize(context: context),
                              height: fullHeightSize(context: context) * 0.2,
                              color: themeState.props[0],
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
                            child: Container(
                              width: fullWidthSize(context: context) * 0.9,
                              height: fullHeightSize(context: context) * 0.1,
                              decoration: BoxDecoration(
                                  color: debitBlack54,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  debitButtonWithIcon(
                                    buttonText: amountLabel,
                                    color: debitWhite,
                                    icon: Icons.attach_money,
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (_) => AccountAmount()));
                                    },
                                  ),
                                  debitButtonWithIcon(
                                      buttonText: sendLabel,
                                      color: debitWhite,
                                      icon: Icons.send,
                                      onTap: () async {
                                        bool cameraPermission =
                                            await requestCameraPermission();
                                        if (cameraPermission) {
                                          String qrScanResult =
                                              await scanner.scan();
                                          if (qrScanResult.isEmpty) {
                                            Scaffold.of(context).showSnackBar(
                                                SnackBar(
                                                    content: Text(
                                                        'Qr Scan Canceled')));
                                          } else {
                                            WidgetsBinding.instance
                                                .addPostFrameCallback(
                                                    (timeStamp) {
                                              return Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          SendMoney(
                                                            accountData: {
                                                              'accountNumber':
                                                                  qrScanResult,
                                                              'accountName':
                                                                  'Steven',
                                                            },
                                                          )));
                                            });
                                          }
                                        } else {
                                          Scaffold.of(context).showSnackBar(
                                              SnackBar(
                                                  content: Text(
                                                      'No Camera Permission')));
                                        }
                                      }),
                                  debitButtonWithIcon(
                                    buttonText: qrCodeLabel,
                                    color: debitWhite,
                                    icon: Icons.apps,
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  GenerateQr()));
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Container(
                      width: fullWidthSize(context: context),
                      decoration: BoxDecoration(color: debitGrey100),
                      child: Column(
                        children: [
                          CarouselSlider(
                              items: [
                                GestureDetector(
                                    child: Container(
                                        child: BankCard(
                                  cardGradient: [
                                    Colors.amber,
                                    Colors.yellow[800]
                                  ],
                                  cardHolder: 'STEVANUS STEVEN',
                                  cardNumbers: [
                                    header(
                                        text: '1234',
                                        color: debitWhite,
                                        fontSize: 19,
                                        type: 7),
                                    header(
                                        text: '5678',
                                        color: debitWhite,
                                        fontSize: 19,
                                        type: 7),
                                    header(
                                        text: '3452',
                                        color: debitWhite,
                                        fontSize: 19,
                                        type: 7),
                                    header(
                                        text: '1245',
                                        color: debitWhite,
                                        fontSize: 19,
                                        type: 7),
                                  ],
                                  height:
                                      fullHeightSize(context: context) * 0.23,
                                  width: fullWidthSize(context: context),
                                ))),
                                GestureDetector(
                                    child: Container(
                                  child: BankCard(
                                    cardGradient: [debitGrey, Colors.blueGrey],
                                    cardHolder: 'STEVANUS STEVEN',
                                    cardNumbers: [
                                      header(
                                          text: '8765',
                                          color: debitWhite,
                                          fontSize: 19,
                                          type: 7),
                                      header(
                                          text: '5497',
                                          color: debitWhite,
                                          fontSize: 19,
                                          type: 7),
                                      header(
                                          text: '0974',
                                          color: debitWhite,
                                          fontSize: 19,
                                          type: 7),
                                      header(
                                          text: '2354',
                                          color: debitWhite,
                                          fontSize: 19,
                                          type: 7),
                                    ],
                                    height:
                                        fullHeightSize(context: context) * 0.23,
                                    width: fullWidthSize(context: context),
                                  ),
                                )),
                              ],
                              options: CarouselOptions(
                                aspectRatio: 16 / 8,
                                onPageChanged: (index, reason) {
                                  setState(() {
                                    _cardIndex = index;
                                  });
                                },
                                viewportFraction: 0.85,
                                pageSnapping: true,
                                initialPage: 0,
                                enlargeCenterPage: true,
                              )),
                          debitCustomTopMargin(20),
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
