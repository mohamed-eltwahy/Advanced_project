import 'dart:async';

import 'package:advanced_tips/presentation/common/state_renderer/state_renderer_impl.dart';
import 'package:advanced_tips/presentation/resources/baseviewmodel.dart';

import '../../../../app/functions.dart';

class ForgotPasswordViewModel extends BaseViewModel
    with ForgotPasswordViewModelInput, ForgotPasswordViewModelOutput {
  final StreamController _emailStreamController =
      StreamController<String>.broadcast();

  final StreamController _isAllInputValidStreamController =
      StreamController<void>.broadcast();

  var email;

  @override
  void dispose() {
    _emailStreamController.close();
    _isAllInputValidStreamController.close();

    super.dispose();
  }

  @override
  void start() {
    inputState.add(ContentState());
  }

  @override
  forgotPassword() {
    // inputState.add(data)
  }

  @override
  Sink get inputEmail => _emailStreamController.sink;

  @override
  Sink get inputIsAllInputValid => _isAllInputValidStreamController.sink;

  @override
  Stream<bool> get outputIsAllInputValid =>
      _isAllInputValidStreamController.stream
          .map((event) => _isAllInputValid());
  _isAllInputValid() {
    return isEmailValid(email);
  }

  _validate() {
    inputIsAllInputValid.add(null);
  }

  @override
  Stream<bool> get outputIsEmailValid =>
      _emailStreamController.stream.map((event) => isEmailValid(event));

  @override
  setEmail(String email) {
    inputEmail.add(email);
    this.email = email;
    _validate();
  }
}

abstract class ForgotPasswordViewModelInput {
  forgotPassword();

  setEmail(String email);

  Sink get inputEmail;

  Sink get inputIsAllInputValid;
}

abstract class ForgotPasswordViewModelOutput {
  Stream<bool> get outputIsEmailValid;

  Stream<bool> get outputIsAllInputValid;
}
