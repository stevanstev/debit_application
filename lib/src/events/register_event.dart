import 'package:equatable/equatable.dart';

abstract class RegisterEvent extends Equatable {}

class SetDefaultEvent extends RegisterEvent {
  final String gender;
  final String status;
  final bool toggle;
  final String phoneNumber;

  SetDefaultEvent({this.gender, this.status, this.toggle, this.phoneNumber});

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class ValidationErrorEvent extends RegisterEvent {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}
