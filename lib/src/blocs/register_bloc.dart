import 'package:debit/src/blocs/base_bloc.dart';
import 'package:debit/src/events/register_event.dart';
import 'package:debit/src/states/register_state.dart';

class RegisterBloc extends BaseBloc<RegisterEvent, RegisterState> {
  @override
  void mapEventToState(e) {
    if (e is SetCheckboxToggleEvent) {
      GetCheckboxToggleState toggle = GetCheckboxToggleState(e.toggle);
      stateSink.add(toggle);
    }
  }
}
