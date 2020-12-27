import 'package:debit/src/events/qr_code_event.dart';
import 'package:debit/src/states/qr_code_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QrCodeBloc extends Bloc<QrCodeEvent, QrCodeState> {
  QrCodeBloc({String defaultDebitCard})
      : super(QrCodeDefaultState(debitCard: defaultDebitCard));

  @override
  Stream<QrCodeState> mapEventToState(QrCodeEvent event) async* {
    if (event is DebitCardSelectEvent) {
      yield* qrCodeChangeEvent(event);
    } else if (event is GenerateQrCodeEvent) {
      yield ShowLoadingState();
      yield* generateQrCodeEvent(event);
    }
  }

  Stream<QrCodeChangeState> qrCodeChangeEvent(
      DebitCardSelectEvent event) async* {
    yield QrCodeChangeState(debitCard: event.debitCard);
  }

  Stream<GenerateQrCodeState> generateQrCodeEvent(
      GenerateQrCodeEvent event) async* {
    yield GenerateQrCodeState(debitCard: event.debitCard);
  }
}
