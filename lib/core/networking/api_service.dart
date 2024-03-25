import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:salla_app/core/networking/api_constance.dart';
import 'package:salla_app/features/cart/data/models/cart_response_body.dart';
import 'package:salla_app/features/cart/data/models/cart_update_request.dart';
import 'package:salla_app/features/cart/data/models/cart_update_response.dart';
import 'package:salla_app/features/checkout/data/models/add_order_request_body.dart';
import 'package:salla_app/features/checkout/data/models/add_order_response_body.dart';
import 'package:salla_app/features/checkout/data/models/addresses_response_body.dart';
import 'package:salla_app/features/checkout/data/models/promo_code_request_body.dart';
import 'package:salla_app/features/checkout/data/models/promo_code_response_body.dart';
import 'package:salla_app/features/favorites/data/models/favorite_remove_response.dart';
import 'package:salla_app/features/favorites/data/models/favorites_response.dart';
import 'package:salla_app/features/home_body/data/models/banners_response.dart';
import 'package:salla_app/features/home_body/data/models/categories_response.dart';
import 'package:salla_app/features/home_body/data/models/change_favorite_request.dart';
import 'package:salla_app/features/home_body/data/models/change_favorite_response.dart';
import 'package:salla_app/features/home_body/data/models/products_response.dart';
import 'package:salla_app/features/login/data/models/login_request_body.dart';
import 'package:salla_app/features/login/data/models/login_response_body.dart';
import 'package:salla_app/features/product_details/data/models/add_to_cart_request.dart';
import 'package:salla_app/features/product_details/data/models/add_to_cart_response.dart';
import 'package:salla_app/features/product_details/data/models/product_details_response.dart';
import 'package:salla_app/features/register/data/models/register_body_request.dart';
import 'package:salla_app/features/register/data/models/register_body_response.dart';
import 'package:salla_app/features/settings/data/models/logout_response_body.dart';

import '../../features/home/data/models/user_response_body.dart';
part 'api_service.g.dart';

@RestApi(
  baseUrl: ApiConstance.baseUrl,
)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstance.login)
  Future<LoginResponseBody> login(@Body() LoginRequestBody loginRequestBody);

  @POST(ApiConstance.register)
  Future<RegisterBodyResponse> register(
    @Body() RegisterBodyRequest registerBodyRequest,
  );

  @GET(ApiConstance.profile)
  Future<UserResponseBody> getUser(@Header('Authorization') String token);

  @GET(ApiConstance.banners)
  Future<BannersResponse> getBanners();

  @GET(ApiConstance.categories)
  Future<CategoriesResponse> getCategories();

  @GET(ApiConstance.products)
  Future<ProductsReponsne> getProducts(@Header('Authorization') String token);

  @POST(ApiConstance.favorites)
  Future<ChangeFavoriteResponse> changeFavorite(
    @Header('Authorization') String token,
    @Body() ChangeFavoriteRequest changeFavoriteRequest,
  );

  @GET(ApiConstance.products)
  Future<ProductsReponsne> getProductsByCategory(
    @Header('Authorization') String token,
    @Query('category_id') int categoryId,
  );

  @GET(ApiConstance.favorites)
  Future<FavoritesResponse> getFavorites(
    @Header('Authorization') String token,
  );

  @DELETE("${ApiConstance.favorites}/{id}")
  Future<FavoriteRemoveResponse> removeFavorite(
    @Header('Authorization') String token,
    @Path("id") int id,
  );

  @GET("${ApiConstance.products}/{id}")
  Future<ProductDetailsResponse> getProductDetails(
    @Header('Authorization') String token,
    @Path("id") int id,
  );
  @POST(ApiConstance.carts)
  Future<AddToCartResponse> addToCart(
    @Header('Authorization') String token,
    @Body() AddToCartRequest addToCartRequest,
  );

  @GET(ApiConstance.carts)
  Future<CartResponseBody> getCart(
    @Header('Authorization') String token,
  );

  @PUT("${ApiConstance.carts}/{id}")
  Future<CartUpdateResponse> updateCart(
    @Header('Authorization') String token,
    @Path("id") int id,
    @Body() CartUpdateRequest cartUpdateRequest,
  );

  @DELETE("${ApiConstance.carts}/{id}")
  Future<CartUpdateResponse> deleteCart(
    @Header('Authorization') String token,
    @Path("id") int id,
  );

  @POST('${ApiConstance.promoCodes}/validate')
  Future<PromoCodeResponseBody> applyPromoCode(
    @Header('Authorization') String token,
    @Body() PromoCodeRequestBody promoCodeRequest,
  );
  @GET(ApiConstance.addresses)
  Future<AddressesResponseBody> getAddresses(
    @Header('Authorization') String token,
  );

  @POST(ApiConstance.orders)
  Future<AddOrderResponseBody> addOrder(
    @Header('Authorization') String token,
    @Body() AddOrderRequestBody addOrderRequestBody,
  );

  @POST(ApiConstance.logout)
  Future<LogoutResponseBody> logout(
    @Header('Authorization') String token,
  );
}
