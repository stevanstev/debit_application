import 'dart:io';

import 'package:debit/src/ui/utils/colors.dart';
import 'package:debit/src/ui/utils/debit_space.dart';
import 'package:debit/src/ui/utils/screen_size.dart';
import 'package:debit/src/ui/utils/texts.dart';
import 'package:flutter/material.dart';

TextStyle _textStyle() {
  return TextStyle(color: debitBlue900);
}

UnderlineInputBorder _inputBorder() {
  return UnderlineInputBorder(
      borderSide: BorderSide(color: debitBlue900),
      borderRadius: BorderRadius.circular(6));
}

DropdownButtonFormField debitDropDown(
    {String value,
    List<DropdownMenuItem> items,
    onChanged,
    Text hint,
    IconData icon,
    String label,
    @required validator}) {
  return DropdownButtonFormField(
    decoration: InputDecoration(
        counterText: "",
        hintStyle: _textStyle(),
        prefixStyle: _textStyle(),
        enabledBorder: _inputBorder(),
        disabledBorder: _inputBorder(),
        labelText: label,
        prefixIcon: Icon(
          icon,
          color: debitBlue900,
        )),
    isExpanded: true,
    validator: validator,
    value: value,
    items: items,
    onChanged: onChanged,
    hint: hint,
  );
}

Widget imageUpload(
    {@required File imageState,
    @required BuildContext context,
    @required onPressed,
    @required String itemLabel,
    @required String buttonLabel,
    @required IconData placeholderIcon}) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          AnimatedContainer(
            duration: Duration(seconds: 2),
            height: fullHeightSize(context: context) * 0.25,
            width: fullWidthSize(context: context) * 0.6,
            decoration: BoxDecoration(
                color: debitGrey100,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: debitBlue900)),
            child: imageState == null
                ? Align(
                    child: Icon(
                      placeholderIcon,
                      size: fullWidthSize(context: context) * 0.3,
                      color: debitBlue800,
                    ),
                    alignment: Alignment.center)
                : ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.file(
                      imageState,
                      fit: BoxFit.fill,
                    ),
                  ),
          ),
        ],
      ),
      debitCustomTopMargin(10),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            itemLabel,
            style: simpleStyle(
                color: debitBlack54, fontSize: 17, fontWeight: FontWeight.w800),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            decoration: BoxDecoration(
                color: debitBlue800, borderRadius: BorderRadius.circular(8)),
            width: fullWidthSize(context: context) * 0.6,
            height: fullHeightSize(context: context) * 0.06,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: RaisedButton(
                splashColor: debitBlue800,
                color: debitBlue800,
                onPressed: onPressed,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.camera,
                      color: debitWhite,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      buttonLabel,
                      style: TextStyle(color: debitWhite),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    ],
  );
}

TextFormField debitTextField(
    {String label,
    int maxLength,
    Function onChanged,
    Function validator,
    IconData icon,
    bool autofocus = false}) {
  return TextFormField(
    maxLength: maxLength,
    onChanged: onChanged,
    autofocus: autofocus,
    validator: validator,
    keyboardType: TextInputType.text,
    decoration: InputDecoration(
        counterText: "",
        hintStyle: _textStyle(),
        prefixStyle: _textStyle(),
        enabledBorder: _inputBorder(),
        disabledBorder: _inputBorder(),
        labelText: label,
        prefixIcon: Icon(
          icon,
          color: debitBlue900,
        )),
  );
}

TextFormField debitNumberField(
    {String label,
    int maxLength,
    Function onChanged,
    IconData icon,
    Function onSaved,
    bool autofocus = false}) {
  return TextFormField(
    onSaved: onSaved,
    maxLength: maxLength,
    onChanged: onChanged,
    autofocus: autofocus,
    keyboardType: TextInputType.number,
    decoration: InputDecoration(
        counterText: "",
        hintStyle: _textStyle(),
        prefixStyle: _textStyle(),
        enabledBorder: _inputBorder(),
        disabledBorder: _inputBorder(),
        labelText: label,
        prefixIcon: Icon(
          icon,
          color: debitBlue900,
        )),
  );
}

TextFormField debitSecureField({
  String label,
  int maxLength,
  Function validator,
  Function onChanged,
  Function onSaved,
}) {
  return TextFormField(
    onSaved: onSaved,
    validator: validator,
    maxLength: maxLength,
    onChanged: onChanged,
    keyboardType: TextInputType.text,
    obscureText: true,
    obscuringCharacter: '*',
    decoration: InputDecoration(
      counterText: "",
      hintStyle: _textStyle(),
      prefixStyle: _textStyle(),
      enabledBorder: _inputBorder(),
      disabledBorder: _inputBorder(),
      labelText: label,
      prefixIcon: Icon(Icons.lock, color: debitBlue900),
    ),
  );
}
