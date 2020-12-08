import 'package:equatable/equatable.dart';

abstract class RegisterState extends Equatable {}

class GetCheckboxToggleState extends RegisterState {
  final bool toggle;

  GetCheckboxToggleState(this.toggle);

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}
