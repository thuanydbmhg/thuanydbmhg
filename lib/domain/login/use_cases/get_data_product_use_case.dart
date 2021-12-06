import 'dart:async';

import 'package:flutter_architecture/data/grocery/model/response/product_reponse/list_item_grocery.dart';
import 'package:flutter_architecture/domain/login/repositories/login_repository.dart';

class GetDataProductUseCase {
  final LoginRepository _loginRepository;

  GetDataProductUseCase(this._loginRepository);

  FutureOr<ListItemGrocery>? getDataProduct() =>
      _loginRepository.getDataProduct();
}
