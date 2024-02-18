import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:salla_app/features/home_body/data/models/banner_model.dart';

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
