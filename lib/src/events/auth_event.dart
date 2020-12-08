import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {}

class GetAuthTokenEvent extends AuthEvent {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class RemoveAuthTokenEvent extends AuthEvent {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}
