import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:salla_app/features/home_body/data/models/banner_model.dart';

part 'banner_response.g.dart';

@JsonSerializable()
class BannerResponse {
  final bool status;
  final String? message;
  @JsonKey(name: 'data')
  final List<BannerModel>? banner;

  BannerResponse(this.status, this.message, this.banner);

  factory BannerResponse.fromJson(Map<String, dynamic> json) =>
      _$BannerResponseFromJson(json);
}
