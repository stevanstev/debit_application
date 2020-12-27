import 'package:debit/src/events/submission_event.dart';
import 'package:debit/src/states/submission_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubmissionBloc extends Bloc<SubmissionEvent, SubmissionState> {
  SubmissionBloc() : super(DefaultState());

  @override
  Stream<SubmissionState> mapEventToState(SubmissionEvent event) async* {}
}
