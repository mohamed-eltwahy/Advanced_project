
import 'package:advanced_tips/domain/model/onboarding_model.dart';

import '../../../resources/assets.dart';
import '../../../resources/colors.dart';
import '../../../resources/strings.dart';
import '../../../resources/values.dart';
import '../../../routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../view_model/onboarding_viewmodel.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final PageController _pageController = PageController();

  final OnBoardingViewModel _onBoardingViewModel = OnBoardingViewModel();

  _bind() {
    _onBoardingViewModel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SliderViewObject>(
      stream: _onBoardingViewModel.outputSiderViewObject,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return _getContentWidget(snapshot.data);
      },
    );
  }

  Widget _getContentWidget(SliderViewObject sliderViewObject) {
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
              _onBoardingViewModel.onPageChanged(index);
            },
            itemBuilder: (context, index) {
              return OnBoardingPage( sliderViewObject.sliderObject);
              // return onboarding page
            }),
        bottomSheet: Container(
          color: ColorManager.primary,
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

  Widget _getBottomSheetWidget(SliderViewObject sliderViewObject ) {
    return Row(
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
              _pageController.animateToPage(_onBoardingViewModel.goPrevious(),
                  duration: const Duration(milliseconds: 300),
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
                child: _getProperCircle(i,sliderViewObject.currentIndex),
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
                _pageController.animateToPage(_onBoardingViewModel.goNext(),
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.bounceInOut);
              }),
        ),
      ],
    );
  }

  Widget _getProperCircle(int index,int currentindex) {
    if (index == currentindex) {
      return SvgPicture.asset(AssetsManaget.hollowCircleIc);
    } else {
      return SvgPicture.asset(AssetsManaget.solidCircleIc);
    }
  }

  @override
  void dispose() {
    _onBoardingViewModel.dispose();
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
