import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../models/Users.dart';

part 'web_services.g.dart';

@RestApi(baseUrl: "https://gorest.co.in/public/v2/")
abstract class WebServices {
  factory WebServices(Dio dio, {String baseUrl}) = _WebServices;

  @GET("users")
  Future<List<User>> getAllUsers();

  @GET('users/{id}')
  Future<User> getUserById(@Path() int userId);

  @POST("users")
  Future<User> createNewUser(@Body() User newUser, @Header('') String token);
}
