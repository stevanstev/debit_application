import 'package:equatable/equatable.dart';

abstract class QrCodeState extends Equatable {}

class QrCodeDefaultState extends QrCodeState {
  final String debitCard;

  QrCodeDefaultState({this.debitCard});

  @override
  // TODO: implement props
  List<Object> get props => [this.debitCard];
}

class QrCodeChangeState extends QrCodeState {
  final String debitCard;

  QrCodeChangeState({this.debitCard});

  @override
  // TODO: implement props
  List<Object> get props => [this.debitCard];
}

class ShowLoadingState extends QrCodeState {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class GenerateQrCodeState extends QrCodeState {
  final String debitCard;

  GenerateQrCodeState({this.debitCard});

  @override
  // TODO: implement props
  List<Object> get props => [this.debitCard];
}
