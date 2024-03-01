import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:salla_app/features/cart/data/models/cart_response_body.dart';

part 'cart_state.freezed.dart';

@freezed
sealed class CartState with _$CartState {
  const factory CartState.initial() = _Initial;

  const factory CartState.loading() = Loading;

  const factory CartState.success(CartResponseBody data) = Success;

  const factory CartState.failure(String message) = Failure;

  const factory CartState.updateCartLoading() = UpdateLoadingCart;

  const factory CartState.updateCartSuccess() = UpdateSuccessCart;

  const factory CartState.updateCartFailure() = UpdateCartFailure;

  const factory CartState.deleteCartLoading() = DeleteCartLoading;

  const factory CartState.deleteCartSuccess() = DeleteCartSuccess;

  const factory CartState.deleteCartFailure() = DeleteCartFailure;

  const factory CartState.deleteAllCartLoading() = DeleteAllCartLoading;

  const factory CartState.deleteAllCartSuccess() = DeleteAllCartSuccess;

  const factory CartState.deleteAllCartFailure() = DeleteAllCartFailure;
}
