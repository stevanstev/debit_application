import 'package:debit/src/blocs/qr_code_bloc.dart';
import 'package:debit/src/events/qr_code_event.dart';
import 'package:debit/src/states/qr_code_state.dart';
import 'package:debit/src/ui/auth/debit_app_bar.dart';
import 'package:debit/src/ui/utils/colors.dart';
import 'package:debit/src/ui/utils/debit_buttons.dart';
import 'package:debit/src/ui/utils/debit_form.dart';
import 'package:debit/src/ui/utils/screen_size.dart';
import 'package:debit/src/ui/utils/texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GenerateQr extends StatelessWidget {
  final List<String> _debitCard = [
    '1234-5678-3452-1245',
    '8765-5497-0974-2354'
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider<QrCodeBloc>(
      create: (context) => QrCodeBloc(defaultDebitCard: _debitCard[0]),
      child: Scaffold(
        appBar: DebitAppBar(
          title: 'QR Code',
        ),
        body: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(top: 20, left: 20, right: 20),
              width: fullWidthSize(context: context) * 0.9,
              height: fullHeightSize(context: context) * 0.3,
              decoration: BoxDecoration(
                  color: debitGrey200,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 8,
                      color: debitBlack54,
                      offset: Offset(1, 1),
                    )
                  ]),
              child: Column(children: [
                Text('Generate Your QR CODE',
                    style: simpleStyle(
                      color: debitBlack87,
                      fontSize: 18,
                    )),
                SizedBox(
                  height: 5,
                ),
                Text('Select your debit Card number below',
                    style: simpleStyle(
                      color: debitBlack87,
                      fontSize: 14,
                    )),
                SizedBox(
                  height: 5,
                ),
                BlocBuilder<QrCodeBloc, QrCodeState>(
                    buildWhen: (prevState, newState) => prevState != newState,
                    builder: (context, qrCodeState) {
                      if (qrCodeState is QrCodeDefaultState ||
                          qrCodeState is QrCodeChangeState ||
                          qrCodeState is GenerateQrCodeState) {
                        String _defaultCard = qrCodeState.props[0].toString();
                        return Column(
                          children: [
                            debitDropDown(
                                icon: Icons.credit_card,
                                label: 'Debit Card',
                                validator: (v) {},
                                value: _defaultCard,
                                items: _debitCard.map((card) {
                                  return DropdownMenuItem(
                                    child: Text('$card'),
                                    value: card,
                                  );
                                }).toList(),
                                onChanged: (v) {
                                  BlocProvider.of<QrCodeBloc>(context)
                                      .add(DebitCardSelectEvent(debitCard: v));
                                }),
                            SizedBox(
                              height: 18,
                            ),
                            debitDefaultButton(
                                splashColor: debitBlue800,
                                height: 50,
                                width: fullWidthSize(context: context) * 0.8,
                                label: 'Generate',
                                labelColor: debitWhite,
                                onTap: () {
                                  BlocProvider.of<QrCodeBloc>(context)
                                      .add(GenerateQrCodeEvent(
                                    debitCard: _defaultCard,
                                  ));
                                }),
                          ],
                        );
                      }

                      return Container(
                        margin: EdgeInsets.only(
                          left: fullWidthSize(context: context) * 0.1,
                          right: fullWidthSize(context: context) * 0.1,
                          top: fullHeightSize(context: context) * 0.05,
                        ),
                        child: Text(
                          'Please Wait, we are generating your QR CODE...',
                          style: simpleStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      );
                    }),
              ]),
            ),
            BlocBuilder<QrCodeBloc, QrCodeState>(
              builder: (context, qrCodeState) {
                bool _visible = true;
                if (qrCodeState is ShowLoadingState) {
                  _visible = true;
                } else {
                  _visible = false;
                }

                return Visibility(
                  child: Container(
                    margin: EdgeInsets.only(
                      top: fullHeightSize(context: context) * 0.2,
                      right: fullWidthSize(context: context) * 0.45,
                      left: fullWidthSize(context: context) * 0.45,
                    ),
                    child: CircularProgressIndicator(),
                  ),
                  visible: _visible,
                );
              },
            ),
            BlocBuilder<QrCodeBloc, QrCodeState>(
              builder: (context, qrCodeState) {
                if (qrCodeState is GenerateQrCodeState) {
                  return AnimatedContainer(
                    width: fullWidthSize(context: context) * 0.8,
                    margin: EdgeInsets.only(
                      top: 38,
                      left: fullWidthSize(context: context) * 0.1,
                      right: fullWidthSize(context: context) * 0.1,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: debitTransparent,
                      boxShadow: [
                        BoxShadow(
                          color: debitBlack45,
                          blurRadius: 10,
                          offset: Offset(1, 1),
                        ),
                      ],
                    ),
                    duration: Duration(seconds: 2),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 0),
                      child: Center(
                        child: Material(
                          borderRadius: BorderRadius.circular(8),
                          child: QrImage(
                            backgroundColor: debitGrey200,
                            embeddedImage:
                                AssetImage('assets/images/launch_image.png'),
                            size: fullWidthSize(context: context) * 0.8,
                            version: QrVersions.auto,
                            data: qrCodeState.props[0].toString(),
                          ),
                        ),
                      ),
                    ),
                  );
                }

                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
