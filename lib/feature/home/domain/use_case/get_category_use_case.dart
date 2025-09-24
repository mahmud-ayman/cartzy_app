import 'package:cartzy_app/core/network/network.dart';
import 'package:cartzy_app/feature/home/data/repo/repository/home_repository_impl.dart';
import 'package:cartzy_app/feature/home/domain/entities/category_entities.dart';
import 'package:cartzy_app/feature/home/domain/repo/repository/home_repository_contract.dart';

class GetCategoryUseCase {
  GetCategoryUseCase(this._repo);
  final HomeRepositoryContract _repo;
  Future<NetworkResult<List<CategoryEntities>>> call() => _repo.getCategory();
}

GetCategoryUseCase injectableGetCategoryUseCase() =>
    GetCategoryUseCase(injectableHomeRepository());
