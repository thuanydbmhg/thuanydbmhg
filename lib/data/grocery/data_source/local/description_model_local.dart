import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
part 'description_model_local.g.dart';
@HiveType(typeId: 1)
class DesCriptionModelLocal extends HiveObject
{
  @HiveField(0)
  int? productId;
  @HiveField(1)
  String? lang;
  @HiveField(2)
  String? name;
  @HiveField(3)
  String? keyword;
  @HiveField(4)
  String? description;
  @HiveField(5)
  String? content;


  DesCriptionModelLocal(
      {this.productId,
      this.lang,
      this.name,
      this.keyword,
      this.description,
      this.content});


}