import 'dart:async';

abstract class BaseBloc<Event, State> {
  BaseBloc() {
    _eventController.stream.listen(mapEventToState);
  }

  StreamController<Event> _eventController = StreamController<Event>();
  StreamSink<Event> get eventSink => _eventController.sink;

  StreamController<State> _stateController = StreamController<State>();
  Stream<State> get stateStream => _stateController.stream;
  StreamSink<State> get stateSink => _stateController.sink;

  void mapEventToState(Event e);

  void dispose() {
    _eventController.close();
    _stateController.close();
  }
}
