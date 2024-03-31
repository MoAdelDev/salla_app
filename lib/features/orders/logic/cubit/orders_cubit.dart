import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:salla_app/core/data/app_data.dart';
import 'package:salla_app/core/helpers/base_safe_cubit.dart';
import 'package:salla_app/features/orders/data/models/orders_response_body.dart';
import 'package:salla_app/features/orders/data/repos/orders_repo.dart';

part 'orders_cubit.freezed.dart';
part 'orders_state.dart';

class OrdersCubit extends BaseSafeCubit<OrdersState> {
  final OrdersRepo _ordersRepo;
  OrdersCubit(this._ordersRepo) : super(const OrdersState.initial());

  List<OrderModel>? orders;

  void emitOrdersState() async {
    safeEmit(const OrdersState.loading());
    final response = await _ordersRepo.getOrders();
    response.when(
      success: (data) {
        orders = data.data?.orders;
        safeEmit(OrdersState.success(data.data?.orders ?? []));
      },
      failure: (error) {
        safeEmit(OrdersState.error(message: error));
      },
    );
  }

  void emitCancelOrderState(int orderId) async {
    orders!.reduce((value, element) {
      if (element.id == orderId) {
        element.status = AppData.isArabic ? 'ملغي' : 'Cancelled';
      }
      return element;
    });
    safeEmit(const OrdersState.loading());
    final response = await _ordersRepo.cancelOrder(orderId);
    response.when(
      success: (data) {
        safeEmit(const OrdersState.cancel());
      },
      failure: (error) {
        orders!.reduce((value, element) {
          if (element.id == orderId) {
            element.status = AppData.isArabic ? 'جديد' : 'New';
          }
          return element;
        });
        safeEmit(OrdersState.error(message: error));
      },
    );
  }
}
