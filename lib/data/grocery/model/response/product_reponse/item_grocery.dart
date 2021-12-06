import 'package:equatable/equatable.dart';
import 'package:flutter_architecture/data/grocery/model/response/product_reponse/attributes_product.dart';
import 'package:flutter_architecture/data/grocery/model/response/product_reponse/description_model.dart';
import 'package:flutter_architecture/data/grocery/model/response/product_reponse/image_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'item_grocery.g.dart';
@JsonSerializable()
class ItemGrocery extends Equatable
{
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'sku')
  String? sku;
  @JsonKey(name: 'image')
  String? image;
  @JsonKey(name: 'brand_id')
  int? brandId;
  @JsonKey(name: 'supplier_id')
  int? supplierId;
  @JsonKey(name: 'price')
  int? price;
  @JsonKey(name: 'cost')
  int? cost;
  @JsonKey(name: 'stock')
  int? stock;
  @JsonKey(name: 'sold')
  int? sold;
  @JsonKey(name: 'minimum')
  int? minimum;
  @JsonKey(name: 'weight')
  int? weight;
  @JsonKey(name: 'length')
  int? length;
  @JsonKey(name: 'width')
  int? width;
  @JsonKey(name: 'height')
  int? height;
  @JsonKey(name: 'kind')
  int? kind;
  @JsonKey(name: 'property')
  String? property;
  @JsonKey(name: 'tax_id')
  String? taxId;
  @JsonKey(name: 'status')
  int? status;
  @JsonKey(name: 'sort')
  int? sort;
  @JsonKey(name: 'view')
  int? view;
  @JsonKey(name: 'alias')
  String? alias;
  @JsonKey(name: 'images')
  List<ImageModel>? images;
  @JsonKey(name: 'descriptions')
  List<DesCriptionModel>? descriptions;
  @JsonKey(name: 'attributes')
  List<AttributesProduct>? attributes;

  ItemGrocery(
      {this.id,
      this.sku,
      this.image,
      this.brandId,
      this.supplierId,
      this.price,
      this.cost,
      this.stock,
      this.sold,
      this.minimum,
      this.weight,
      this.length,
      this.width,
      this.height,
      this.kind,
      this.property,
      this.taxId,
      this.status,
      this.sort,
      this.view,
      this.alias,
      this.images,
      this.descriptions,
      this.attributes});
  factory ItemGrocery.fromJson(Map<String, dynamic> json) =>
      _$ItemGroceryFromJson(json);

  Map<String, dynamic> toJson() => _$ItemGroceryToJson(this);

  @override
  List<Object?> get props => [];
}