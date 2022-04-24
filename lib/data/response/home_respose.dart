import 'package:json_annotation/json_annotation.dart';

import 'package:advanced_tips/data/response/responses.dart';
 part 'home_respose.g.dart';
@JsonSerializable()
class ServiceResponse {
  @JsonKey(name: 'id')
  String? id;

  @JsonKey(name: 'title')
  String? title;

  @JsonKey(name: 'image')
  String? image;

  ServiceResponse(this.id, this.title, this.image);

  // toJson
  Map<String, dynamic> toJson() => _$ServiceResponseToJson(this);

//fromJson
  factory ServiceResponse.fromJson(Map<String, dynamic> json) =>
      _$ServiceResponseFromJson(json);
}

@JsonSerializable()
class BannersResponse {
  @JsonKey(name: 'id')
  String? id;

  @JsonKey(name: 'title')
  String? title;

  @JsonKey(name: 'image')
  String? image;

  @JsonKey(name: 'link')
  String? link;

  BannersResponse(this.id, this.title, this.image, this.link);

  // toJson
  Map<String, dynamic> toJson() => _$BannersResponseToJson(this);

//fromJson
  factory BannersResponse.fromJson(Map<String, dynamic> json) =>
      _$BannersResponseFromJson(json);
}

@JsonSerializable()
class StoreResponse {
  @JsonKey(name: 'id')
  String? id;

  @JsonKey(name: 'title')
  String? title;

  @JsonKey(name: 'image')
  String? image;

  StoreResponse(this.id, this.title, this.image);

  // toJson
  Map<String, dynamic> toJson() => _$StoreResponseToJson(this);

//fromJson
  factory StoreResponse.fromJson(Map<String, dynamic> json) =>
      _$StoreResponseFromJson(json);
}

@JsonSerializable()
class HomeDataResponse {
  @JsonKey(name: 'services')
  List<ServiceResponse>? services;

  @JsonKey(name: 'banners')
  List<BannersResponse>? banners;

  @JsonKey(name: 'stores')
  List<StoreResponse>? stores;

  HomeDataResponse(this.services, this.banners, this.stores);

  // toJson
  Map<String, dynamic> toJson() => _$HomeDataResponseToJson(this);

//fromJson
  factory HomeDataResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeDataResponseFromJson(json);
}

@JsonSerializable()
class HomeResponse extends BaseResponse {
  @JsonKey(name: 'data')
  HomeDataResponse? data;

  HomeResponse(this.data);

  // toJson
  Map<String, dynamic> toJson() => _$HomeResponseToJson(this);

//fromJson
  factory HomeResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeResponseFromJson(json);
}