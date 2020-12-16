import 'package:debit/src/ui/utils/colors.dart';
import 'package:debit/src/ui/utils/screen_size.dart';
import 'package:debit/src/ui/utils/strings.dart';
import 'package:debit/src/ui/utils/texts.dart';
import 'package:debit/src/ui/widgets/box_text_field.dart';
import 'package:flutter/material.dart';

class PinView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double sizedBoxWidth = fullWidthSize(context: context) * 0.3 / 14;
    double width = fullWidthSize(context: context) * 1.7 / 14;
    final node = FocusScope.of(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            header(
                context: context,
                text: appName,
                type: 7,
                fontSize: 38,
                color: debitBlue900),
            SizedBox(
              height: 17,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BoxTextField(
                  autoFocus: true,
                  width: width,
                  onChanged: (v) {
                    if (v != '') {
                      node.nextFocus();
                    }
                  },
                  onEditingComplete: () => node.nextFocus(),
                ),
                SizedBox(
                  width: sizedBoxWidth,
                ),
                BoxTextField(
                  width: width,
                  onChanged: (v) {
                    if (v != '') {
                      node.nextFocus();
                    }
                  },
                  onEditingComplete: () => node.nextFocus(),
                ),
                SizedBox(
                  width: sizedBoxWidth,
                ),
                BoxTextField(
                  width: width,
                  onChanged: (v) {
                    if (v != '') {
                      node.nextFocus();
                    }
                  },
                  onEditingComplete: () => node.nextFocus(),
                ),
                SizedBox(
                  width: sizedBoxWidth,
                ),
                BoxTextField(
                  width: width,
                  onChanged: (v) {
                    if (v != '') {
                      node.nextFocus();
                    }
                  },
                  onEditingComplete: () => node.nextFocus(),
                ),
                SizedBox(
                  width: sizedBoxWidth,
                ),
                BoxTextField(
                  width: width,
                  onChanged: (v) {
                    if (v != '') {
                      node.nextFocus();
                    }
                  },
                  onEditingComplete: () => node.nextFocus(),
                ),
                SizedBox(
                  width: sizedBoxWidth,
                ),
                BoxTextField(
                  width: width,
                  onChanged: (v) {
                    if (v != '') {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          '/bottomNavigation', (route) => false);
                    }
                  },
                  onEditingComplete: () {
                    print('login bloc!');
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
