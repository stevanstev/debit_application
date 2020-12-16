import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {}

class SubmitLoginEvent extends LoginEvent {
  final String phoneNumber, password;

  SubmitLoginEvent({this.phoneNumber, this.password});

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class SendLoginEvent extends LoginEvent {
  final String phoneNumber, password;

  SendLoginEvent({this.phoneNumber, this.password});

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class SendRequestToServerEvent extends LoginEvent {
  final String phoneNumber, password;

  SendRequestToServerEvent({this.phoneNumber, this.password});

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}
