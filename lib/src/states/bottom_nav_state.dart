import 'package:equatable/equatable.dart';

abstract class BottomNavState extends Equatable {}

class NavigateState extends BottomNavState {
  final int index;

  NavigateState(this.index);

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}
