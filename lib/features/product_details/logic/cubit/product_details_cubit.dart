import 'package:bloc/bloc.dart';
import 'package:salla_app/features/home_body/data/models/products_response.dart';
import 'package:salla_app/features/product_details/data/models/add_to_cart_request.dart';
import 'package:salla_app/features/product_details/data/repos/product_details_repo.dart';
import 'package:salla_app/features/product_details/logic/cubit/product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  final ProductDetailsRepo addToCartRepo;
  ProductDetailsCubit(this.addToCartRepo)
      : super(const ProductDetailsState.initial());
  bool inCart = true;
  late ProductModel productModel;
  void emitProductDeatilsState(int productId) async {
    emit(const ProductDetailsState.loading());
    final response = await addToCartRepo.getProductDetails(productId);
    response.when(
      success: (data) {
        inCart = data.product.inCart;
        productModel = data.product;
        emit(ProductDetailsState.success(data));
      },
      failure: (error) => emit(ProductDetailsState.failure(error)),
    );
  }

  void emitAddToCartState({required int productId}) async {
    emit(const ProductDetailsState.addToCartLoading());
    final response = await addToCartRepo.addToCart(AddToCartRequest(productId));
    response.when(
      success: (data) {
        inCart = !inCart;
        emit(
          ProductDetailsState.addToCartSuccess(data),
        );
      },
      failure: (error) => emit(
        ProductDetailsState.addToCartError(error),
      ),
    );
  }
}
