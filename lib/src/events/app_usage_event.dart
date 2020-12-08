import 'package:equatable/equatable.dart';

abstract class AppUsageEvent extends Equatable {}

class SetImagesIndexEvent extends AppUsageEvent {
  final int currentIndex;

  SetImagesIndexEvent({this.currentIndex});

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}
