import 'package:freezed_annotation/freezed_annotation.dart';
    part 'freezed_data_clases.freezed.dart';
@freezed
class LoginObject with _$LoginObject {
  factory LoginObject(String userName, String Password) = _LoginObject;
}
