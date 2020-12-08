import 'package:debit/src/resources/networks/auth_provider.dart';
import 'package:debit/src/states/auth_state.dart';

class AuthRepository {
  AuthProvider _provider = AuthProvider();

  Future<GetAuthTokenState> getToken() async => await _provider.getToken();

  Future<bool> setToken(String token) async => await _provider.setToken(token);

  Future<RemoveAuthTokenState> removeToken() async =>
      await _provider.removeToken();
}
