import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:salla_app/features/checkout/data/models/addresses_response.dart';
part 'checkout_state.freezed.dart';

@freezed
class CheckoutState with _$CheckoutState {
  const factory CheckoutState.initial() = _Initial;

  const factory CheckoutState.loading() = Loading;

  const factory CheckoutState.success(List<AddressModel> addresses) = Success;

  const factory CheckoutState.failure(String message) = Failure;

  const factory CheckoutState.applyPromoCodeLoading() = ApplyPromoCodeLoading;

  const factory CheckoutState.applyPromoCodeSuccess(String message) =
      ApplyPromoCodeSuccess;

  const factory CheckoutState.applyPromoCodeFailure(String message) =
      ApplyPromoCodeFailure;

  const factory CheckoutState.selectItem() = SelectItem;
}
