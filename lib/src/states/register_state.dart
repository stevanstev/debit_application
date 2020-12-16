import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

abstract class RegisterState extends Equatable {}

class GetCheckboxToggleState extends RegisterState {
  final bool toggle;

  GetCheckboxToggleState(this.toggle);

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class GetDefaultState extends RegisterState {
  final String gender;
  final String status;
  final bool toggle;
  final String phoneNumber;

  GetDefaultState({this.gender, this.status, this.toggle, this.phoneNumber});

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class ValidationErrorState extends RegisterState {
  final Map<String, dynamic> errors;
  final GetDefaultState latestData;

  ValidationErrorState({this.errors, this.latestData});

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}
