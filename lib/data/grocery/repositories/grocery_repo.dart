import 'dart:async';
import 'package:configuration/data/exceptions/api_exception.dart';
import 'package:dio/dio.dart';
import 'package:flutter_architecture/data/grocery/data_source/remote/grocery_api.dart';
import 'package:flutter_architecture/data/grocery/model/response/login_response.dart';
import 'package:flutter_architecture/domain/grocery/repositories/grocery_repository.dart';

class GroceryRepoImpl implements GroceryRepository
{
  GroceryApi groceryApi;

  GroceryRepoImpl(this.groceryApi);

  @override
  FutureOr<LoginResponse>? loginGroceryUser(String? user, String? password)  async{
    try {
      final data =
          await groceryApi.loginGroceryUser(user ?? 'admin', password ?? 'admin123');
      return data;
    } on DioError catch (dioError) {
      throw ApiException(exception: dioError);
    } catch (e) {
      throw Exception('Unexpected Exception $e');
    }
  }

}