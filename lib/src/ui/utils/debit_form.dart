import 'package:debit/src/ui/utils/colors.dart';
import 'package:flutter/material.dart';

TextStyle _textStyle() {
  return TextStyle(color: debitBlue900);
}

UnderlineInputBorder _inputBorder() {
  return UnderlineInputBorder(
      borderSide: BorderSide(color: debitBlue900),
      borderRadius: BorderRadius.circular(6));
}

TextFormField debitNumberField(
    {String label,
    int maxLength,
    Function onChanged(val),
    Function validator}) {
  return TextFormField(
    maxLength: maxLength,
    onChanged: onChanged,
    autofocus: true,
    validator: validator,
    keyboardType: TextInputType.number,
    decoration: InputDecoration(
        counterText: "",
        hintStyle: _textStyle(),
        prefixStyle: _textStyle(),
        enabledBorder: _inputBorder(),
        disabledBorder: _inputBorder(),
        labelText: label,
        prefixIcon: Icon(
          Icons.phone,
          color: debitBlue900,
        )),
  );
}

TextFormField debitSecureField(
    {String label,
    int maxLength,
    Function onChanged(val),
    Function validator}) {
  return TextFormField(
    validator: validator,
    maxLength: maxLength,
    onChanged: onChanged,
    keyboardType: TextInputType.text,
    obscureText: true,
    obscuringCharacter: '*',
    decoration: InputDecoration(
      hintStyle: _textStyle(),
      prefixStyle: _textStyle(),
      enabledBorder: _inputBorder(),
      disabledBorder: _inputBorder(),
      labelText: label,
      prefixIcon: Icon(Icons.lock, color: debitBlue900),
    ),
  );
}
