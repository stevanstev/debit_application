import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {}

class SuccessLoginState extends LoginState {
  final String token;

  SuccessLoginState({this.token});

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class ValidationErrorsState extends LoginState {
  final Map<String, dynamic> errors;

  ValidationErrorsState({this.errors});

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class LoadingProgressState extends LoginState {
  LoadingProgressState();

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}
