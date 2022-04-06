import 'dart:async';
import '../../../../domain/model/onboarding_model.dart';
import '../../../resources/assets.dart';
import '../../../resources/strings.dart';
import '../../../resources/baseviewmodel.dart';

class OnBoardingViewModel extends BaseViewModel
    with OnBoardingViewModelInputs, OnBoardingViewModelOutputs {
  final StreamController _streamController =
      StreamController<SliderViewObject>();
  late final List<SliderObject> _list;
  int _currentIndex = 0;

  List<SliderObject> _getSliderData() => [
        SliderObject(AppStrings.onBoarding1, AppStrings.onBoardingsubTitle1,
            AssetsManaget.onboarding1),
        SliderObject(AppStrings.onBoarding2, AppStrings.onBoardingsubTitl2,
            AssetsManaget.onboarding2),
        SliderObject(AppStrings.onBoarding3, AppStrings.onBoardingsubTitle3,
            AssetsManaget.onboarding3),
        SliderObject(AppStrings.onBoarding4, AppStrings.onBoardingsubTitle4,
            AssetsManaget.onboarding4),
      ];

  @override
  void dispose() {
    _streamController.close();
  }

  @override
  void start() {
    _list = _getSliderData();
    _postDataToView();
  }

  @override
  int goNext() {
       int nextIndex = ++_currentIndex;
    if (nextIndex == _list.length) {
      nextIndex = 0;
    }
    return nextIndex;
  }

  @override
  int goPrevious() {
    int previousIndex = --_currentIndex;
    if (previousIndex == -1) {
      previousIndex = _list.length - 1;
    }
    return previousIndex;
  }

  @override
  void onPageChanged(int index) {
    _currentIndex = index;
    _postDataToView();
  }

  @override
  Sink get inputSliderViewObject => _streamController.sink;

  @override
  Stream<SliderViewObject> get outputSiderViewObject =>
      _streamController.stream.map((sliderViewObject) => sliderViewObject);

  void _postDataToView() {
    inputSliderViewObject.add(SliderViewObject(
        currentIndex: _currentIndex,
        numsOfSlides: _list.length,
        sliderObject: _list[_currentIndex]));
  }
}

abstract class OnBoardingViewModelInputs {
  int goNext();
  int goPrevious();
  void onPageChanged(int index);
//Stream controller input
  Sink get inputSliderViewObject;
}

abstract class OnBoardingViewModelOutputs {
  Stream<SliderViewObject> get outputSiderViewObject;
}
