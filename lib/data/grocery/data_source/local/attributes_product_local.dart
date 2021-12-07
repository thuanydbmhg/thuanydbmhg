import 'package:hive/hive.dart';

part 'attributes_product_local.g.dart';

@HiveType(typeId: 0)
class AttributesProductLocal extends HiveObject {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  int? attributeGroupId;
  @HiveField(3)
  int? productId;
  @HiveField(4)
  int? addPrice;
  @HiveField(5)
  int? sort;
  @HiveField(6)
  int? status;

  AttributesProductLocal(
      {this.id,
      this.name,
      this.attributeGroupId,
      this.productId,
      this.addPrice,
      this.sort,
      this.status});
}
