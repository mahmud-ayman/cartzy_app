import 'package:cartzy_app/core/network/network.dart';
import 'package:cartzy_app/feature/home/data/model/response/product_response_dto.dart';
import 'package:cartzy_app/feature/home/data/model/response/category_response_dto.dart';
import 'package:cartzy_app/feature/home/domain/entities/category_entities.dart';
import 'package:cartzy_app/feature/home/domain/entities/product_entities.dart';
import 'package:cartzy_app/feature/home/domain/repo/data_source/home_data_source_contract.dart';
import 'package:cartzy_app/feature/home/data/repo/data_source/home_data_source_impl.dart';
import 'package:cartzy_app/feature/home/domain/repo/repository/home_repository_contract.dart';

class HomeRepositoryImpl implements HomeRepositoryContract {
  final HomeDataSourceContract _dataSource;
  const HomeRepositoryImpl(this._dataSource);

  @override
  Future<NetworkResult<List<CategoryEntities>>> getCategory() =>
      _dataSource.getCategory();
  @override
  Future<NetworkResult<List<ProductEntities>>> getProduct() =>
      _dataSource.getProduct();
}

HomeRepositoryContract injectableHomeRepository() =>
    HomeRepositoryImpl(injectableHomeDataSource);
