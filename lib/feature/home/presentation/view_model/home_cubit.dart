import 'package:bloc/bloc.dart';
import 'package:cartzy_app/core/network/network.dart';
import 'package:cartzy_app/feature/home/data/model/response/product_response_dto.dart';
import 'package:cartzy_app/feature/home/data/model/response/category_response_dto.dart';
import 'package:cartzy_app/feature/home/domain/entities/category_entities.dart';
import 'package:cartzy_app/feature/home/domain/entities/product_entities.dart';
import 'package:cartzy_app/feature/home/domain/repo/repository/home_repository_contract.dart';
import 'package:cartzy_app/feature/home/domain/use_case/get_category_use_case.dart';
import 'package:cartzy_app/feature/home/domain/use_case/get_product_use_case.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._getProductUseCase, this._getCategoryUseCase)
      : super(HomeInitial());

  final GetCategoryUseCase _getCategoryUseCase;
  final GetProductUseCase _getProductUseCase;
  List<CategoryEntities> listOfCategory = [];
  List<ProductEntities> listOfProduct = [];

  Future<void> getCategory() async {
    emit(GetCategoryLoading());
    final result = await _getCategoryUseCase.call();
    switch (result) {
      case NetworkSuccess<List<CategoryEntities>>():
        listOfCategory = result.data;
        emit(GetCatergorySuccess());
      case NetworkError<List<CategoryEntities>>():
        emit(GetCategoryfailure());
    }
  }

  Future<void> getProduct() async {
    emit(GetProductLoading());
    final resulte = await _getProductUseCase.call();
    switch (resulte) {
      case NetworkSuccess<List<ProductEntities>>():
        emit(GetProductSuccess());
        listOfProduct = resulte.data;

      case NetworkError<List<ProductEntities>>():
        emit(GetProductfailure());
    }
  }
}
