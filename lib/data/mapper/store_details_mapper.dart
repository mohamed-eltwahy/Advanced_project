import 'package:advanced_tips/app/extentions.dart';

import '../../domain/model/store_details_model.dart';
import '../response/store_details_response.dart';

extension StoreDetailsResponseMapper on StoreDetailsResponse? {
  StoreDetails toDomain() {
    return StoreDetails(
        this?.id?.orZero() ?? 0,
        this?.title?.orEmpty() ??"",
        this?.image?.orEmpty() ??"",
        this?.details?.orEmpty() ??"",
        this?.services?.orEmpty() ??"",
        this?.about?.orEmpty() ??"");
  }
}