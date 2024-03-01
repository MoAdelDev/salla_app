import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salla_app/features/cart/data/models/cart_response_body.dart';
import 'package:salla_app/features/cart/data/models/cart_update_request.dart';
import 'package:salla_app/features/cart/data/repos/cart_repo.dart';
import 'package:salla_app/features/cart/logic/cubit/cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepo _cartRepo;
  CartCubit(this._cartRepo) : super(const CartState.initial());

  List<CartProductModel> cartProducts = [];

  Map<int, int> cartQuantities = {};
  double totalPrice = 0;
  void emitCartState() async {
    emit(const CartState.loading());
    final response = await _cartRepo.getCart();
    response.when(
      success: (data) {
        cartProducts = data.data?.cartProducts ?? [];
        for (var element in cartProducts) {
          cartQuantities[element.id] = element.quantity;
        }
        totalPrice = data.data?.total ?? 0.0;
        emit(CartState.success(data));
      },
      failure: (message) {
        emit(CartState.failure(message));
      },
    );
  }

  bool isCartUpdateLoading = false;

  void emitUpdateCartState(int cartId, int quantity) async {
    isCartUpdateLoading = true;
    emit(const CartState.updateCartLoading());
    final response = await _cartRepo.updateCart(
      cartId,
      CartUpdateRequest(quantity),
    );
    response.when(
      success: (data) {
        isCartUpdateLoading = false;
        _updateTotalPriceAndQuantity(quantity, cartId);
        emit(const CartState.updateCartSuccess());
      },
      failure: (message) {
        isCartUpdateLoading = false;
        emit(const CartState.updateCartFailure());
      },
    );
  }

  void emitDeleteCartState({required int cartId}) async {
    isCartUpdateLoading = true;
    emit(const CartState.deleteCartLoading());
    final response = await _cartRepo.deleteCart(cartId);
    response.when(
      success: (data) {
        isCartUpdateLoading = false;
        cartProducts.removeWhere((element) => element.id == cartId);
        _updateTotalPriceAndQuantity(0, cartId);
        emit(const CartState.deleteCartSuccess());
      },
      failure: (message) {
        isCartUpdateLoading = false;
        emit(const CartState.deleteCartFailure());
      },
    );
  }

  void _updateTotalPriceAndQuantity(int quantity, int cartId) {
    cartQuantities[cartId] = quantity;
    for (CartProductModel product in cartProducts) {
      dynamic price = (product.product.price) + 0.0;
      totalPrice += price * quantity;
    }
  }
}
