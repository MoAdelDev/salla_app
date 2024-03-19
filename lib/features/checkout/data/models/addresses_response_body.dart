import 'package:json_annotation/json_annotation.dart';
part 'addresses_response_body.g.dart';

@JsonSerializable()
class AddressesResponseBody {
  final String? message;
  final bool status;
  final AddressesData? data;

  AddressesResponseBody(this.message, this.status, this.data);

  factory AddressesResponseBody.fromJson(Map<String, dynamic> json) =>
      _$AddressesResponseBodyFromJson(json);
}

@JsonSerializable()
class AddressesData {
  @JsonKey(name: 'data')
  final List<AddressModel> addresses;

  AddressesData(this.addresses);

  factory AddressesData.fromJson(Map<String, dynamic> json) =>
      _$AddressesDataFromJson(json);
}

@JsonSerializable()
class AddressModel {
  final int id;
  final String name;
  final String city;
  final String region;
  final String details;
  final String notes;
  final double latitude;
  final double longitude;

  AddressModel(
    this.id,
    this.name,
    this.city,
    this.region,
    this.details,
    this.notes,
    this.latitude,
    this.longitude,
  );

  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);
}
