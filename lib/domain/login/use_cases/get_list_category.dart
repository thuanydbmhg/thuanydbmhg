import 'dart:async';

import 'package:flutter_architecture/data/grocery/model/response/category_response/list_category.dart';
import 'package:flutter_architecture/domain/login/repositories/login_repository.dart';

class GetListCategory {
  final LoginRepository _loginRepository;

  GetListCategory(this._loginRepository);

  FutureOr<ListCategory>? getListCategory() =>
      _loginRepository.getListCategory();
}
