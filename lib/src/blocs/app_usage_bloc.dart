import 'package:debit/src/blocs/base_bloc.dart';
import 'package:debit/src/events/app_usage_event.dart';
import 'package:debit/src/states/app_usage_state.dart';

class AppUsageBloc extends BaseBloc<AppUsageEvent, AppUsageState> {
  List<String> images = [
    'usage1.png',
    'usage2.png',
    'usage3.png',
    'usage4.png'
  ];

  @override
  void mapEventToState(AppUsageEvent e) {
    if (e is SetImagesIndexEvent) {
      GetImagesIndexState index =
          GetImagesIndexState(currentIndex: e.currentIndex);
      stateSink.add(index);
    }
  }
}
