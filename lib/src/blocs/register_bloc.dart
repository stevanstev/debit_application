import 'package:debit/src/blocs/base_bloc.dart';
import 'package:debit/src/events/register_event.dart';
import 'package:debit/src/states/register_state.dart';

class RegisterBloc extends BaseBloc<RegisterEvent, RegisterState> {
  @override
  void mapEventToState(e) {
    if (e is SetDefaultEvent) {
      setDefaultEvent(e);
    }
  }

  setDefaultEvent(SetDefaultEvent e) {
    GetDefaultState state =
        GetDefaultState(gender: e.gender, status: e.status, toggle: e.toggle);
    stateSink.add(state);
  }
}
