import 'package:debit/src/ui/auth/debit_app_bar.dart';
import 'package:debit/src/ui/utils/colors.dart';
import 'package:debit/src/ui/utils/debit_buttons.dart';
import 'package:debit/src/ui/utils/debit_form.dart';
import 'package:debit/src/ui/utils/debit_space.dart';
import 'package:debit/src/ui/utils/screen_size.dart';
import 'package:debit/src/ui/utils/strings.dart';
import 'package:debit/src/ui/utils/texts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  @override
  Widget build(Object context) {
    return Scaffold(
      backgroundColor: debitGrey100,
      appBar: DebitAppBar(
        title: 'User Profile',
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: 15,
              bottom: 15,
            ),
            child: Column(
              children: [
                Container(
                  width: fullWidthSize(context: context) * 0.2,
                  height: fullHeightSize(context: context) * 0.1,
                  child: CircleAvatar(
                    backgroundImage: AssetImage(
                      'assets/images/irene.jpg',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              top: 16,
              bottom: 20,
              left: 12,
              right: 12,
            ),
            margin: EdgeInsets.only(
              top: 10,
              bottom: 30,
              left: 15,
              right: 15,
            ),
            decoration: BoxDecoration(
              color: debitWhite,
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  color: debitBlack54,
                  offset: Offset(1, 1),
                ),
              ],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                header(
                  color: debitBlack87,
                  type: 7,
                  fontSize: 19,
                  text: 'Registered Data',
                ),
                debitCustomTopMargin(10),
                debitNumberField(
                  initialValue: '081345678987',
                  icon: Icons.phone,
                  label: phoneNumberLabel,
                  maxLength: 12,
                  onChanged: (phone) {
                    return phone;
                  },
                ),
                debitCustomTopMargin(10),
                debitTextField(
                    initialValue: 'Stevanus Steven',
                    icon: Icons.person,
                    label: fullNameLabel,
                    maxLength: 30,
                    onChanged: null,
                    validator: null),
                debitCustomTopMargin(10),
                debitTextField(
                    initialValue: '980786622456789',
                    icon: Icons.branding_watermark,
                    label: idCardNumberLabel,
                    maxLength: 30,
                    onChanged: null,
                    validator: null),
                debitCustomTopMargin(10),
                debitNumberField(
                  icon: Icons.format_list_numbered,
                  label: ageLabel,
                  initialValue: '56',
                  maxLength: 30,
                  onChanged: null,
                ),
                debitCustomTopMargin(10),
                debitTextField(
                    icon: Icons.chrome_reader_mode,
                    label: familyCardNumberLabel,
                    initialValue: '9998213213213213',
                    maxLength: 30,
                    onChanged: null,
                    validator: null),
                debitCustomTopMargin(10),
                debitTextField(
                    initialValue: 'Alam Sutera 123',
                    icon: Icons.location_on,
                    label: addressLabel,
                    maxLength: 30,
                    onChanged: null,
                    validator: null),
                debitCustomTopMargin(30),
                debitDefaultButton(
                  splashColor: debitBlue800,
                  height: fullHeightSize(context: context) * 0.06,
                  label: 'CHANGE',
                  labelColor: debitWhite,
                  onTap: () {},
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
