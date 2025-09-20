import 'dart:convert';

import 'package:cartzy_app/core/network/network.dart';
import 'package:cartzy_app/feature/home/data/model/product_response_dto.dart';
import 'package:cartzy_app/feature/home/data/model/response/category_response_dto.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class HomeApi {
  HomeApi._();
  static HomeApi? _instance;
  static HomeApi get instance => _instance ??= HomeApi._();

  Future<NetworkResult<List<categoryResponseDto>>> getCategory() async {
    // https://api.escuelajs.co/api/v1/categories/
    try {
      Uri url = Uri.https("api.escuelajs.co", "/api/v1/categories/");
      var response = await http.get(url);
      var responseBody = response.body;
      List<dynamic> json = jsonDecode(responseBody);
      var data = json.map((e) => categoryResponseDto.fromJson(e)).toList();
      return NetworkSuccess(data);
    } catch (e) {
      return NetworkError(e.toString());
    }
  }

  Future<NetworkResult<List<productResponseDto>>> getProduct() async {
    try {
      //https://api.escuelajs.co/api/v1/products/

      Uri url = Uri.https("api.escuelajs.co", "/api/v1/products/");

      var response = await http.get(url);
      String responseBody = response.body;
      var json = jsonDecode(responseBody) as List;
      var listOfPrduct =
          json.map((e) => productResponseDto.fromJson(e)).toList();

      return NetworkSuccess(listOfPrduct);
    } catch (e) {
      return NetworkError(e.toString());
    }
  }
}
