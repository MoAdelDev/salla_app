import 'package:freezed_annotation/freezed_annotation.dart';
part 'banners_response.g.dart';

@JsonSerializable()
class BannersResponse {
  final bool status;
  final String? message;
  @JsonKey(name: 'data')
  final List<BannerModel>? banners;

  BannersResponse(this.status, this.message, this.banners);

  factory BannersResponse.fromJson(Map<String, dynamic> json) =>
      _$BannersResponseFromJson(json);
}

@JsonSerializable()
class BannerModel {
  final int id;
  final String image;

  BannerModel(this.id, this.image);

  factory BannerModel.fromJson(Map<String, dynamic> json) =>
      _$BannerModelFromJson(json);
}
