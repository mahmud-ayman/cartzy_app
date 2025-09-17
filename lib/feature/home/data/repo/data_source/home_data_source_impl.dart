import 'package:cartzy_app/core/network/network.dart';
import 'package:cartzy_app/feature/home/data/api/home_api.dart';
import 'package:cartzy_app/feature/home/data/model/response/category_response_dto.dart';
import 'package:cartzy_app/feature/home/data/repo/data_source/home_data_source_contract.dart';

class HomeDataSourceImpl implements HomeDataSourceContract {
  HomeDataSourceImpl(this._api);

  final HomeApi _api;
  @override
  Future<NetworkResult<List<categoryResponseDto>>> getCategory() =>
      _api.getCategory();
}

HomeDataSourceContract injectableHomeDataSource =
    HomeDataSourceImpl(HomeApi.instance);
