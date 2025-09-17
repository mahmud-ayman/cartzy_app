import 'package:cartzy_app/core/network/network.dart';
import 'package:cartzy_app/feature/home/data/model/response/category_response_dto.dart';

abstract class HomeRepositoryContract {
  Future<NetworkResult<List<categoryResponseDto>>> getCategory();
}
