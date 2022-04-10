import 'dart:async';
import 'dart:developer';

import 'package:advanced_tips/presentation/resources/baseviewmodel.dart';

import '../../../../../domain/usecase/login_usecase.dart';
import '../../../../common/freezed_data_clases.dart';

class LoginViewModel extends BaseViewModel
    with LoginViewModelInputs, LoginViewModelOutputs {
  final StreamController _userNameStreamController =
      StreamController<String>.broadcast();
  final StreamController _passwordStreamController =
      StreamController<String>.broadcast();

  final StreamController _areAllInputsValid =
      StreamController<void>.broadcast();

  var loginObject = LoginObject("", "");
  final LoginUseCase _loginUseCase;
  LoginViewModel(this._loginUseCase);

  @override
  void dispose() {
    _userNameStreamController.close();
    _passwordStreamController.close();
    _areAllInputsValid.close();
  }

  @override
  void start() {
    // TODO: implement start
  }

  @override
  Sink get inputPassword => _passwordStreamController.sink;

  @override
  Sink get inputUserName => _userNameStreamController.sink;

  @override
  Stream<bool> get isPasswordValid => _passwordStreamController.stream
      .map((password) => _isPasswordValid(password));

  @override
  Stream<bool> get isUserNameValid => _userNameStreamController.stream
      .map((username) => _isUserNameValid(username));

  bool _isPasswordValid(String password) {
    return password.isEmpty;
  }

  bool _isUserNameValid(String username) {
    return username.isEmpty;
  }

  bool _areAllInputsValidMethod() {
    return _isPasswordValid(loginObject.Password) &&
        _isUserNameValid(loginObject.userName);
  }

  @override
  login() async {
    (await _loginUseCase.execute(
            LoginUseCaseInput(loginObject.userName, loginObject.Password)))
        .fold((l) => {log(l.message)}, (r) => {log(r.customer!.name)});
  }

  @override
  setPassword(String password) {
    inputPassword.add(password);
    loginObject = loginObject.copyWith(Password: password);
    inputAreaAllDataValid.add(null);
  }

  @override
  setUserName(String username) {
    inputUserName.add(username);
    loginObject = loginObject.copyWith(userName: username);
    inputAreaAllDataValid.add(null);
  }

  @override
  Sink get inputAreaAllDataValid => _areAllInputsValid.sink;

  @override
  Stream<bool> get outAreaAllDataValid =>
      _areAllInputsValid.stream.map((_) => _areAllInputsValidMethod());
}

abstract class LoginViewModelInputs {
  setUserName(String username);
  setPassword(String password);
  login();

  Sink get inputUserName;
  Sink get inputPassword;
  Sink get inputAreaAllDataValid;
}

abstract class LoginViewModelOutputs {
  Stream<bool> get isUserNameValid;
  Stream<bool> get isPasswordValid;
  Stream<bool> get outAreaAllDataValid;
}
