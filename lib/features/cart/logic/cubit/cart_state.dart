import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:salla_app/features/cart/data/models/cart_response_body.dart';

part 'cart_state.freezed.dart';

@freezed
class CartState with _$CartState {
  const factory CartState.initial() = _Initial;

  const factory CartState.loading() = Loading;

  const factory CartState.success(CartResponseBody data) = Success;

  const factory CartState.failure(String message) = Failure;

  const factory CartState.updateCart() = UpdateCart;
}
