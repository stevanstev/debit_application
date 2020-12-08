import 'package:equatable/equatable.dart';

abstract class BottomNavEvent extends Equatable {}

class NavigateEvent extends BottomNavEvent {
  final int index;

  NavigateEvent(this.index);

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}
