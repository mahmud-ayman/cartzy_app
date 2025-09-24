import 'dart:convert';

import 'package:cartzy_app/core/network/network.dart';
import 'package:cartzy_app/feature/home/data/model/response/product_response_dto.dart';
import 'package:cartzy_app/feature/home/data/model/response/category_response_dto.dart';
import 'package:cartzy_app/feature/home/domain/entities/category_entities.dart';
import 'package:cartzy_app/feature/home/domain/entities/product_entities.dart';

abstract class HomeDataSourceContract {
  Future<NetworkResult<List<CategoryEntities>>> getCategory();
  Future<NetworkResult<List<ProductEntities>>> getProduct();
}
