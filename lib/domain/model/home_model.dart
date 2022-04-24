class Service {
  String id;
  String title;
  String image;

  Service(this.id, this.title, this.image);
}

class Store {
  String id;
  String title;
  String image;

  Store(this.id, this.title, this.image);
}

class BannerAd {
  String id;
  String title;
  String image;
  String link;

  BannerAd(this.id, this.title, this.image, this.link);
}

class HomeData {
  List<Service> services;
  List<BannerAd> banners;
  List<Store> stores;

  HomeData(this.services, this.banners, this.stores);
}

class HomeObject {
  HomeData? data;

  HomeObject(this.data);
}
