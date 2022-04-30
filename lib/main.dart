import 'package:advanced_tips/presentation/resources/language_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

import 'app/di.dart';

import 'app/app.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await initAppModule();
  runApp(EasyLocalization(
      child: Phoenix(child: MyApp()),
      supportedLocales: const [arabic_locale, english_locale],
      path: assets_path_localization));
}
