import 'package:freezed_annotation/freezed_annotation.dart';

part 'banner_model.g.dart';

@JsonSerializable()
class BannerModel {
  final int id;
  final String image;

  BannerModel(this.id, this.image);

  factory BannerModel.fromJson(Map<String, dynamic> json) =>
      _$BannerModelFromJson(json);
}
