import 'package:debit/src/resources/networks/login_provider.dart';
import 'package:debit/src/states/login_state.dart';

class LoginRepository {
  final LoginProvider _network = LoginProvider();

  Future<LoginState> sendToServer(
          {String phoneNumber, String password}) async =>
      await _network.sendToServer(phoneNumber: phoneNumber, password: password);
}
