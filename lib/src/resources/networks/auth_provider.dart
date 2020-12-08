import 'package:debit/src/states/auth_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider {
  Future<bool> setToken(String token) async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    await _preferences.setString('token', token);

    return true;
  }

  Future<GetAuthTokenState> getToken() async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    String token = _preferences.getString('token') ?? '';
    return GetAuthTokenState(token);
  }

  Future<RemoveAuthTokenState> removeToken() async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    await _preferences.remove('token');
    return RemoveAuthTokenState(true);
  }
}
