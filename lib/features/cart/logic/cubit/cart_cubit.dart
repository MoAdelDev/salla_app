import 'package:bloc/bloc.dart';
import 'package:salla_app/features/cart/data/models/cart_response_body.dart';
import 'package:salla_app/features/cart/data/repos/cart_repo.dart';
import 'package:salla_app/features/cart/logic/cubit/cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepo _cartRepo;
  CartCubit(this._cartRepo) : super(const CartState.initial());

  List<CartProductModel> cartProducts = [];

  void emitCartState() async {
    emit(const CartState.loading());
    final response = await _cartRepo.getCart();
    response.when(
      success: (data) {
        cartProducts = data.data.cartProducts;
        emit(CartState.success(data));
      },
      failure: (message) {
        emit(CartState.failure(message));
      },
    );
  }
}
