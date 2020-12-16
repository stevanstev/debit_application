import 'package:debit/src/states/login_state.dart';

class LoginProvider {
  Future<LoginState> sendToServer({String phoneNumber, String password}) async {
    Map<String, dynamic> errors = {};

    if (phoneNumber == '081234567891') {
      errors['phoneNumber'] = 'Phone number already exists';
    }

    if (errors.isEmpty) {
      return SuccessLoginState(token: 'asdasd312321');
    } else {
      return ValidationErrorsState(errors: errors);
    }
  }
}
