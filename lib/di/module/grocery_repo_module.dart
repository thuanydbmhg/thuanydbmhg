import 'package:configuration/di/di_module.dart';
import 'package:flutter_architecture/data/grocery/data_source/remote/grocery_api.dart';
import 'package:flutter_architecture/data/grocery/data_source/remote/user_api.dart';
import 'package:flutter_architecture/data/grocery/repositories/grocery_repo.dart';
import 'package:flutter_architecture/data/grocery/repositories/user_repo.dart';

class GroceryRepoModule extends DIModule {
  @override
  provides() async {
    getIt.registerFactory<GroceryRepoImpl>(
            () => GroceryRepoImpl( getIt.get<GroceryApi>()));
  }
}
