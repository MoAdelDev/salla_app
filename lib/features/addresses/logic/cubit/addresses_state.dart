import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:salla_app/features/checkout/data/models/addresses_response_body.dart';

part 'addresses_state.freezed.dart';

@freezed
class AddressesState with _$AddressesState {
  const factory AddressesState.initial() = _Initial;

  const factory AddressesState.loading() = Loading;

  const factory AddressesState.success(List<AddressModel> addresses) = Success;

  const factory AddressesState.failure(String message) = Failure;
}
