class SliderObject {
  String title;
  String subTitle;
  String image;

  SliderObject(this.title, this.subTitle, this.image);
}

class SliderViewObject {
  SliderObject sliderObject;
  int numsOfSlides;
  int currentIndex;
  SliderViewObject({
    required this.sliderObject,
    required this.numsOfSlides,
    required this.currentIndex,
  });

}