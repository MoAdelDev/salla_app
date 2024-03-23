import 'package:salla_app/core/helpers/base_safe_cubit.dart';
import 'package:salla_app/features/cart/data/models/cart_response_body.dart';
import 'package:salla_app/features/cart/data/models/cart_update_request.dart';
import 'package:salla_app/features/cart/data/repos/cart_repo.dart';
import 'package:salla_app/features/cart/logic/cubit/cart_state.dart';

class CartCubit extends BaseSafeCubit<CartState> {
  final CartRepo _cartRepo;
  CartCubit(this._cartRepo) : super(const CartState.initial());

  List<CartProductModel> cartProducts = [];

  CartData? cartData;
  Map<int, int> cartQuantities = {};
  double totalPrice = 0;
  void emitCartState() async {
    safeEmit(const CartState.loading());
    final response = await _cartRepo.getCart();
    response.when(
      success: (data) {
        cartProducts = data.data?.cartProducts ?? [];
        cartData = data.data;
        for (var element in cartProducts) {
          cartQuantities[element.id] = element.quantity;
        }
        totalPrice = data.data?.total ?? 0.0;
        safeEmit(CartState.success(data));
      },
      failure: (message) {
        safeEmit(CartState.failure(message));
      },
    );
  }

  bool isCartUpdateLoading = false;

  void emitUpdateCartState(int cartId, int quantity, double price) async {
    isCartUpdateLoading = true;
    safeEmit(const CartState.updateCartLoading());
    final response = await _cartRepo.updateCart(
      cartId,
      CartUpdateRequest(quantity),
    );
    response.when(
      success: (data) {
        isCartUpdateLoading = false;
        cartQuantities[cartId] = quantity;
        totalPrice += price;
        safeEmit(const CartState.updateCartSuccess());
      },
      failure: (message) {
        isCartUpdateLoading = false;
        safeEmit(const CartState.updateCartFailure());
      },
    );
  }

  void emitDeleteCartState({required int cartId, required double price}) async {
    isCartUpdateLoading = true;
    safeEmit(const CartState.deleteCartLoading());
    final response = await _cartRepo.deleteCart(cartId);
    response.when(
      success: (data) {
        isCartUpdateLoading = false;
        cartProducts.removeWhere((element) => element.id == cartId);
        cartQuantities[cartId] = 0;
        totalPrice -= price;
        safeEmit(const CartState.deleteCartSuccess());
      },
      failure: (message) {
        isCartUpdateLoading = false;
        safeEmit(const CartState.deleteCartFailure());
      },
    );
  }
}
