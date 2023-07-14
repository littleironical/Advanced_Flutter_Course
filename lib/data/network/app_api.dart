import 'package:advanced_flutter_course/app/constants.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';
import '../responses/responses.dart';

part 'app_api.g.dart';

// COMMAND TO GENERATE MISSLES
// flutter pub get
// flutter pub run build_runner build --delete-conflicting-outputs

@RestApi(baseUrl: Constant.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;
  
  @POST("/customers/login")
  Future<AuthenticationResponse> login(
      @Field("email") String email,
      @Field("password") String password,
      @Field("imei") String imei,
      @Field("device_type") String deviceType,
      );
}
