part of 'order_details_cubit.dart';

@freezed
class OrderDetailsState with _$OrderDetailsState {
  const factory OrderDetailsState.initial() = _Initial;

  const factory OrderDetailsState.loading() = Loading;

  const factory OrderDetailsState.success(
    OrderDetailsResponseBody orderDetailsResponseBody,
  ) = Success;

  const factory OrderDetailsState.failure(String message) = Failure;

  const factory OrderDetailsState.cancelOrder(String message) = CancelOrder;
}
