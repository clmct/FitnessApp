import 'dart:async';

// unused
class LoginPageBloc {
  String _nickName = "";
  String _password = "";
  bool _isValid = false;

  final _inputEventController = StreamController<Action>();
  StreamSink<Action> get inputEventSink => _inputEventController.sink;

  final _outputStateController = StreamController<bool>();
  Stream<Action> get outputStateStream => _inputEventController.stream;

  void _mapEventToState(Action action) {
    switch (action) {
      case Action.event_login:
        break;
      default:
    }

    _outputStateController.sink.add(_isValid);
  }
}

enum Action { event_login }
