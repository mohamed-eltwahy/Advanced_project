import 'dart:async';

import 'package:advanced_tips/presentation/common/state_renderer/state_renderer_impl.dart';
import 'package:advanced_tips/presentation/resources/baseviewmodel.dart';

import '../../../../app/functions.dart';
import '../../../../domain/usecase/forget_pass_usecase.dart';
import '../../../common/state_renderer/state_renderer.dart';

class ForgotPasswordViewModel extends BaseViewModel
    with ForgotPasswordViewModelInput, ForgotPasswordViewModelOutput {
  final StreamController _emailStreamController =
      StreamController<String>.broadcast();

  final StreamController _isAllInputValidStreamController =
      StreamController<void>.broadcast();
  final ForgetPassUseCase _forgotPasswordUseCase;

  ForgotPasswordViewModel(this._forgotPasswordUseCase);

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
  forgotPassword() async {
    inputState.add(
        LoadingState(stateRendererType: StateRendererType.popupLoadingState));
    (await _forgotPasswordUseCase.execute(email)).fold(
        (l) => {
              inputState
                  .add(ErrorState(StateRendererType.popupErrorState, l.message))
            },
        (r) => {inputState.add(SuccessState(r))});
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
