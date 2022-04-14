import 'package:json_annotation/json_annotation.dart';

import 'package:advanced_tips/data/response/responses.dart';
part 'forget_pass_response.g.dart';

@JsonSerializable()
class ForgetResponse extends BaseResponse {
  @JsonKey(name: "support")
  String? support;
  ForgetResponse(
    this.support,
  );
  factory ForgetResponse.fromJson(Map<String, dynamic> json) =>
      _$ForgetResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ForgetResponseToJson(this);
}
