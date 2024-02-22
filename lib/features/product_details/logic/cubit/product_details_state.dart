import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:salla_app/features/product_details/data/models/add_to_cart_response.dart';
import 'package:salla_app/features/product_details/data/models/product_details_response.dart';

part 'product_details_state.freezed.dart';

@freezed
class ProductDetailsState with _$ProductDetailsState {
  const factory ProductDetailsState.initial() = _Initial;

  const factory ProductDetailsState.loading() = Loading;

  const factory ProductDetailsState.success(ProductDetailsResponse response) =
      Success;

  const factory ProductDetailsState.failure(String message) = Failure;

  const factory ProductDetailsState.addToCartLoading() = AddToCartLoading;

  const factory ProductDetailsState.addToCartSuccess(
      AddToCartResponse addToCartResponse) = AddToCartSuccess;

  const factory ProductDetailsState.addToCartError(String message) =
      AddToCartError;
}
