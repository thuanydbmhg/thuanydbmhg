import 'dart:async';

import 'package:flutter_architecture/data/grocery/model/response/login_response.dart';
import 'package:flutter_architecture/domain/grocery/repositories/grocery_repository.dart';
import 'package:flutter_architecture/domain/login/repositories/login_repository.dart';

class LoginUserGroceryUseCase {
  final GroceryRepository _groceryRepository;

  LoginUserGroceryUseCase(this._groceryRepository);

  FutureOr<LoginResponse>? loginGroceryUser(String? user, String? password)=>_groceryRepository.loginGroceryUser(user, password);
}
