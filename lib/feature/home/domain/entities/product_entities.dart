import 'package:cartzy_app/feature/home/data/model/response/category_response_dto.dart';
import 'package:cartzy_app/feature/home/domain/entities/category_entities.dart';

class ProductEntities {
  int id;
  String title;
  String slug;
  int price;
  String description;
  CategoryEntities category;
  List<String> images;

  ProductEntities({
    this.id = 0,
    this.title = "",
    this.slug = "",
    this.price = 100,
    this.description = '',
    this.category = const CategoryEntities(),
    this.images = const [],
  });
}

class Category {
  int? id;
  String? name;
  String? slug;
  String? image;

  Category({
    this.id,
    this.name,
    this.slug,
    this.image,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['image'] = this.image;

    return data;
  }
}
