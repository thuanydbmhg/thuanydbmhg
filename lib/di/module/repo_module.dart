import 'package:configuration/di/di_module.dart';
import 'package:flutter_architecture/data/grocery/data_source/remote/user_api.dart';
import 'package:flutter_architecture/data/grocery/repositories/user_repo.dart';

class RepoModule extends DIModule {
  @override
  provides() async {
    getIt.registerFactory<UserRepoImpl>(
        () => UserRepoImpl(userApi: getIt.get<UserApi>()));
  }
}
