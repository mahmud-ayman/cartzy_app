import 'dart:math';

import 'package:cartzy_app/core/network/network.dart';
import 'package:cartzy_app/feature/home/data/api/home_api.dart';
import 'package:cartzy_app/feature/home/data/model/response/product_response_dto.dart';
import 'package:cartzy_app/feature/home/data/model/response/category_response_dto.dart';
import 'package:cartzy_app/feature/home/domain/entities/category_entities.dart';
import 'package:cartzy_app/feature/home/domain/entities/product_entities.dart';
import 'package:cartzy_app/feature/home/domain/repo/data_source/home_data_source_contract.dart';
import 'package:flutter/material.dart';

class HomeDataSourceImpl implements HomeDataSourceContract {
  HomeDataSourceImpl(this._api);

  final HomeApi _api;

  @override
  Future<NetworkResult<List<CategoryEntities>>> getCategory() async {
    final result = await _api.getCategory();

    switch (result) {
      case NetworkSuccess<List<categoryResponseDto>>():
        return NetworkSuccess<List<CategoryEntities>>(
            result.data.map((element) => element.toEntity()).toList());

      case NetworkError<List<categoryResponseDto>>():
        return NetworkError(result.message);
    }
  }

  @override
  Future<NetworkResult<List<ProductEntities>>> getProduct() async {
    final result = await _api.getProduct();

    switch (result) {
      case NetworkSuccess<List<productResponseDto>>():
        return NetworkSuccess<List<ProductEntities>>(
            result.data.map((element) => element.toEntities()).toList());
      case NetworkError<List<productResponseDto>>():
        return NetworkError<List<ProductEntities>>(result.message);
    }
  }
}

HomeDataSourceContract injectableHomeDataSource =
    HomeDataSourceImpl(HomeApi.instance);
