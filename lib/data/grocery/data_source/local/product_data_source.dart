
import 'package:flutter_architecture/data/grocery/data_source/local/item_grocery_local.dart';
import 'package:hive/hive.dart';

class ProductDataSource{
  Box<List> product;

  ProductDataSource({required this.product});

  Future<void> saveDataCart(List<ItemGroceryLocal> playerData) async
  {
    await product.put('cart', playerData);
  }
  Future<void> saveDataFavorite(List<ItemGroceryLocal> playerData) async
  {
    await product.put('favorite', playerData);
  }
  Future<List<ItemGroceryLocal>?>? getData() async
  {
    return  product.get('cart')?.cast<ItemGroceryLocal>();
  }
  Future<List<ItemGroceryLocal>?>? getDataFavorite() async
  {
    return  product.get('favorite')?.cast<ItemGroceryLocal>();
  }
}