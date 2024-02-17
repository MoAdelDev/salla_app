import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:salla_app/core/networking/api_constance.dart';
import 'package:salla_app/features/login/data/models/login_request_body.dart';
import 'package:salla_app/features/login/data/models/login_response_body.dart';
import 'package:salla_app/features/register/data/models/register_body_response.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstance.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstance.login)
  Future<LoginResponseBody> login(@Body() LoginRequestBody loginRequestBody);

  @POST(ApiConstance.register)
  Future<RegisterBodyResponse> register(
    @Body() RegisterBodyResponse registerBodyResponse,
  );
}
