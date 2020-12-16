import 'package:flutter/widgets.dart';

class AuthState with ChangeNotifier {
  String _token;

  String get token => _token;

  set token(String newToken) {
    _token = newToken;
    notifyListeners();
  }
}
