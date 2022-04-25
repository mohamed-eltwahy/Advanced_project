import 'package:advanced_tips/data/response/home_respose.dart';
import 'package:advanced_tips/domain/model/home_model.dart';
import '../../app/extentions.dart';

extension ServiceResponseMapper on ServiceResponse {
  Service toDomain() {
    return Service(id.orZero(), title.orEmpty(), image.orEmpty());
  }
}

extension StoreResponseMapper on StoreResponse {
  Store toDomain() {
    return Store(id.orZero(), title.orEmpty(), image.orEmpty());
  }
}

extension BannerResponseMapper on BannersResponse {
  BannerAd toDomain() {
    return BannerAd(
        id.orZero(), title.orEmpty(), image.orEmpty(), link.orEmpty());
  }
}

extension HomeResponseMapper on HomeResponse? {
  HomeObject toDomain() {
    List<Service> services = (this
                ?.data
                ?.services
                ?.map((serviceResponse) => serviceResponse.toDomain()) ??
            const Iterable.empty())
        .cast<Service>()
        .toList();

    List<BannerAd> banners = (this
                ?.data
                ?.banners
                ?.map((bannerResponse) => bannerResponse.toDomain()) ??
            const Iterable.empty())
        .cast<BannerAd>()
        .toList();
        
    List<Store> stores = (this
                ?.data
                ?.stores
                ?.map((bannerResponse) => bannerResponse.toDomain()) ??
            const Iterable.empty())
        .cast<Store>()
        .toList();

    var data = HomeData(services, banners, stores);
    return HomeObject(data);
  }
}
