import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:salla_app/core/data/app_data.dart';
import 'package:salla_app/core/helpers/base_safe_cubit.dart';
import 'package:salla_app/features/order_details/data/models/order_details_response_body.dart';
import 'package:salla_app/features/order_details/data/repo/order_details_repo.dart';

part 'order_details_cubit.freezed.dart';
part 'order_details_state.dart';

class OrderDetailsCubit extends BaseSafeCubit<OrderDetailsState> {
  final OrderDetailsRepo _orderDetailsRepo;
  OrderDetailsCubit(this._orderDetailsRepo)
      : super(const OrderDetailsState.initial());

  OrderDetailsData? order;
  void emitOrderDetailsState(int orderId) async {
    safeEmit(const OrderDetailsState.loading());
    final response = await _orderDetailsRepo.getOrderDetails(orderId);
    response.when(
      success: (data) {
        order = data.data;
        safeEmit(OrderDetailsState.success(data));
      },
      failure: (message) => safeEmit(OrderDetailsState.failure(message)),
    );
  }

  void emitCancelOrderState(int orderId) async {
    order?.status = AppData.isArabic ? 'ملغي' : 'Cancelled';
    safeEmit(const OrderDetailsState.loading());
    final response = await _orderDetailsRepo.cancelOrder(orderId);
    response.when(
      success: (data) => safeEmit(
        OrderDetailsState.cancelOrder(data.message ?? ''),
      ),
      failure: (message) => safeEmit(OrderDetailsState.failure(message)),
    );
  }
}
