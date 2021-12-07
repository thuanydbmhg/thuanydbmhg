import 'package:equatable/equatable.dart';
import 'package:flutter_architecture/data/grocery/model/response/product_reponse/item_grocery.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
part 'list_item_grocery.g.dart';
@HiveType(typeId: 4)
class ListItemGrocery extends HiveObject
{
  @HiveField(0)
  List<ItemGrocery>? listItem;


  ListItemGrocery(this.listItem);

}