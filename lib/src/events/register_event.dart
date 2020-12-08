import 'package:equatable/equatable.dart';

abstract class RegisterEvent extends Equatable {}

class SetCheckboxToggleEvent extends RegisterEvent {
  final bool toggle;

  SetCheckboxToggleEvent(this.toggle);

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}
