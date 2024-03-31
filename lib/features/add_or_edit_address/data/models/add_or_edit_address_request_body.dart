import 'package:json_annotation/json_annotation.dart';

part 'add_or_edit_address_request_body.g.dart';

@JsonSerializable()
class AddOrEditAddressRequestBody {
  final String name;
  final String details;
  final String notes;
  final String city;
  final String region;
  final double latitude;
  final double longitude;

  AddOrEditAddressRequestBody(
    this.name,
    this.details,
    this.notes,
    this.city,
    this.region,
    this.latitude,
    this.longitude,
  );

  Map<String, dynamic> toJson() => _$AddOrEditAddressRequestBodyToJson(this);
}
