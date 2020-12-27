import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc({Color color}) : super(ThemeDefaultState(color: color));

  @override
  Stream<ThemeState> mapEventToState(ThemeEvent event) async* {
    if (event is ChangeThemeEvent) {
      yield* changeThemeEvent(event);
    }
  }

  Stream<ChangeThemeState> changeThemeEvent(ChangeThemeEvent event) async* {
    yield ChangeThemeState(color: event.color);
  }
}

abstract class ThemeState extends Equatable {}

class ThemeDefaultState extends ThemeState {
  final Color color;

  ThemeDefaultState({this.color});

  @override
  // TODO: implement props
  List<Object> get props => [this.color];
}

class ChangeThemeState extends ThemeState {
  final Color color;

  ChangeThemeState({this.color});

  @override
  // TODO: implement props
  List<Object> get props => [this.color];
}

abstract class ThemeEvent extends Equatable {}

class ChangeThemeEvent extends ThemeEvent {
  final Color color;

  ChangeThemeEvent({this.color});

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}
