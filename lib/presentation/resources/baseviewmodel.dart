abstract class BaseViewModel extends BaseViewModelInputs
    with BaseviewModelOutput {
      
    }

abstract class BaseViewModelInputs {
  void start();

  void dispose();
}

abstract class BaseviewModelOutput {}
