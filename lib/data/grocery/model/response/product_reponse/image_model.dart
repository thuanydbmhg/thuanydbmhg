import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'image_model.g.dart';
@JsonSerializable()
class ImageModel extends Equatable
{
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'image')
  String? image;
  @JsonKey(name: 'product_id')
  int? productId;

  ImageModel({this.id, this.image, this.productId});
  factory ImageModel.fromJson(Map<String, dynamic> json) =>
      _$ImageModelFromJson(json);

  Map<String, dynamic> toJson() => _$ImageModelToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [id??0,image??'',productId??0];
}