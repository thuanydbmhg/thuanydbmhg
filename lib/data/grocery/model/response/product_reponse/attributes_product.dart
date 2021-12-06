import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'attributes_product.g.dart';
@JsonSerializable()
class AttributesProduct extends Equatable {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'attribute_group_id')
  int? attributeGroupId;
  @JsonKey(name: 'product_id')
  int? productId;
  @JsonKey(name: 'add_price')
  int? addPrice;
  @JsonKey(name: 'sort')
  int? sort;
  @JsonKey(name: 'status')
  int? status;

  AttributesProduct(
      {this.id,
        this.name,
        this.attributeGroupId,
        this.productId,
        this.addPrice,
        this.sort,
        this.status});

  factory AttributesProduct.fromJson(Map<String, dynamic> json) =>
      _$AttributesProductFromJson(json);

  Map<String, dynamic> toJson() => _$AttributesProductToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [id??0,name??'',attributeGroupId??0,productId??0,addPrice??0,sort??0,status??0];

}
