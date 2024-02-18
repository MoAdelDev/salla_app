import 'package:freezed_annotation/freezed_annotation.dart';

part 'categories_response.g.dart';

@JsonSerializable()
class CategoriesResponse {
  final bool status;
  final String? message;
  @JsonKey(name: 'data')
  final CategoryData categoryData;

  CategoriesResponse(this.status, this.message, this.categoryData);

  factory CategoriesResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoriesResponseFromJson(json);
}

@JsonSerializable()
class CategoryData {
  @JsonKey(name: 'data')
  final List<CategoryModel>? categories;
  final int total;

  CategoryData(this.categories, this.total);

  factory CategoryData.fromJson(Map<String, dynamic> json) =>
      _$CategoryDataFromJson(json);
}

@JsonSerializable()
class CategoryModel {
  final int id;
  final String name;
  final String image;

  CategoryModel(this.id, this.name, this.image);

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
}
