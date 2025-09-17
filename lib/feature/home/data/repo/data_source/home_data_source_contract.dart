import 'dart:convert';

import 'package:cartzy_app/core/network/network.dart';
import 'package:cartzy_app/feature/home/data/model/response/category_response_dto.dart';
import 'package:http/http.dart' as http;

abstract class HomeDataSourceContract {
  Future<NetworkResult<List<categoryResponseDto>>> getCategory();
}
