import 'package:dio/dio.dart' hide Headers;
import 'package:flutter_architecture/data/grocery/model/response/login_response.dart';
import 'package:retrofit/http.dart';

part 'grocery_api.g.dart';

@RestApi()
abstract class GroceryApi {
  factory GroceryApi(Dio dio, {String baseUrl}) = _GroceryApi;

  @POST('login')
  Future<LoginResponse> loginGroceryUser(
      @Query('email') String user, @Query('password') String password);
}
