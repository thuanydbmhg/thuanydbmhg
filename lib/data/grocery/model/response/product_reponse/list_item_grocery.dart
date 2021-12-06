import 'package:equatable/equatable.dart';
import 'package:flutter_architecture/data/grocery/model/response/product_reponse/item_grocery.dart';
import 'package:json_annotation/json_annotation.dart';
part 'list_item_grocery.g.dart';
@JsonSerializable()
class ListItemGrocery extends Equatable
{
  @JsonKey(name: 'data')
  List<ItemGrocery>? listItem;


  ListItemGrocery(this.listItem);

  factory ListItemGrocery.fromJson(Map<String, dynamic> json) =>
      _$ListItemGroceryFromJson(json);

  Map<String, dynamic> toJson() => _$ListItemGroceryToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [listItem??[]];
}