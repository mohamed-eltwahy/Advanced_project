import 'package:advanced_tips/data/network/error_handler.dart';
import 'package:advanced_tips/data/response/home_respose.dart';

import '../response/store_details_response.dart';

const CACHE_HOME_KEY = "CACHE_HOME_KEY";
const CACHE_HOME_INTERVAL = 60 * 1000; // 1 minute cache in millis
const CACHE_STORE_DETAILS_KEY = "CACHE_STORE_DETAILS_KEY";
const CACHE_STORE_DETAILS_INTERVAL = 60 * 1000; // 30s in millis

abstract class LocalDataSource {
  Future<HomeResponse> getDataHome();
  Future<void> saveHomeToCache(HomeResponse homeResponse);

  void clearCache();
  void removeFromCache(String key);

  Future<StoreDetailsResponse> getStoreDetails();

  Future<void> saveStoreDetailsToCache(StoreDetailsResponse response);
}

class LocalDataSourceImpl implements LocalDataSource {
  Map<String, CachedItem> cachemap = Map();

  @override
  Future<HomeResponse> getDataHome() async {
    CachedItem? cachedItem = cachemap[CACHE_HOME_KEY];
    if (cachedItem != null && cachedItem.isValid(CACHE_HOME_INTERVAL)) {
      return cachedItem.data;
    } else {
      throw ErrorHandler.handle(DataSource.CASHE_ERROR);
    }
  }

  @override
  Future<void> saveHomeToCache(HomeResponse homeResponse) async {
    cachemap[CACHE_HOME_KEY] = CachedItem(homeResponse);
  }

  @override
  Future<StoreDetailsResponse> getStoreDetails() async {
    CachedItem? cachedItem = cachemap[CACHE_STORE_DETAILS_KEY];

    if (cachedItem != null &&
        cachedItem.isValid(CACHE_STORE_DETAILS_INTERVAL)) {
      return cachedItem.data;
    } else {
      throw ErrorHandler.handle(DataSource.CASHE_ERROR);
    }
  }

  @override
  Future<void> saveStoreDetailsToCache(StoreDetailsResponse response) async {
    cachemap[CACHE_STORE_DETAILS_KEY] = CachedItem(response);
  }

  @override
  void clearCache() {
    cachemap.clear();
  }

  @override
  void removeFromCache(String key) {
    cachemap.remove(key);
  }
}

class CachedItem {
  dynamic data;
  int cacheTime = DateTime.now().millisecondsSinceEpoch;

  CachedItem(this.data);
}

extension CachedItemExtension on CachedItem {
  bool isValid(int expairationTimeInMilliSecond) {
    int currentTimeInMellis = DateTime.now().millisecondsSinceEpoch;

    bool isValid =
        currentTimeInMellis - cacheTime <= expairationTimeInMilliSecond;
    // expirationTimeInMillis -> 60 sec
    // currentTimeInMillis -> 1:00:00
    // cacheTime -> 12:59:30
    // valid -> till 1:00:30

    return isValid;
  }
}
