import 'package:bloc/bloc.dart';
import 'package:cartzy_app/core/network/network.dart';
import 'package:cartzy_app/feature/home/data/model/product_response_dto.dart';
import 'package:cartzy_app/feature/home/data/model/response/category_response_dto.dart';
import 'package:cartzy_app/feature/home/data/repo/repository/home_repository_contract.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._repository) : super(HomeInitial());

  final HomeRepositoryContract _repository;
  List<categoryResponseDto> listOfCategory = [];
  List<productResponseDto> listOfProduct = [];

  Future<void> getCategory() async {
    emit(GetCategoryLoading());
    final result = await _repository.getCategory();
    switch (result) {
      case NetworkSuccess<List<categoryResponseDto>>():
        listOfCategory = result.data;
        emit(GetCatergorySuccess());
      case NetworkError<List<categoryResponseDto>>():
        emit(GetCategoryfailure());
    }
  }

  Future<void> getProduct() async {
    emit(GetProductLoading());
    final resulte = await _repository.getProduct();
    switch (resulte) {
      case NetworkSuccess<List<productResponseDto>>():
        emit(GetProductSuccess());
        listOfProduct = resulte.data;

      case NetworkError<List<productResponseDto>>():
        emit(GetProductfailure());
    }
  }
}
