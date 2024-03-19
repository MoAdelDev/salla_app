import 'package:freezed_annotation/freezed_annotation.dart';
part 'checkout_state.freezed.dart';

@freezed
class CheckoutState with _$CheckoutState {
  const factory CheckoutState.initial() = _Initial;

  const factory CheckoutState.loading() = Loading;

  const factory CheckoutState.success() = Success;

  const factory CheckoutState.failure(String message) = Failure;

  const factory CheckoutState.applyPromoCodeLoading() = ApplyPromoCodeLoading;

  const factory CheckoutState.applyPromoCodeSuccess(String message) =
      ApplyPromoCodeSuccess;

  const factory CheckoutState.applyPromoCodeFailure(String message) =
      ApplyPromoCodeFailure;
}
