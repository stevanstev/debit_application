import 'package:equatable/equatable.dart';

abstract class RegisterEvent extends Equatable {}

class SetDefaultEvent extends RegisterEvent {
  final String gender;
  final String status;
  final bool toggle;

  SetDefaultEvent({this.gender, this.status, this.toggle});

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}
