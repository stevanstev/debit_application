import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {}

class GetAuthTokenState extends AuthState {
  final String token;

  GetAuthTokenState(this.token);

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class RemoveAuthTokenState extends AuthState {
  final bool status;

  RemoveAuthTokenState(this.status);

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}
