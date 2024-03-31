import 'package:json_annotation/json_annotation.dart';
import 'package:salla_app/features/checkout/data/models/addresses_response_body.dart';

part 'add_or_edit_address_response_body.g.dart';

@JsonSerializable()
class AddOrEditAddressResponseBody {
  final String message;
  final bool status;
  final AddressModel? data;

  AddOrEditAddressResponseBody(
    this.message,
    this.status,
    this.data,
  );

  factory AddOrEditAddressResponseBody.fromJson(Map<String, dynamic> json) =>
      _$AddOrEditAddressResponseBodyFromJson(json);
}
