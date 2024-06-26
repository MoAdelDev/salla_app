import 'package:salla_app/core/helpers/base_safe_cubit.dart';
import 'package:salla_app/features/home_body/data/models/products_response.dart';
import 'package:salla_app/features/product_details/data/models/add_to_cart_request.dart';
import 'package:salla_app/features/product_details/data/repos/product_details_repo.dart';
import 'package:salla_app/features/product_details/logic/cubit/product_details_state.dart';

class ProductDetailsCubit extends BaseSafeCubit<ProductDetailsState> {
  final ProductDetailsRepo addToCartRepo;
  ProductDetailsCubit(this.addToCartRepo)
      : super(const ProductDetailsState.initial());
  bool inCart = true;
  late ProductModel productModel;
  void emitProductDeatilsState(int productId) async {
    safeEmit(const ProductDetailsState.loading());
    final response = await addToCartRepo.getProductDetails(productId);
    response.when(
      success: (data) {
        inCart = data.product.inCart;
        productModel = data.product;
        safeEmit(ProductDetailsState.success(data));
      },
      failure: (error) => safeEmit(ProductDetailsState.failure(error)),
    );
  }

  void emitAddToCartState({required int productId}) async {
    safeEmit(const ProductDetailsState.addToCartLoading());
    final response = await addToCartRepo.addToCart(AddToCartRequest(productId));
    response.when(
      success: (data) {
        inCart = !inCart;
        safeEmit(
          ProductDetailsState.addToCartSuccess(data),
        );
      },
      failure: (error) => safeEmit(
        ProductDetailsState.addToCartError(error),
      ),
    );
  }
}
