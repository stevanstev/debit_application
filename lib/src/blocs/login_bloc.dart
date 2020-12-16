import 'package:debit/src/blocs/base_bloc.dart';
import 'package:debit/src/events/login_event.dart';
import 'package:debit/src/resources/repositories/login_repository.dart';
import 'package:debit/src/states/login_state.dart';

class LoginBloc extends BaseBloc<LoginEvent, LoginState> {
  LoginRepository _repository = LoginRepository();

  @override
  mapEventToState(LoginEvent event) {
    if (event is SubmitLoginEvent) {
      _submitLoginEvent(event);
    } else if (event is SendRequestToServerEvent) {
      _sendRequestToServerEvent(event);
    }
  }

  _sendRequestToServerEvent(SendRequestToServerEvent e) async {
    LoginState state = await _repository.sendToServer(
        phoneNumber: e.phoneNumber, password: e.password);

    stateSink.add(state);
  }

  _submitLoginEvent(SubmitLoginEvent e) {
    String phoneNumber = e.phoneNumber;
    String password = e.password;
    Map<String, dynamic> errors = {};

    if (phoneNumber == '') {
      errors['phoneNumber'] = 'Phone Number cannot be empty';
    } else if (phoneNumber.length < 12) {
      errors['phoneNumber'] = 'Please input valid phone number';
    }

    if (password == '') {
      errors['password'] = 'Password cannot be empty';
    }

    if (errors.isEmpty) {
      stateSink.add(LoadingProgressState());
    } else {
      stateSink.add(ValidationErrorsState(errors: errors));
    }
  }
}
