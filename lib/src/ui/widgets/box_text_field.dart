import 'package:debit/src/ui/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class BoxTextField extends StatelessWidget {
  final double width;
  final Function onChanged, onEditingComplete;
  final int maxLength;
  final bool autoFocus;

  ///[width] the size of the box
  ///
  ///[onChanged] when the input is changed
  ///
  ///[onEditingComplete] when user enter arrow on keyboard
  ///
  ///[maxLength] input box max lenght
  ///
  ///[autoFocus] input box focus on page loaded
  ///```
  ///BoxTextField(width: 100, onChanged: () {}, onEditingComplete: () {}, maxLength: 12, autoFocus: true});
  ///```
  BoxTextField(
      {@required this.width,
      @required this.onChanged,
      @required this.onEditingComplete,
      this.maxLength = 1,
      this.autoFocus = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 60,
      child: TextField(
        keyboardType: TextInputType.number,
        style: TextStyle(
          fontSize: 19,
          fontWeight: FontWeight.bold,
        ),
        textAlignVertical: TextAlignVertical.center,
        autofocus: autoFocus,
        maxLength: maxLength,
        showCursor: true,
        obscuringCharacter: '*',
        obscureText: true,
        textAlign: TextAlign.center,
        onChanged: onChanged,
        onEditingComplete: onEditingComplete,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide(
              color: debitBlue900,
            ),
          ),
          counterText: '',
        ),
      ),
    );
  }
}
