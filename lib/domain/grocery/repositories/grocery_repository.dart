import 'dart:async';

import 'package:flutter_architecture/data/grocery/model/response/category_response/list_category.dart';
import 'package:flutter_architecture/data/grocery/model/response/login_response.dart';
import 'package:flutter_architecture/data/grocery/model/response/product_reponse/list_item_grocery.dart';
import 'package:flutter_architecture/domain/login/entities/auth_entity.dart';

abstract class GroceryRepository{

  FutureOr<LoginResponse>? loginGroceryUser(String? user, String? password);

}