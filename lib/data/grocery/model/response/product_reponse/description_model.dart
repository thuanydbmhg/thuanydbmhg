import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'description_model.g.dart';
@JsonSerializable()
class DesCriptionModel extends Equatable
{
  @JsonKey(name: 'product_id')
  int? productId;
  @JsonKey(name: 'lang')
  String? lang;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'keyword')
  String? keyword;
  @JsonKey(name: 'description')
  String? description;
  @JsonKey(name: 'content')
  String? content;


  DesCriptionModel(
      {this.productId,
      this.lang,
      this.name,
      this.keyword,
      this.description,
      this.content});

  factory DesCriptionModel.fromJson(Map<String, dynamic> json) =>
      _$DesCriptionModelFromJson(json);

  Map<String, dynamic> toJson() => _$DesCriptionModelToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [productId??0,lang??'',name??'',keyword??'',description??'',content??''];
}