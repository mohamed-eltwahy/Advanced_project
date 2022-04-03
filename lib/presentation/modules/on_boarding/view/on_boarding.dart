import '../../../routes.dart';
import '../../../shared/resources/assets.dart';
import '../../../shared/resources/colors.dart';
import '../../../shared/resources/strings.dart';
import '../../../shared/resources/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  late final List<SliderObject> _list = _getSliderData();
  final PageController _pageController = PageController();
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
  Widget build(BuildContext context) {
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
          itemCount: _list.length,
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          itemBuilder: (context, index) {
            return OnBoardingPage(_list[index]);
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
            _getBottomSheetWidget()
          ],
        ),
      ),
    );
  }

  Widget _getBottomSheetWidget() {
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
              _pageController.animateToPage(_getPreviousIndex(),
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
            for (int i = 0; i < _list.length; i++)
              Padding(
                padding: const EdgeInsets.all(AppPadding.p8),
                child: _getProperCircle(i),
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
                _pageController.animateToPage(_getNextIndex(),
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.bounceInOut);
              }),
        ),
      ],
    );
  }

  int _getPreviousIndex() {
    int previousIndex = --_currentIndex;
    if (previousIndex == -1) {
      previousIndex = _list.length - 1;
    }
    return previousIndex;
  }

  int _getNextIndex() {
    int nextIndex = ++_currentIndex;
    if (nextIndex == _list.length) {
      nextIndex = 0;
    }
    return nextIndex;
  }

  Widget _getProperCircle(int index) {
    if (index == _currentIndex) {
      return SvgPicture.asset(AssetsManaget.hollowCircleIc);
    } else {
      return SvgPicture.asset(AssetsManaget.solidCircleIc);
    }
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

class SliderObject {
  String title;
  String subTitle;
  String image;

  SliderObject(this.title, this.subTitle, this.image);
}
