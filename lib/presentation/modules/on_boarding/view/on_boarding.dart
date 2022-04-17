
import 'package:advanced_tips/presentation/modules/on_boarding/view_model/onboarding_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../app/app_prefs.dart';
import '../../../../app/di.dart';
import '../../../../domain/model/onboarding_model.dart';
import '../../../resources/assets.dart';
import '../../../resources/colors.dart';
import '../../../resources/strings.dart';
import '../../../resources/values.dart';
import '../../../routes.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  _OnBoardingViewState createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController _pageController = PageController();
  final OnBoardingViewModel _viewModel = OnBoardingViewModel();
    final AppPreferences _appPreferences = instance<AppPreferences>();


  _bind() {
        _appPreferences.setOnBoardingScreenViewed();

    _viewModel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SliderViewObject>(
        stream: _viewModel.outputSiderViewObject,
        builder: (context, snapshot) {
          return _getContentWidget(snapshot.data);
        });
  }

  Widget _getContentWidget(SliderViewObject? sliderViewObject) {
    if (sliderViewObject == null) {
      return Container();
    } else {
      return Scaffold(
        backgroundColor: ColorManager.white,
        appBar: AppBar(
          backgroundColor: ColorManager.white,
          elevation: AppValuesSize.s0,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: ColorManager.white,
              statusBarBrightness: Brightness.dark),
        ),
        body: PageView.builder(
            controller: _pageController,
            itemCount: sliderViewObject.numsOfSlides,
            onPageChanged: (index) {
              _viewModel.onPageChanged(index);
            },
            itemBuilder: (context, index) {
              return OnBoardingPage(sliderViewObject.sliderObject);
            }),
        bottomSheet: Container(
          color: ColorManager.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, Routes.loginRoute);
                  },
                  child: Text(
                    AppStrings.skip,
                    style: Theme.of(context).textTheme.titleMedium,
                    textAlign: TextAlign.end,
                  ),
                ),
              ),

              // widgets indicator and arrows
              _getBottomSheetWidget(sliderViewObject)
            ],
          ),
        ),
      );
    }
  }

  Widget _getBottomSheetWidget(SliderViewObject sliderViewObject) {
    return Container(
      color: ColorManager.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // left arrow
          Padding(
            padding: const EdgeInsets.all(AppPadding.p14),
            child: GestureDetector(
              child: SizedBox(
                width: AppValuesSize.s20,
                height: AppValuesSize.s20,
                child: SvgPicture.asset(AssetsManaget.leftArrowIc),
              ),
              onTap: () {
                // go to previous slide
                _pageController.animateToPage(_viewModel.goPrevious(),
                    duration: const Duration(
                        milliseconds:5000),
                    curve: Curves.bounceInOut);
              },
            ),
          )

// circle indicator

          // right arrow
          ,
          Row(
            children: [
              for (int i = 0; i < sliderViewObject.numsOfSlides; i++)
                Padding(
                  padding: const EdgeInsets.all(AppPadding.p8),
                  child: _getProperCircle(i, sliderViewObject.currentIndex),
                )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(AppPadding.p14),
            child: GestureDetector(
                child: SizedBox(
                  width: AppValuesSize.s20,
                  height: AppValuesSize.s20,
                  child: SvgPicture.asset(AssetsManaget.rightArrowIc),
                ),
                onTap: () {
                  // go to previous slide
                  _pageController.animateToPage(_viewModel.goNext(),
                      duration: const Duration(
                          milliseconds:2000),
                      curve: Curves.bounceInOut);
                }),
          )
        ],
      ),
    );
  }

  Widget _getProperCircle(int index, int currentIndex) {
    if (index == currentIndex) {
      return SvgPicture.asset(AssetsManaget.hollowCircleIc);
    } else {
      return SvgPicture.asset(AssetsManaget.solidCircleIc);
    }
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}

class OnBoardingPage extends StatelessWidget {
  final SliderObject _sliderObject;

  const OnBoardingPage(this._sliderObject, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: AppValuesSize.s40),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            _sliderObject.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            _sliderObject.subTitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        const SizedBox(height: AppValuesSize.s60),
        SvgPicture.asset(_sliderObject.image)
      ],
    );
  }
}