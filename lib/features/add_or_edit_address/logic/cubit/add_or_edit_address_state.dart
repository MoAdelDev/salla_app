import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_or_edit_address_state.freezed.dart';

@freezed
class AddOrEditAddressState with _$AddOrEditAddressState {
  const factory AddOrEditAddressState.initial() = _Initial;

  const factory AddOrEditAddressState.loading() = Loading;

  const factory AddOrEditAddressState.success(String message) = Success;

  const factory AddOrEditAddressState.error(String message) = Error;
}
