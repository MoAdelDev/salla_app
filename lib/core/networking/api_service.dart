import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:salla_app/core/networking/api_constance.dart';
import 'package:salla_app/features/home_body/data/models/banners_response.dart';
import 'package:salla_app/features/home_body/data/models/categories_response.dart';
import 'package:salla_app/features/home_body/data/models/products_response.dart';
import 'package:salla_app/features/login/data/models/login_request_body.dart';
import 'package:salla_app/features/login/data/models/login_response_body.dart';
import 'package:salla_app/features/register/data/models/register_body_request.dart';
import 'package:salla_app/features/register/data/models/register_body_response.dart';

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
}
