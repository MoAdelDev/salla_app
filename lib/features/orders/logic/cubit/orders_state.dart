part of 'orders_cubit.dart';

@freezed
class OrdersState with _$OrdersState {
  const factory OrdersState.initial() = _Initial;

  const factory OrdersState.loading() = Loading;

  const factory OrdersState.success(List<OrderModel> orders) = Success;

  const factory OrdersState.error({required String message}) = Error;

  const factory OrdersState.cancel() = Cancel;
}
