import 'package:configuration/di/di_module.dart';
import 'package:flutter_architecture/data/grocery/data_source/local/product_data_source.dart';

import 'package:hive/hive.dart';

class ProductDatasourceModule extends DIModule {
  @override
  provides() async {
    Box<List> boxPlayer = await Hive.openBox<List>('products');
    getIt.registerSingleton(ProductDataSource( product: boxPlayer));
  }
}
