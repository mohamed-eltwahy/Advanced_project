import 'dart:async';
import 'dart:ffi';

import 'package:advanced_tips/domain/model/home_model.dart';
import 'package:advanced_tips/domain/usecase/home_usecase.dart';
import 'package:advanced_tips/presentation/resources/baseviewmodel.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../common/state_renderer/state_renderer.dart';
import '../../../../common/state_renderer/state_renderer_impl.dart';

class HomeViewModel extends BaseViewModel
    with HomeViewModelInput, HomeViewModelOutput {
  final HomeUseCase _homeUseCase;
  HomeViewModel(this._homeUseCase);
  final _dataStreamController = BehaviorSubject<HomeViewObject>();

  @override
  void start() {
    _getHomeData();
  }

  _getHomeData() async {
    inputState.add(LoadingState(
        stateRendererType: StateRendererType.fullScreenLoadingState));
    (await _homeUseCase.execute(Void)).fold(
        (failure) => {
              // left -> failure
              inputState.add(ErrorState(
                  StateRendererType.fullScreenErrorState, failure.message))
            }, (homeObject) {
      // right -> data (success)
      // content
      inputState.add(ContentState());
      inputHomeData.add(HomeViewObject(homeObject.data.stores,
          homeObject.data.services, homeObject.data.banners));
      // navigate to main screen
    });
  }

  @override
  void dispose() {
    _dataStreamController.close();

    super.dispose();
  }

  @override
  Sink get inputHomeData => _dataStreamController.sink;

  @override
  Stream<HomeViewObject> get outputHomeData =>
      _dataStreamController.stream.map((data) => data);
}

abstract class HomeViewModelInput {
  Sink get inputHomeData;
}

abstract class HomeViewModelOutput {
  Stream<HomeViewObject> get outputHomeData;
}

class HomeViewObject {
  List<Store> stores;
  List<Service> services;
  List<BannerAd> banners;

  HomeViewObject(this.stores, this.services, this.banners);
}
