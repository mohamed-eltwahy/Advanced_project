import 'dart:async';

import 'package:rxdart/rxdart.dart';

import '../common/state_renderer/state_renderer_impl.dart';

abstract class BaseViewModel extends BaseViewModelInputs
    with BaseviewModelOutput {
  final StreamController _inputStreamController =
      BehaviorSubject<FlowState>();

  @override
  Sink get inputState => _inputStreamController.sink;

  @override
  Stream<FlowState> get outputState =>
      _inputStreamController.stream.map<FlowState>((event) => event);

  @override
  void dispose() {
    _inputStreamController.close();
  }
}

abstract class BaseViewModelInputs {
  void start();

  void dispose();

  Sink get inputState;
}

abstract class BaseviewModelOutput {
  Stream<FlowState> get outputState;
}
