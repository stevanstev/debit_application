import 'package:debit/src/blocs/base_bloc.dart';
import 'package:debit/src/events/auth_event.dart';
import 'package:debit/src/resources/repositories/auth_repository.dart';
import 'package:debit/src/states/auth_state.dart';

class AuthBloc extends BaseBloc<AuthEvent, AuthState> {
  AuthRepository _repository = AuthRepository();

  @override
  void mapEventToState(e) {
    if (e is GetAuthTokenEvent) {
      getAuthTokenEvent();
    } else if (e is RemoveAuthTokenEvent) {
      removeAuthTokenEvent();
    }
  }

  removeAuthTokenEvent() async {
    RemoveAuthTokenState status = await _repository.removeToken();
    stateSink.add(status);
  }

  getAuthTokenEvent() async {
    GetAuthTokenState data = await _repository.getToken();
    stateSink.add(data);
  }
}
