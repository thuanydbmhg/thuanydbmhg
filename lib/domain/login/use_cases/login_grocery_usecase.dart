import 'dart:async';

import 'package:flutter_architecture/data/grocery/model/response/login_response.dart';
import 'package:flutter_architecture/domain/login/repositories/login_repository.dart';

class LoginGrocery {
  final LoginRepository _loginRepository;

  LoginGrocery(this._loginRepository);

  FutureOr<LoginResponse>? loginGrocery(String? user, String? password) =>
      _loginRepository.loginGrocery(user, password);
}
