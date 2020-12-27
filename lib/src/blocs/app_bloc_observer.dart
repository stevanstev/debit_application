import 'package:debit/src/ui/utils/logs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object event) {
    writeLog(message: '$event Called', logContext: 'App Bloc Observer');
    super.onEvent(bloc, event);
  }

  @override
  void onChange(Cubit cubit, Change change) {
    writeLog(message: 'Change $change', logContext: 'App Bloc Observer');
    super.onChange(cubit, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    writeLog(
        message: 'Transition $transition', logContext: 'App Bloc Observer');
    super.onTransition(bloc, transition);
  }

  @override
  void onError(Cubit cubit, Object error, StackTrace stackTrace) {
    writeLog(message: 'Error $error', logContext: 'App Bloc Observer');
    super.onError(cubit, error, stackTrace);
  }
}
