import 'package:equatable/equatable.dart';

abstract class AppUsageEvent extends Equatable {}

class SetImagesIndex extends AppUsageEvent {
  final int currentIndex;

  SetImagesIndex({this.currentIndex});

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}
