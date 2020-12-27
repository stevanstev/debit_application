import 'package:equatable/equatable.dart';

abstract class QrCodeEvent extends Equatable {}

class DebitCardSelectEvent extends QrCodeEvent {
  final String debitCard;

  DebitCardSelectEvent({this.debitCard});

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class ShowLoadingEvent extends QrCodeEvent {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class GenerateQrCodeEvent extends QrCodeEvent {
  final String debitCard;

  GenerateQrCodeEvent({this.debitCard});

  @override
  // TODO: implement props
  List<Object> get props => [this.debitCard];
}
