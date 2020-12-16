import 'package:debit/src/blocs/base_bloc.dart';
import 'package:debit/src/events/register_event.dart';
import 'package:debit/src/states/register_state.dart';

class RegisterBloc extends BaseBloc<RegisterEvent, RegisterState> {
  @override
  void mapEventToState(e) {
    if (e is SetDefaultEvent) {
      _setDefaultEvent(e);
    } else if (e is ValidationErrorEvent) {
      _validationErrorEvent(e);
    }
  }

  _validationErrorEvent(ValidationErrorEvent e) {
    ValidationErrorState state = ValidationErrorState();
    stateSink.add(state);
  }

  _setDefaultEvent(SetDefaultEvent e) {
    GetDefaultState state = GetDefaultState(
        gender: e.gender,
        status: e.status,
        toggle: e.toggle,
        phoneNumber: e.phoneNumber);
    stateSink.add(state);
  }
}
