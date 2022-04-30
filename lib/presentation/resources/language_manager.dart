import 'package:flutter/cupertino.dart';

enum LanguageType { ENGLISH, ARABIC }
const String arabic = "ar";
const String english = "en";

const Locale arabic_locale =Locale("ar","SA") ;
const Locale english_locale =Locale("en","US") ;

const String assets_path_localization = "assets/translations";




extension LanguageTypeExtension on LanguageType {
  String getValue() {
    switch (this) {
      case LanguageType.ENGLISH:
        return english;
      case LanguageType.ARABIC:
        return arabic;
    }
  }
}
