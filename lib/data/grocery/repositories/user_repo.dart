import 'dart:async';

import 'package:configuration/data/exceptions/api_exception.dart';
import 'package:dio/dio.dart';
import 'package:flutter_architecture/data/grocery/data_source/remote/user_api.dart';
import 'package:flutter_architecture/data/grocery/model/response/category_response/list_category.dart';
import 'package:flutter_architecture/data/grocery/model/response/login_response.dart';
import 'package:flutter_architecture/data/grocery/model/response/product_reponse/list_item_grocery.dart';
import 'package:flutter_architecture/domain/login/entities/auth_entity.dart';
import 'package:flutter_architecture/domain/login/repositories/login_repository.dart';

class UserRepoImpl implements LoginRepository {
  UserApi? userApi;

  UserRepoImpl({this.userApi});

  @override
  FutureOr<AuthEntity?>? login(String? user, String? password) async {
    try {
      assert(user != null && password != null);
      return AuthEntity(
          'APA91bGSAUqIOaXTEK8ga7GKUM85eEK9sQMvWcxcCFqlewDvnuib0RFW');
    } on DioError catch (dioError) {
      throw ApiException(exception: dioError);
    } catch (e) {
      throw Exception('Unexpected Exception $e');
    }
  }

  @override
  FutureOr<ListItemGrocery>? getDataProduct() async {
    try {
      final data = await userApi!.getListProduct();
      return data!;
    } on DioError catch (dioError) {
      throw ApiException(exception: dioError);
    } catch (e) {
      throw Exception('Unexpected Exception $e');
    }
  }

  @override
  FutureOr<LoginResponse>? loginGrocery(String? user, String? password) async {
    try {
      final data =
          await userApi!.loginGrocery(user ?? 'admin', password ?? 'admin123');
      return data;
    } on DioError catch (dioError) {
      throw ApiException(exception: dioError);
    } catch (e) {
      throw Exception('Unexpected Exception $e');
    }
  }

  @override
  FutureOr<ListCategory>? getListCategory() async {
    try {
      final data = await userApi!.getListCategory();
      return data;
    } on DioError catch (dioError) {
      throw ApiException(exception: dioError);
    } catch (e) {
      throw Exception('Unexpected Exception $e');
    }
  }
}
